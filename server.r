#Summary takeaways, a page that hones in on at least 3 major takeaways from the project
#(which should be related to a specific aspect of your analysis). 
#Feel free to incorporate tables, graphics, or other elements to convey these conclusions. 
#The key goal: Present the key takeaways for your audience.




library(shiny)
library(tidyverse)
library(plotly)
library(ggplot2)
library(ggpubr)
source("source.R")

shinyServer(function(input, output, session) {
  
  output$Map1 = renderPlotly({
    happiness_map
    
  })
  
  output$Map2 = renderPlotly({
    revenue_map
  })
  output$genreplot = renderPlotly({
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
 scatterplot=renderPlotly({
   build_plot("Score VS Sales") 
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
 output$scatter1 <- renderPlotly({
   
   p <- plot_ly(data = vgs_test,
                x = vgs_test[,"User"],
                y = vgs_test[, "Global"],
                type = "scatter",
                mode = "markers",
                opacity = 1,
                marker = list(size = 5, color ="blue" ,
                              line = list(
                                color = "blue", 
                                width = input$outline))) %>%
     layout(title = paste0("User", " Score", " VS ","Global", " Sales"),
            xaxis = list(title = paste0("User", " Score")),
            yaxis = list(title = paste0("Global", " Sales (millions)")))
   return(p)
 })
 output$scatter2 <- renderPlotly({
   
   p <- plot_ly(data = vgs_test,
                x = vgs_test[,"Critic"],
                y = vgs_test[, "Global"],
                type = "scatter",
                mode = "markers",
                opacity = 1,
                marker = list(size = 5, color ="red" ,
                              line = list(
                                color = "red", 
                                width = input$outline))) %>%
     layout(title = paste0("Critic", " Score", " VS ","Global", " Sales"),
            xaxis = list(title = paste0("Critic", " Score")),
            yaxis = list(title = paste0("Global", " Sales (millions)")))
   return(p)
 })
})