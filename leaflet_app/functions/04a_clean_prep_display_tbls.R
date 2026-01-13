
#--Style Margin of Error text
#--Applies Bootstrap classes for small, italic, grey text
style_moe <- function(text) {
  glue::glue("<span class='small text-muted fst-italic'>{text}</span>")
}

create_format_cols <- function(df, 
                               val_col = "estimate", 
                               pct_col = "est_percent", 
                               year_lag = 4) {
  
  if (!all(c("year", "stat_type") %in% names(df))) {
    stop("Input dataframe must contain 'year' and 'stat_type' columns.")
  }
  
  df %>%
    distinct() %>%
    mutate(
      formatted_val = case_when(
        stat_type == "percent" ~ scales::percent(.data[[val_col]], scale = 1, accuracy = 0.1),
        stat_type == "currency" ~ scales::dollar(.data[[val_col]], accuracy = 1),
        stat_type %in% c("ratio", "rate") ~ as.character(round(.data[[val_col]], digits = 1)),
        stat_type == "year" ~ as.character(.data[[val_col]]),
        TRUE ~ scales::comma(.data[[val_col]], accuracy = 1)
      ),
      
      formatted_pct = case_when(
        stat_type == "count" ~ scales::percent(.data[[pct_col]], scale = 1, accuracy = 0.1), 
        TRUE ~ NA_character_
      ),
      
      slider_label = glue::glue("<b>{year - year_lag} – <br>{year}</b>"),
      year_label = glue::glue("{year - year_lag} – {year}"),
      
      tbl_lbl = case_when(
        
        # --- 1. Calculated Variables -----------------------------------------------
        
        ## Calculated: Count WITH MOE
        str_starts(variable, "Calculated") & stat_type == "count" & !is.na(moe) ~ 
          glue::glue("<b>{formatted_pct}</b> <br>{style_moe(glue::glue('({formatted_val} \u00B1 {scales::comma(moe, accuracy = 1)})'))}"),
        
        ## Calculated: Count WITHOUT MOE (Fallback)
        # Applied style here as well for visual consistency with the Standard Count below
        str_starts(variable, "Calculated") & stat_type == "count" ~ 
          glue::glue("<b>{formatted_pct}</b> <br>{style_moe(glue::glue('({formatted_val})'))}"),
        
        
        # --- 2. Standard Variables (Not Calculated) --------------------------------
        
        ## Standard: Count WITH MOE
        !str_starts(variable, "Calculated") & stat_type == "count" & !is.na(moe) ~ 
          glue::glue("<b>{formatted_pct}</b> <br>{style_moe(glue::glue('({formatted_val} \u00B1 {scales::comma(moe, accuracy = 1)})'))}"),
        
        ## Standard: Percent WITH MOE
        !str_starts(variable, "Calculated") & stat_type == "percent" & !is.na(moe)  ~ 
          glue::glue("<b>{formatted_val}</b> <br>{style_moe(glue::glue('(\u00B1{scales::percent(moe, scale = 1, accuracy = 0.1)})'))}"),
        
        ## Standard: Currency WITH MOE
        !str_starts(variable, "Calculated") & stat_type == "currency"& !is.na(moe) ~ 
          glue::glue("<b>{formatted_val}</b> <br>{style_moe(glue::glue('(\u00B1{scales::dollar(moe, accuracy = 1)})'))}"),
        
        
        # --- 3. Standard Variables Fallbacks (NO MOE) ------------------------------
        
        ## Standard: Count WITHOUT MOE
        # UPDATED: Now wraps the count in the grey/italic style
        !str_starts(variable, "Calculated") & stat_type == "count" ~ 
          glue::glue("<b>{formatted_pct}</b> <br>{style_moe(glue::glue('({formatted_val})'))}"),
        
        ## Standard: Percent WITHOUT MOE
        !str_starts(variable, "Calculated") & stat_type == "percent" ~ 
          glue::glue("<b>{formatted_val}</b>"),
        
        ## Standard: Currency WITHOUT MOE
        !str_starts(variable, "Calculated") & stat_type == "currency" ~ 
          glue::glue("<b>{formatted_val}</b>"),
        
        # --- 4. Catch-all ----------------------------------------------------------
        TRUE ~ formatted_val
      ),
      
      
      wrapped_lbl = str_wrap(label, width = 15),
      wrapped_lbl = str_replace_all(wrapped_lbl, "\n", "<br>")
      
    )
}





##################################
#################################
##--helper functions to prep the display tables

# --- Create + Add Readable Census Table Labels ---
add_census_labels <- function(df) {
  df %>%
    mutate(
      census_survey_lbl = case_when(
        census_survey == "acs"       ~ "American Community Survey (ACS)",
        census_survey == "pep"       ~ "Population Estimates Program (PEP)",
        census_survey == "decennial" ~ "Decennial Census",
        TRUE ~ census_survey
      ),
      
      survey_type_lbl = case_when(
        survey_type == "acs5"             ~ "5-Year Estimates",
        survey_type == "acs1"             ~ "1-Year Estimates",
        survey_type == "pep_vintage_2019" ~ "Vintage 2019 Estimates",
        survey_type == "pep_vintage_2023" ~ "Vintage 2023 Estimates",
        survey_type == "decennial_sf1"    ~ "Summary File 1 (SF1)",
        survey_type == "decennial_dhc"    ~ "Demographic & Housing Characteristics (DHC)",
        TRUE ~ survey_type
      ),
      
      full_tbl_lbl = paste(census_survey_lbl, survey_type_lbl, sep = " - ")
    )
}

