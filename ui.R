
library(shiny)
library(dplyr)
library(leaflet)

shinyUI(navbarPage("金門縣新建案道路挖掘列管",
                   tabPanel("位置檢視",
                            titlePanel("新建案位置檢視"),
                            navlistPanel("檢視模式選擇",
                                         tabPanel("地圖檢視",leafletOutput("map")),
                                         tabPanel("一覽表",dataTableOutput(outputId="table"))
                                         )
                            
                   )
)
)
