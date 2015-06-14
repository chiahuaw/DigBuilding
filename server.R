
library(shiny)
library(dplyr)
library(ggplot2)
library(scales)
library(ggmap)
library(leaflet)

f2 <- file("data/buildingGeo.csv",encoding="big5")
building <- read.csv(f2,encoding="big5",stringsAsFactors=F)

shinyServer(function(input, output) {


  
  output$map<-renderLeaflet({
    leaflet() %>%
      addTiles() %>% 
      addMarkers(lng=building$lon,lat=building$lat,popup=paste("建號：",building$建號)) %>%
      setView(lng=118.375,lat=24.445,zoom=11)
  })
  
  
  output$table<-renderDataTable(building) 

})
