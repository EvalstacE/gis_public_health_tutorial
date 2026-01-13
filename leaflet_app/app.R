source("global.R")





##############################
# --- UI ---
ui <- fluidPage(
  titlePanel("Leaflet-Shiny Dashboard"),
  
  leafletOutput("map", height = "600px"),
  
  hr(),

  div(style = "width: 60%; margin: auto;",
      h4("Selected State Statistics:", style = "text-align: center;"),
      tableOutput("state_data")
  )
)


##############################
# ---SERVER ---
server <- function(input, output, session) {
  

output$map <- renderLeaflet({
  
  leaflet(data = map_data) %>%

    addProviderTiles(providers$Esri.WorldGrayCanvas, group = "Esri Gray") %>% 
    addProviderTiles(providers$CartoDB.Positron,     group = "CartoDB Gray") %>% 
    addProviderTiles(providers$CartoDB.DarkMatter,   group = "CartoDB Dark") %>% 
    addProviderTiles(providers$Esri.WorldImagery,    group = "Satellite") %>% 

    addMapPane("states_pane",  zIndex = 250) %>%
    addMapPane("borders_pane", zIndex = 460) %>%
    

    addPolygons(
      group = "State Population",
      layerId = ~NAME, 
      fillColor = ~pop_pal_1(estimate), color = "transparent",      
      weight = 0, 
      fillOpacity = 1,
      options = pathOptions(pane = "states_pane"),
      
      highlightOptions = highlightOptions(
        weight = 2,               
        color = "black",           
        fillOpacity = 1,
        opacity = 1,
        bringToFront = TRUE        
      ),
      
      label = ~lapply(
        paste0(
          "<b>", NAME, "</b><br>",
          "<i> Population:</i> ", 
          scales::comma(estimate, accuracy = 1)
        ), 
        htmltools::HTML
      ),    
      
      labelOptions = labelOptions(
        style = list(
          "background-color" = "white",  
          "color" = "black",              
          "font-size" = "12pt",
          "padding" = "10px",
          "border" = "2px solid black",   
          "border-radius" = "5px",        
          "box-shadow" = "3px 3px 10px rgba(0,0,0,0.5)" 
        ),
        direction = "auto",
        noHide = FALSE 
      )
      
    ) %>% 
    
    
    addPolygons(
      fill = FALSE, 
      color = "black", 
      weight = 0.75, 
      opacity = 1,
      options = pathOptions(pane = "borders_pane", interactive = FALSE)
    ) %>%
    
    addLayersControl(
      baseGroups = c("Esri Gray", "CartoDB Gray", "CartoDB Dark", "Satellite"),
      overlayGroups = c("State Population"), 
      options = layersControlOptions(collapsed = FALSE) 
    ) %>%
    
    addLegend(
      pal = pop_pal_1, 
      values = ~estimate, 
      title = "Population", 
      position = "bottomright", 
      opacity = 1
    )
  
})
  
  
  
  

observeEvent(input$map_shape_click, {
    
    click_id <- input$map_shape_click$id
    selected_poly <- map_data %>% filter(NAME == click_id)
    
    leafletProxy("map") %>%
      clearGroup("selection_highlight") %>%
      addPolygons(
        data = selected_poly,
        group = "selection_highlight", 
        fill = FALSE,                 
        color = "#a91919",             
        weight = 4,                    
        opacity = 1,
        options = pathOptions(
          pane = "borders_pane",      
          interactive = FALSE          
        )
      )
})
  

  
  
output$state_data <- renderTable({
    click <- input$map_shape_click
    if (is.null(click)) {
      return(data.frame(State = "None Selected", Metric = "Welcome!", 
                        Value = "Please click a state on the map to see stats."))
    }
    us_census_final %>%
      filter(NAME == click$id) %>%
      select(State = NAME, Metric = label, Value = formatted_val)
  }, align = "llc", width = "100%", sanitize.text.function = function(x) x)
}

shinyApp(ui, server)