#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(plotly)
library(ggplot2)
library(ggpubr)
source("source.R")
source("chart-sp.R")

shinyServer(function(input, output, session) {

  observeEvent(input$submit,{
    output$Maps = renderPlotly({
      switch(isolate(input$Plot),
             "Happiness Score Map" = happiness_map,
             "Video Game Money Spend per Person Map" = revenue_map)
    })
    
  })
  
  
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
  
  output$Map1 = renderPlotly({
    happiness_map
    
  })
  
  output$Map2 = renderPlotly({
    revenue_map
  })
  output$genreplot = renderPlot({
    build_plot(input$platform)
    
    
    
  })
  output$wiiplot = renderPlot({
    build_plot("Wii")
    
    
    
  })
  output$x360plot = renderPlot({
    build_plot("X360")
    
    
    
  })
  output$pcplot = renderPlot({
    build_plot("PC")
    
    
    
  })
  scatterplot=renderPlot({
    build_plot("Score VS Sales") 
  })
  
})