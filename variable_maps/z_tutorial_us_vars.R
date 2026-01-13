

tutorial_us_ref <- tribble(
  ~label,                       ~variable,      ~stat_type,  ~denominator,  ~category,
  
  # --- POPULATION ---
  "Total Population",           "B01003_001",   "count",     NA,            "US Stats",
  
  # --- AGE ---
  "Median Age",                 "B01002_001",   "number",    NA,            "US Stats",
  
  # --- INCOME ---
  "Median Household Income",    "B19013_001",   "currency",  NA,            "US Stats"
)


 write_csv(tutorial_us_ref, here::here("variable_maps/tutorial_us_ref.csv"))
