# === Load and install global packages === #

#---shiny app libraries
library(shiny)
library(shinyWidgets)
library(bslib)
library(bsicons)
library(watcher)
library(htmltools)
library(htmlwidgets)
library(httr)
library(jsonlite)
library(rsconnect)
library(utils)
library(R.utils)
library(promises)
library(future)
library(tools)

#---data wrangling and processing
library(here)
library(readr)
library(dplyr)
library(tidyr)
library(purrr)
library(janitor)
library(stringr)
library(glue)
library(lubridate)
library(magrittr)
library(rlang)
library(scales)
library(zoo)
library(mgcv)

##---markdown files
library(memoise)
library(markdown)

#---plots
library(ggplot2)
library(RColorBrewer)
library(rcartocolor)

#---tables
library(DT)
library(kableExtra)
library(knitr)

#---maps and GIS
library(sf)
library(tigris)
library(tidycensus)
library(leaflet)
library(tidycensus)


options(scipen = 9999, tigris_use_cache = TRUE)


# Bring in other custom helper functions
func_dir <- "functions"
r_files <- list.files(func_dir, pattern = "\\.R$", full.names = TRUE)
purrr::walk(r_files, source)


map_data <- readRDS("map_data.rds")
us_census_final <- readRDS("us_census_final.rds")



pop_pal_1 <- colorNumeric(
  palette = rcartocolor::carto_pal(n = 7, name = "Teal"), 
  domain = map_data$estimate
)

