
library(shiny)
library(dplyr)
library(leaflet)

shinyUI(navbarPage("金門縣新建案道路挖掘列管",
                   tabPanel("新建案位置檢視",
                            tags$head(
                              # Include our custom CSS
                              includeScript("gomap.js")
                              ),
                          
                            leafletOutput("map"),
                            DT::dataTableOutput(outputId="ziptable")
                            )
                   )
        )
