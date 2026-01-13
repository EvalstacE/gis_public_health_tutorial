



calc_acs_percents <- function(df) {

  required_cols <- c("GEOID", "year", "variable", "estimate", "denominator", "stat_type")
  if (!all(required_cols %in% names(df))) {
    stop("Dataframe is missing required columns (denominator, stat_type, etc.)")
  }

  denom_lookup <- df %>%
    select(GEOID, year, variable, denom_value = estimate) %>%
    distinct(GEOID, year, variable, .keep_all = TRUE) 

  df_calculated <- df %>%
    left_join(denom_lookup, 
              by = c("GEOID", "year", "denominator" = "variable")) %>%
    
    mutate(
      est_percent = case_when(
        stat_type == "count" & !is.na(denom_value) & denom_value > 0 ~ (estimate / denom_value) * 100,
        TRUE ~ NA_real_
      ),

      est_percent = round(est_percent, 2)
    )
  
  return(df_calculated)
}


