library(tidyverse)
library("readxl")
library("knitr")

steam <- read.csv("~/info201/Project/project-group-6-section-ag/data/steam.csv")
sale <- read.csv("~/info201/Project/project-group-6-section-ag/data/Video_Games_Sales_as_at_22_Dec_2016.csv")
happy <- read_excel("~/info201/Project/project-group-6-section-ag/data/Online-data-for-chapter-2-whr-2016.xlsx", sheet = "Figure2.2")
revenues <- read_excel("~/info201/Project/project-group-6-section-ag/data/ObservationData_xinjatc.xlsx")
pop <- read.csv("~/info201/Project/project-group-6-section-ag/data/population_by_country_2020.csv", stringsAsFactors = FALSE)

# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:
summary_info <- list()

# Steam
summary_info$steam_observations <- nrow(steam)
summary_info$steam_variables <- ncol(steam)

summary_info$steam_max_date <- steam %>%
  filter(release_date == max(release_date, na.rm = T)) %>%
  select(release_date)

summary_info$steam_min_date <- steam %>%
  filter(release_date == min(release_date, na.rm = T)) %>%
  select(release_date)


summary_info$GS_observations <- nrow(sale)
summary_info$GS_variables <- ncol(sale)

# Game sale
summary_info$GS_platform <- unique(sale$Platform)

summary_info$GS_platform_num <- length(unique(sale$Platform))
  
summary_info$sale_min_date <- sale %>%
  filter(Year_of_Release == min(Year_of_Release, na.rm = T)) %>%
  select(Year_of_Release) %>% 
  tail(1)


summary_info$sale_max_date <- sale %>%
  filter(!str_detect(Year_of_Release, 'N/A')) %>% 
  filter(Year_of_Release == max(Year_of_Release, na.rm = T)) %>%
  select(Year_of_Release)

summary_info$sale_region <- sale %>%
  select(NorthAmerica = NA_Sales, EU = EU_Sales, Japan = JP_Sales, Others = Other_Sales) %>% 
  names()


# Happiness
summary_info$happy_observations <- nrow(happy)

summary_info$happies_country <- happy %>% 
  filter(`Happiness score` == max(`Happiness score`)) %>% 
  select(Country)

summary_info$happies_score <- happy %>% 
  filter(`Happiness score` == max(`Happiness score`)) %>% 
  select(`Happiness score`)

summary_info$unhappy_country <- happy %>% 
  filter(`Happiness score` == min(`Happiness score`)) %>% 
  select(Country)

summary_info$unhappy_score <- happy %>% 
  filter(`Happiness score` == min(`Happiness score`)) %>% 
  select(`Happiness score`)



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
          subtitle = "Light color means higher score, Dark color means lower score",
          fill = "happiness score",
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
  ) + labs(title = "Heat map of amount of money spent on video games per capita",
           subtitle = "(base on the total video game revenues and population in that country, (revenues/pop))",
           fill = "money spend on video game per capita (in dollor)",
           x = "Longitude",
           y = "Latitude")