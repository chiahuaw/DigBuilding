
library(shiny)
library(dplyr)

shinyUI(navbarPage("金門縣新建案道路挖掘列管",
                   tabPanel("位置檢視",
                            titlePanel("新建案位置檢視"),
#                             selectInput("years",
#                                         "年度",
#                                         choices=c(unique(format(dat$V1,format="%Y")),unique(format(rain$V1,format="%Y"))),#(c("2006","2007","2008","2009","2010","2011","2012","2013","2014","2015")),
#                                         selected="2015"),
#                             selectInput("month",
#                                         "月份",
#                                         choices=c(paste(0,seq(1:9),sep=""),"10","11","12"),
#                                         selected="1"),
#                             downloadButton('downloadData', '下載單年雨量CSV檔'), #下載單年雨量CSV
                            navlistPanel("位置別",
                                         tabPanel("大金門地區",plotOutput("map1Plot")),
                                         tabPanel("烈嶼鄉地區",plotOutput("map2Plot")),
                                         tabPanel("一覽表",dataTableOutput(outputId="table"))
                            )
                            
                   )
)
)
