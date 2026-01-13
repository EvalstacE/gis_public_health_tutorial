# global packages to bring in

pacman::p_load(
  rmarkdown, tidyverse, dplyr, tidyr, ggplot2, eeptools, MMWRweek,
  lubridate, knitr, kableExtra, tinytex, epitools, bookdown, glue,
  ggforce, gridExtra, ggthemes, cowplot, classInt, tidycensus, sf,
  pak, shiny, bslib, ggtext, ggfx, ggnewscale, ggspatial, geogrid, 
  DT, cowplot, patchwork, leaflet, here, tigris, viridis, rcartocolor,
  scales, htmlwidgets, shiny, bslib)

options(scipen = 9999, tigris_use_cache = TRUE)
census_key <- config::get("census_key")
census_api_key(census_key, overwrite = TRUE)


# Bring in other custom helper functions
func_dir <- here::here("functions")
r_files <- list.files(func_dir, pattern = "\\.R$", full.names = TRUE)
purrr::walk(r_files, source)


## global variables for census data pulls
state_code   <- "MT"
counties <- c("Lewis and Clark", "Jefferson", "Broadwater", "Powell", "Meagher")
lc_county <- "Lewis and Clark"
target_years <- c(2013, 2018, 2023)

topic_list <- tribble(
  ~topic,   ~map_filename,
  "Population"  ,  "population_vars_map.csv",
  "Housing"     ,  "housing_vars_map.csv",
  "Income"      ,  "income_vars_map.csv",
  "Education"   ,  "education_vars_map.csv",
  "Employment"  ,  "employment_vars_map.csv",
  "Health"      ,  "health_vars_map.csv"
)