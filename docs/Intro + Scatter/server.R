library(shiny)
library(plotly)
library(dplyr)
source("chart-sp.R")



server <- function(input, output) { 
  output$scatter <- renderPlotly({
    
    p <- plot_ly(data = vgs_test,
                 x = vgs_test[, input$scorer],
                 y = vgs_test[, input$region],
                 type = "scatter",
                 mode = "markers",
                 opacity = 1,
                 marker = list(size = input$size, color = paste0(input$color, input$alpha, ")"), 
                 line = list(
                   color = paste0("rgba(0,0,0,", input$alpha, ")"), 
                   width = input$outline))) %>%
          layout(title = paste0(input$scorer, " Score", " VS ", input$region, " Sales"),
                 xaxis = list(title = paste0(input$scorer, " Score")),
                 yaxis = list(title = paste0(input$region, " Sales (millions)")))
    return(p)
  })
}
