library(shiny)
library(plotly)

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

ui <- navbarPage(
  "Test",
  intro_panel,
  scatter_panel
)
