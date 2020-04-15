


library(shiny)
library(rgdal)
library(leaflet)
library(reshape)
library(reshape2)
library(dplyr)
## Chile commune districts  
chile_shape_files <- readOGR(dsn = "./data",layer = "CHL_adm0", verbose = FALSE)
# Define UI for application that draws a histogram
ui <- fluidPage(leafletOutput("map_of_chile",width = "auto", height = "auto")
                ,title = "Chile Map")



### Chile commune districts
###Shape files are from: https://data.humdata.org/dataset/chile-administrative-level-0-country-1-region-region
chile_shape_files <- readOGR(dsn = "./data",layer = "CHL_adm0", verbose = FALSE)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    chile_map<- leaflet(chile_shape_files) %>% addTiles() %>%
        addPolygons(color = "green", weight = 1, smoothFactor = 0.5,
                    opacity = 1.0, fillOpacity = 0.5)
    
    output$map_of_chile <- renderLeaflet(chile_map)
    
}

# Run the application 
shinyApp(ui = ui, server = server)
