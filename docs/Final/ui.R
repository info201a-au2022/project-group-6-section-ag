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
source("source.R")
source("chart-sp.R")

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

intro_content <- mainPanel(
  HTML('
  <div id = "heroimage">
    <img src= "https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80" alt="people playing video games">
  </div>
  <div class ="intro">
  <h1 style = "font-size:30px;font-style: italic;">Introduction</h1>
    <p style = "font-size:18px;">
    Video games are played everywhere in the world. We play video games because they are fun and bring people joy. For our project, we are analyzing video games. We want to understand what types of video games that people play and enjoy, and find differences between those in different regions around the world. By analyzing these, we can find out what exactly most people enjoy about video games, and help stakeholders like developers make those games. We understand that people play video games for enjoyment, but we also want to see if playing video games also has some other benefits. Happiness is a fundamental need for a person to live, so we will be looking into the relationship between video games and happiness. To be able to answer our questions, we are looking into several datasets, such as Video game sales and ratings, Steam store data, and the World Happiness report. Some key findings that we have identified are that games that are rated highly by the players also sell well, regions that have higher happiness scores also have more video games sold, and genres that a lot of people buy and enjoy are action and sport games. 
    </p>
  </div>'),
  tags$style(HTML('
  #heroimage{
    text-align: center;
    margin: auto;
    width: 85%;
  }
  #heroimage img{
    height: 500px;
    object-fit: cover;
    width: 100%;
    max-width: 1080px;
  }
  div.intro{
    margin: auto;
    width: 75%;
  }
  div.intro h1{
    text-align: center;
    margin-bottom: 25px
  }
'
  ))
)

intro_panel <- tabPanel(
  "Overview",
  titlePanel("Study of Video Games"),
  verticalLayout(
    intro_content
  )
)

scatter_sidebar_content <- sidebarPanel(
  selectInput(
    inputId = "scorer",
    label = "Reviewer",
    choices = list("Critic", "User"),
    selected = "Critic"),
  selectInput(
    inputId = "region",
    label = "Region Sales",
    choices = list("NA", "EU", "JP", "Other", "Global"),
    selected = "Global"),
  selectInput(
    inputId = "color",
    label = "Color",
    choices = list("Blue" = "rgba(10, 150, 255,", "Red" = "rgba(240, 0, 0,", "Green" = "rgba(50,255,150,", "Yellow" = "rgba(255,240,125,", "Black" = "rgba(0,0,0,"),
    selected = "Blue"),
  sliderInput(
    inputId = "size",
    label = "Size",
    min = 1, max = 20, value = 10),
  sliderInput(
    inputId = "alpha",
    label = "Alpha",
    min = 0, max = 1, value = 0.3),
  selectInput(
    inputId = "outline",
    label = "Outline",
    choices = list("Yes" = "1", "No" = "0"),
    selected = "0")
)

scatter_main_content <- mainPanel(
  plotlyOutput("scatter")
)

scatter_summary_content <- mainPanel(
  HTML('
  <div class="scatter-summary">
    <h1 style="font-size:30px;">Summary</h1>
    <p style="font-size:18px;">
    To be able to look at the relationship between video game sales and the player’s rating, we decided to use a scatter plot. The rating of a video game can tell us the enjoyment the game provided to the player. By looking at a scatter plot, we can identify if there are any correlations between what a video game scored and how well it sold. In the plot, we can see that the majority of games sell between 0 and 10 million, with some outliers selling over 10 million. By looking in the range where the majority of the games are, we can better see the way how scores and sales of video games correlate. We can see that as video games score higher, the sales also increase. From this, we can infer that if players enjoy a game, it will sell better.
    </p>
  </div>')
)

scatter_panel <- tabPanel(
  "Scatter",
  titlePanel("Scatter plot: Score VS Sales"),
  sidebarLayout(
    scatter_sidebar_content,
    scatter_main_content),
  verticalLayout(
    scatter_summary_content
  )
)

summ_main <- mainPanel(
  p("In this project we investigated the corolation between happiness and video games. In order to 
    do this we generated a heat map. 
    Here we summarize the major takeaways of this project"),
  h3("Takeaway1: Relationship Betwen Video Game Expenditure and Happiness"),
  p("The first question that we asked was: How does video game expenditure affect the happiness score for a region? 
  In order to answer this question we used two datasets. This first dataset was a dataset that 
  gave us the amount spent on video games on Steam by region (https://www.kaggle.com/datasets/nikdavis/steam-store-games?select=steam.csv). The 
  second dataset was a dataset that gave us the happiness of different countries across the world (https://worldhappiness.report/ed/2019/). 
  For this second dataset,  the happiness was measured from survey results where the participants were asked to 
  rate their overall happiness from 1 to 10.  We then decided to develop heatmaps of the video game expenditure and happiness scores 
  for countries across the world so that we could see if there were any correlation  between the two. From this we found that a higher 
  video game expenditure seems to be roughly correlated with a higher happines score for a country.This correlation is exhibited 
    well across several continents including North America, Europe, Australia, and Africa. The first three of these continents have 
    both a higher than average expenditure on video games and a higher than average happiness score. Africa on 
    the other hand has both a lower than average expenditure on video games and a 
    lower than average happiness score. In contrast, there are also 
    several continents that do not exhibit this correlation very well. 
    For example, many countries in both South America and Asia have a relatively 
    low expenditure on video games, but either average or above average happiness scores.
    Although there does seem to be some  correlation between video game expenditures and happiness scores, 
    the weakness of the correlation and the likeliness of confounding factors 
    (e.g., the wealth of the nation contributing positively to both video game expenditure and 
    happiness scores) make it seem unlikely that there is a direct causal relationship 
    between the two."),
  plotlyOutput(outputId = "Map1",
               width = "600px",
               height = "300px"),
  plotlyOutput(outputId = "Map2",
               width = "600px",
               height = "300px"),
  h3("Takeaway2: Genre Popularity by Platform"),
  p("The second question that we asked was: How does genre affect video game popularity and 
  how does this differ across different platforms? In order to answer this question, we used a 
  publicly available dataset that provided us with video game titles, their total sales, their genre, and the platform 
  that they are on (https://www.kaggle.com/datasets/rush4ratio/video-games-sales-with-ratings). We then 
  used this data to find the popularity of video game genres on different platforms by using the total sales of 
  games of each genre on that platform. From this we found that different platforms differ greatly in what genres are popular. 
  For example, for the Wii, the most popular genre is sports and shooter is one of the least popular genres. Conversely, for the 
    Xbox 360 and PC, shooter is one of the most popular genres whereas sports is 
    either somewhat popular or unpopular. The reason that this data is 
    significant, is that it could be useful to people who are looking to 
    purchase a gaming system by helping them to decide which gaming system is 
    right for them. For example, someone who really loves puzzle games should 
    probably not purchase an Xbox 360 because puzzle games are very unpopular on this 
    platform which means there are probably not a lot of puzzle games available to be 
    played on the Xbox 360. "),
  plotOutput("wiiplot"),
  plotOutput("x360plot"),
  plotOutput("pcplot"),
  
  h3("Takeaway3: Correlation Between Video Game Ratings to Sales"),
  p("
  The last question that we asked is: How does video game ratings affect its sales? To answer this question, we used the same 
  dataset as in part 2  which also provides the user and critic ratings for each game 
  (https://www.kaggle.com/datasets/rush4ratio/vido-games-sales-with-ratings). We then decided to make two scatter plots to demonstrate any correlation between score and scales. From this we found thatvideo game ratings are 
  positively correlated with video game sales. We decided to use a scatter plot to show the 
  relationship between video game sales to user and critic’s ratings. We decided to do this 
  because we wanted to see if there are any correlations between what a video game scores 
  and how many sales are produced. This plot is zoomed in to between 0 and 10 million sales 
  because that is where the majority of the data is, with there being some outliers way 
  outside the range. Looking at the plot, we can see that global sales tend to increase as ratings 
  increase. Looking at the scatter plot, we can see that both user scores and critic's scores have a positive 
  correlation with the number of sales. However, critic's scores appear to have a greater positive 
  correlation with the number of sales especially at the higher range of critic's scores (80-100). For this higher 
  range we can see that a higher critic score seems to be associated with a much higher amount of global sales.
 
"),
  plotOutput("Score VS Sales")  
  
)
summ_panel <- tabPanel(
  "Summary",
  
  titlePanel("Summary"),
  
  verticalLayout(
    summ_main
  )
)
genre_side<-sidebarPanel(
  selectInput("platform","platform",platforms)
  
  
)
genre_main<-mainPanel(
  plotOutput("genreplot") 
)
Genre_panel<-tabPanel(
  "Genre Sales",
  titlePanel(
    "Genre Sales"
  ),
  sidebarLayout(genre_side,genre_main)
)


shinyUI(fluidPage(navbarPage("Video Game", 
                             intro_panel,
                             Genre_panel,
                             scatter_panel,
                             map_panel,
                             summ_panel)
                  )
        )



