library(tidycensus)
library(dplyr)
library(stringr)
library(purrr)
library(readr)
library(here)

# -------------------------------------------------------------------------
# 1. Define Static "Base" Variables
# -------------------------------------------------------------------------
base_map <- tribble(
  ~label,             ~category,      ~stat_type, ~denominator,       ~var_2000,   ~var_2010,   ~var_2020,
  "Total Population", "Population",   "number",    NA,                "P001001",   "P001001",   "P1_001N",
  "Male Total",       "Demographics", "count",    "Total Population", "P012002",   "P012002",   "P12_002N",
  "Female Total",     "Demographics", "count",    "Total Population", "P012026",   "P012026",   "P12_026N"
)

# -------------------------------------------------------------------------
# 2. Function to Generate Age/Sex Detail (FIXED)
# -------------------------------------------------------------------------
generate_decennial_age_sex <- function() {
  
  message("Fetching metadata for 2000, 2010, and 2020...")
  
  # --- Helper: Fetch and Clean One Year ---
  get_clean_vars <- function(year, dataset, code_pattern) {
    load_variables(year, dataset, cache = TRUE) %>%
      # STRICT FILTER: Only match the specific table pattern
      filter(str_detect(name, code_pattern)) %>%
      mutate(
        # Robust Label Cleaning
        clean_label = label %>% str_remove_all("!!|:|Estimate"),
        
        sex = case_when(
          str_detect(clean_label, "Male") & !str_detect(clean_label, "Female") ~ "Male",
          str_detect(clean_label, "Female") ~ "Female",
          TRUE ~ "Total"
        ),
        
        age_group = clean_label %>% 
          str_remove("Total") %>% 
          str_remove("Male") %>% 
          str_remove("Female") %>% 
          str_trim(),
        
        final_label = paste(sex, age_group) %>% str_squish()
      ) %>%
      # Keep only valid age buckets (ignore summary rows like "Male Total")
      filter(sex %in% c("Male", "Female"), age_group != "") %>%
      select(final_label, variable = name)
  }
  
  # --- Fetch All Years (UPDATED REGEX) ---
  
  # 2000 & 2010 (SF1): Use "^P012[0-9]" to match P012001 but EXCLUDE P012A001
  vars_2000 <- get_clean_vars(2000, "sf1", "^P012[0-9]")
  vars_2010 <- get_clean_vars(2010, "sf1", "^P012[0-9]")
  
  # 2020 (DHC): Use "^P12_" to match P12_001N but EXCLUDE P12A_001N
  vars_2020 <- get_clean_vars(2020, "dhc", "^P12_")
  
  # --- Join Them Together ---
  combined_map <- vars_2020 %>%
    rename(var_2020 = variable) %>%
    
    # Inner Join is safer here to ensure we only get ages that exist in ALL years
    inner_join(vars_2010, by = "final_label") %>%
    rename(var_2010 = variable) %>%
    
    inner_join(vars_2000, by = "final_label") %>%
    rename(var_2000 = variable) %>%
    
    mutate(
      label       = final_label,
      category    = "Age Sex Detail",
      stat_type   = "count",
      denominator = "Total Population" 
    ) %>%
    select(label, category, stat_type, denominator, var_2000, var_2010, var_2020)
  
  return(combined_map)
}

# -------------------------------------------------------------------------
# 3. Execution & Save
# -------------------------------------------------------------------------

detailed_map <- generate_decennial_age_sex()

final_decennial_map <- bind_rows(base_map, detailed_map)

# Check for duplicates before saving
if (nrow(final_decennial_map) > 200) {
  warning("Table is still too large! Check regex.")
} else {
  write_csv(final_decennial_map, here("variable_maps/decennial_vars_map.csv"))
  message("✅ Generated 'decennial_vars_map.csv' with ", nrow(final_decennial_map), " unique variables.")
}


write_csv(final_decennial_map, here("variable_maps/final_decennial_map.csv"))
