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
source("../source/source.R")

shinyServer(function(input, output, session) {

  observeEvent(input$submit,{
    output$Maps = renderPlotly({
      switch(isolate(input$Plot),
             "Happiness Score Map" = happiness_map,
             "Video Game Money Spend per Person Map" = revenue_map)
    })
    
  })
  
})