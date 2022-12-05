library(tidyverse)

vgs <- read.csv("Video_Games_Sales_as_at_22_Dec_2016.csv")

vgs_test <- vgs %>% mutate(User_Score = na_if(User_Score, "tbd")) %>% drop_na() %>% mutate(User_Score = as.numeric(User_Score))

vgs_test <- vgs_test %>%
  mutate(EU = EU_Sales) %>%
  mutate("NA" = NA_Sales) %>%
  mutate(JP = JP_Sales) %>%
  mutate(Other = Other_Sales) %>%
  mutate(Global = Global_Sales) %>%
  mutate(Critic = Critic_Score) %>%
  mutate(User = User_Score)