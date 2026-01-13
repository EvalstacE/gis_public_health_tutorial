load_and_transform_county_geoms <- 
  
  function(folder = "data/shapefiles") {
    shapefiles <- c(
      five_counties = "five_counties", 
      lcc_tracts    = "lcc_tracts"
    )
    
    purrr::imap(shapefiles, function(file_name, obj_name) {
      read_sf(here(folder, file_name)) %>%
        st_transform(crs = 4326)
    })
  }
