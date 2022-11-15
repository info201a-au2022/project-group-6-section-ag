library(tidyverse)

video_games<-read.csv("../data/Video_Games_Sales_as_at_22_Dec_2016.csv")

gmes_platform<-video_games %>% 
  filter(Platform !="") %>%
  group_by(Platform) %>%
  summarize(Sales=sum(Global_Sales)) %>% 
  arrange(-Sales)
