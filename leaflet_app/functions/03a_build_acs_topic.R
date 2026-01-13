
build_acs_topic <- function(topic_name, map_filename, counties, state, years, survey_type = "acs5", geo_level = "county") {
  
  full_path <- here("variable_maps", map_filename)
  message(paste("\n=== PROCESSING TOPIC:", topic_name, "(", survey_type, ") ==="))

  if (!file.exists(full_path)) {
    warning(paste("Map file not found:", full_path))
    return(NULL)
  }

  ref_table <- read_csv(full_path, show_col_types = FALSE)

  if (!all(c("stat_type", "denominator") %in% names(ref_table))) {
    stop("CSV is missing 'stat_type' or 'denominator' columns!")
  }

  raw_data <- get_labeled_acs(ref_table, counties, state, years, survey_type, geo_level)
  
  if (is.null(raw_data)) return(NULL)
  message(paste("Columns returned by fetch:", paste(names(raw_data), collapse=", ")))

  clean_data <- calc_acs_percents(raw_data)
  
  message(paste("Successfully processed", nrow(clean_data), "rows."))
  return(clean_data)
}
