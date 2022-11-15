library(tidyverse)
library("readxl")

steam <- read.csv("../data/steam.csv")
sale <- read.csv("../data/Video_Games_Sales_as_at_22_Dec_2016.csv")
happy <- read_excel("../data/Online-data-for-chapter-2-whr-2016.xlsx", sheet = "Figure2.2")

# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:
summary_info <- list()

# Steam
summary_info$steam_observations <- nrow(steam)
summary_info$steam_variables <- ncol(steam)

summary_info$steam_observations <- prettyNum(summary_info$steam_observations, big.mark = ",", scientific = FALSE)

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

summary_info$GS_observations <- prettyNum(summary_info$GS_observations, big.mark = ",", scientific = FALSE)
