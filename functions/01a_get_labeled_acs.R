

get_labeled_acs <- function(ref_table, counties, state = "MT", years = target_years, survey_type = "acs5", 
                            geo_level = "county") {
  
  vars_dp <- ref_table %>% filter(str_starts(variable, "DP")) %>% pull(variable)
  vars_s  <- ref_table %>% filter(str_starts(variable, "S")) %>% pull(variable)
  vars_b  <- ref_table %>% filter(!str_starts(variable, "DP") & !str_starts(variable, "S")) %>% pull(variable)
  
  map_dfr(years, function(y) {
    message(paste(">>> Fetching data for", y, "..."))
    results_list <- list()

    if (length(vars_b) > 0) {
      tryCatch({ 
        results_list[["B"]] <- get_acs(
          geography   = geo_level, 
          state       = state, 
          county      = counties, 
          year        = y, 
          survey      = survey_type,
          variables   = vars_b, 
          output      = "tidy", 
          cache_table = TRUE, 
          show_call   = FALSE
        ) 
      }, error = function(e) message(paste("   [!] B-Table batch failed for", y, ":", e$message)))
    }

    if (length(vars_dp) > 0) {
      tryCatch({ 
        results_list[["DP"]] <- get_acs(
          geography   = geo_level, 
          state       = state, 
          county      = counties, 
          year        = y, 
          survey      = survey_type,
          variables   = vars_dp, 
          output      = "tidy", 
          cache_table = TRUE, 
          show_call   = FALSE
        ) 
      }, error = function(e) message(paste("   [!] DP-Table batch failed for", y, ":", e$message)))
    }

    if (length(vars_s) > 0) {
      tryCatch({ 
        results_list[["S"]] <- get_acs(
          geography   = geo_level, 
          state       = state, 
          county      = counties, 
          year        = y, 
          survey      = survey_type,
          variables   = vars_s, 
          output      = "tidy", 
          cache_table = TRUE, 
          show_call   = FALSE
        ) 
      }, error = function(e) message(paste("   [!] S-Table batch failed for", y, ":", e$message)))
    }

    if (length(results_list) == 0) {
      warning(paste("!!! All batches failed for year", y))
      return(NULL)
    }

    combined_data <- bind_rows(results_list)

    distinct_geos <- combined_data %>% distinct(GEOID, NAME)
    
    full_grid <- expand_grid(
      distinct_geos,
      variable = ref_table$variable
    )
    
    full_grid %>%
      left_join(combined_data, by = c("GEOID", "NAME", "variable")) %>%
      mutate(year = y, join_id = str_remove(variable, "E$")) %>%
      left_join(ref_table %>% mutate(join_id = str_remove(variable, "E$")), 
                by = "join_id", relationship = "many-to-many") %>%
      
      mutate(
        variable = coalesce(variable.y, variable.x),
        census_survey = "acs",
        survey_type = survey_type
        
        ) %>%

      select(
        GEOID, 
        NAME, 
        census_survey,
        survey_type,
        year, 
        category, 
        label, 
        variable, 
        estimate, 
        moe, 
        stat_type, 
        denominator
      )
  })
}



