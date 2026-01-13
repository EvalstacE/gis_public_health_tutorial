bind_education_summary <- function(census_df) {
  
  edu_base <- census_df %>%
    filter(
      survey_type == "acs5", 
    !str_detect(NAME, "Census Tract"),
      str_detect(variable, "B15003")
    )
  
  edu_wide <- edu_base %>%
    select(GEOID, NAME, year, survey_type, census_survey, variable, estimate) %>%
    pivot_wider(names_from = variable, values_from = estimate, values_fill = 0)
  
  edu_calculated <- edu_wide %>%
    transmute(
      GEOID, NAME, year, survey_type, census_survey,
  
      denom_val = B15003_001, 
      
      # Less than high school diploma (002 through 016)
      `Less than high school diploma` = rowSums(across(c(B15003_002:B15003_016))),
      
      # High school graduate (includes equivalency) (017 + 018)
      `High school graduate (includes equivalency)` = B15003_017 + B15003_018,
      
      # Some college or associate's degree (019 + 020 + 021)
      `Some college or associate's degree` = B15003_019 + B15003_020 + B15003_021,
      
      # Bachelor's degree or higher (022 through 025)
      `Bachelor's degree or higher` = rowSums(across(c(B15003_022:B15003_025))),
      
      # High School Graduate or higher (022 through 025)
      `High school graduate or higher` = rowSums(across(c(B15003_017:B15003_025)))
    )
  
  summary_rows <- edu_calculated %>%
    pivot_longer(
      cols = -c(GEOID, NAME, year, survey_type, census_survey, denom_val),
      names_to = "label",
      values_to = "estimate"
    ) %>%
    mutate(
      variable = paste0("Calculated: ", label), 
      category = "Education",
      est_percent = 100 * estimate / denom_val, 
      stat_type   = "count", 
      denominator = "B15003_001",
      moe         = NA_real_ 
    ) %>%
    rename(denom_value = denom_val) 
  
  final_df <- bind_rows(census_df, summary_rows)
  
  return(final_df)
}