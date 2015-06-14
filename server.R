
library(shiny)
library(dplyr)
library(ggplot2)
library(scales)
library(ggmap)

f2 <- file("data/buildingGeo.csv",encoding="big5")
building <- read.csv(f2,encoding="big5",stringsAsFactors=F)

p<-ggmap(get_map(location = c(lon = 118.375, lat = 24.445), zoom = 12, maptype = "terrain"))
p2<-ggmap(get_map(location = c(lon = 118.240, lat = 24.430), zoom = 14, maptype = "terrain"))

shinyServer(function(input, output) {

  output$map1Plot <- renderPlot({

    p+geom_point(data=building,aes(x=lon,y=lat),colour=as.numeric(substr(building$建號,1,3))/2)+
      ggtitle("Where Building is")

  })
  
  output$map2Plot <- renderPlot({
    
    p2+geom_point(data=building,aes(x=lon,y=lat),colour=as.numeric(substr(building$建號,1,3))/2)+
      ggtitle("Where Building is")
    
  })
  
  output$table<-renderDataTable(building) 

})
