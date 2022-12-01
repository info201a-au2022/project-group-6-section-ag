library(tidyverse)
library("readxl")
library("knitr")
library("maps")

steam <- read.csv("../data/steam.csv")
sale <- read.csv("../data/Video_Games_Sales_as_at_22_Dec_2016.csv")
happy <- read_excel("../data/Online-data-for-chapter-2-whr-2016.xlsx", sheet = "Figure2.2")
revenues <- read_excel("../data/ObservationData_xinjatc.xlsx")
pop <- read.csv("../data/population_by_country_2020.csv", stringsAsFactors = FALSE)

# Map

# Happiness map
df_happy <- happy %>% 
  select(region = Country, `Happiness score`)

df_happy[df_happy == "United States"] <- "USA"

world <- map_data("world") %>% 
  left_join(df_happy, by = "region")

happiness_map <- ggplot(world) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = `Happiness score`),
    color = "white",
    size = .1 
  )+ labs(title = "Heat map of happiness score for each countries",
          subtitle = "(Light color means higher score, Dark color means lower score)",
          fill = "Happiness Score",
          x = "Longitude",
          y = "Latitude")


revenue <- revenues %>% 
  select(region = `Country Name`, `2017Q1`)

pop <- pop %>% 
  select(region = Country..or.dependency., population = Population..2020.)

revenue[revenue == "United States of America"] <- "USA"
pop[pop == "United States"] <- "USA"

revenue <- left_join(revenue, pop, by = "region")

revenue <- revenue %>% 
  mutate(Revenues_per_person = (`2017Q1` * 1000000)/population)

world2 <- map_data("world") %>% 
  left_join(revenue, by = "region")

revenue_map <- ggplot(world2) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = Revenues_per_person),
    color = "white",
    size = .1 
  ) + labs(title = "Heat map of the amount of money spent on video games per capita",
           subtitle = "(Based on the total video game revenues and population in that country, (revenues/pop))",
           fill = "Money spent on VG per capita",
           x = "Longitude",
           y = "Latitude")
