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
library(markdown)
source("source.R")
source("chart-sp.R")

shinyServer(function(input, output, session) {
  
  output$map_summ <- renderUI({           
    includeMarkdown(knitr::knit('map.Rmd'))          
  })
  
  output$report <- renderUI({           
    includeMarkdown(knitr::knit('P1P.Rmd'))          
  })
  
  output$genre_summ <- renderUI({           
    includeMarkdown(knitr::knit('genre.Rmd'))          
  })

  observeEvent(input$submit,{
    output$Maps = renderPlotly({
      switch(isolate(input$Plot),
             "Happiness Score Map" = happiness_map,
             "Video Game Money Spend per Person Map" = revenue_map)
    }) # Learned from A5, and I got this idea about submit button idea here: https://stackoverflow.com/questions/69414472/select-plot-from-a-dropdown-menu-in-rshiny
    
    
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
  output$genreplot = renderPlotly({
    build_plot(input$platform)
    
    
    
  })
  output$wiiplot = renderPlotly({
    build_plot("Wii")
    
    
    
  })
  output$x360plot = renderPlotly({
    build_plot("X360")
    
    
    
  })
  output$pcplot = renderPlotly({
    build_plot("PC")
    
    
    
  })
  output$scatterplot=renderPlotly({
    p <- plot_ly(data = vgs_test,
                 x = vgs_test[, "Critic"],
                 y = vgs_test[, "Global"],
                 type = "scatter",
                 mode = "markers",
                 opacity = 1,
                 marker = list(size = 10, 
                               line = list(
                                 color = "rgba(10, 150, 255,0.3", 
                                 width = 0))) %>%
      layout(title = paste0(input$scorer, " Score", " VS ", input$region, " Sales"),
             xaxis = list(title = paste0("Critic", " Score")),
             yaxis = list(title = paste0("Global", " Sales (millions)")))
    return(p)
  })
  
})
