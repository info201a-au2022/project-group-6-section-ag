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