
library(shiny)
library(dplyr)
library(leaflet)

shinyServer(function(input, output,session) {

  f2 <- file("data/buildingGeo.csv",encoding="big5")
  building <- read.csv(f2,encoding="big5",stringsAsFactors=F)
  building<-mutate(building,發文日期=as.Date(發文日期)) %>% arrange(.,desc(發文日期))
  
  output$map<-renderLeaflet({
    maps<-leaflet() %>%
      addTiles() %>% 
      addMarkers(lng=building$lon,lat=building$lat,popup=paste("建號：",building$建號)) %>%
      setView(lng=118.375,lat=24.445,zoom=12)
  })
  
  observe({
    if (is.null(input$goto))
      return()
    isolate({
      map <- leafletProxy("map")
      #map %>% clearPopups()
      dist <- 0.0015
      lat <- input$goto$lat
      lng <- input$goto$lon
      map %>% fitBounds(lng - dist, lat - dist, lng + dist, lat + dist)
    })
    })
    output$ziptable <- DT::renderDataTable({
      df <- building %>%
        mutate(Action = paste('<a class="go-map" href="" data-lat="', lat, '" data-long="', lon, '">location</a>', sep=""))
      action <- DT::dataTableAjax(session, df)
      
      DT::datatable(df, options = list(ajax = list(url = action)),escape = FALSE)
    })
    
  
  output$table<-renderDataTable(building) 

})
