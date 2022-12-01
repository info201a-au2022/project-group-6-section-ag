#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)


map_sidebar <- sidebarPanel(
  selectInput("Plot", "Select a Map", 
              choices = c( "Happiness Score Map",
                           "Video Game Money Spend per Person Map")),
  actionButton("submit", "Submit")
  
)

map_main <- mainPanel(
  plotlyOutput(outputId = "Maps",
               width = "1200px",
               height = "600px")
)


map_panel <- tabPanel(
  "Maps",
  
  titlePanel("Money Spend on Game vs Happiness Score"),
  
  sidebarLayout(
    map_sidebar,
    map_main
  )
)

# Define UI for application that draws a histogram
shinyUI(fluidPage(navbarPage("Video Game", 
                             map_panel)
                  )
        )



