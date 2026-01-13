library(tibble)
library(dplyr)

# -------------------------------------------------------------------------
#   Define Master Mapping Table
# -------------------------------------------------------------------------

census_ref_detail_data <- tribble(
  ~label,                    ~variable,     ~stat_type, ~denominator,   ~category,
  
  # --- POPULATION: TOTALS ---
  "Total Population",        "B01003_001",  "denom",    NA,             "Population",
  "Median Age (Total)",      "B01002_001",  "median",   NA,             "Population",
  "Median Age (Male)",       "B01002_002",  "median",   NA,             "Population",
  "Median Age (Female)",     "B01002_003",  "median",   NA,             "Population",
  
  # --- POPULATION: SEX TOTALS (Roots for Pyramid) ---
  "Total Male",              "B01001_002",  "count",    "B01003_001",   "Demographics",
  "Total Female",            "B01001_026",  "count",    "B01003_001",   "Demographics",
  
  # --- INCOME: SUMMARY ---
  "Median Household Income", "B19013_001",  "currency", NA,             "Economics",
  "Total Households",        "B19001_001",  "denom",    NA,             "Economics",
  
  # --- INCOME: BRACKETS (Clean Labels) ---
  "Less than $10,000",       "B19001_002",  "count",    "B19001_001",   "Income Brackets",
  "$10,000 to $14,999",      "B19001_003",  "count",    "B19001_001",   "Income Brackets",
  "$15,000 to $19,999",      "B19001_004",  "count",    "B19001_001",   "Income Brackets",
  "$20,000 to $24,999",      "B19001_005",  "count",    "B19001_001",   "Income Brackets",
  "$25,000 to $29,999",      "B19001_006",  "count",    "B19001_001",   "Income Brackets",
  "$30,000 to $34,999",      "B19001_007",  "count",    "B19001_001",   "Income Brackets",
  "$35,000 to $39,999",      "B19001_008",  "count",    "B19001_001",   "Income Brackets",
  "$40,000 to $44,999",      "B19001_009",  "count",    "B19001_001",   "Income Brackets",
  "$45,000 to $49,999",      "B19001_010",  "count",    "B19001_001",   "Income Brackets",
  "$50,000 to $59,999",      "B19001_011",  "count",    "B19001_001",   "Income Brackets",
  "$60,000 to $74,999",      "B19001_012",  "count",    "B19001_001",   "Income Brackets",
  "$75,000 to $99,999",      "B19001_013",  "count",    "B19001_001",   "Income Brackets",
  "$100,000 to $124,999",    "B19001_014",  "count",    "B19001_001",   "Income Brackets",
  "$125,000 to $149,999",    "B19001_015",  "count",    "B19001_001",   "Income Brackets",
  "$150,000 to $199,999",    "B19001_016",  "count",    "B19001_001",   "Income Brackets",
  "$200,000 or more",        "B19001_017",  "count",    "B19001_001",   "Income Brackets"
)


generate_detailed_age_sex <- function(year = 2023) {
  
  # 1. Load variables
  vars <- load_variables(year, "acs5", cache = TRUE)
  
  # 2. Filter & Clean
  vars %>%
    filter(str_detect(name, "^B01001_")) %>%
    # Exclude the summary totals
    filter(!name %in% c("B01001_001", "B01001_002", "B01001_026")) %>%
    mutate(
      # A. Identify Sex
      sex_group = if_else(str_detect(label, "Male"), "Male", "Female"),
      
      # B. Clean the Label
      # This regex removes "Estimate", "Total", "Male", "Female" 
      # and any combination of "!!" or ":" surrounding them.
      age_label = label %>% 
        str_remove_all("Estimate!!|Total[:!]*|Male[:!]*|Female[:!]*") %>%
        str_trim(),
      
      # C. Create Final Clean Name
      # e.g. "Male" + "Under 5 years" -> "Male Under 5 years"
      label = paste(sex_group, age_label),
      
      # D. Assign Standard Columns
      variable    = name,
      stat_type   = "count",
      denominator = "B01003_001", # Calculates as % of Total Population
      category    = "Age Sex Detail"
    ) %>%
    select(label, variable, stat_type, denominator, category)
}


# Generate the detailed rows
dynamic_age_sex <- generate_detailed_age_sex(year = 2023)

# Bind them together
final_detailed_map <- bind_rows(census_ref_detail_data, dynamic_age_sex)

write_csv(final_detailed_map, here("variable_maps/detailed_vars_map.csv"))
