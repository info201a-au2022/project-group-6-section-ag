library(tidyverse)

video_games<-read.csv("../data/Video_Games_Sales_as_at_22_Dec_2016.csv")

gmes_df<-video_games %>% 
  filter(Genre !="") %>%
  group_by(Genre) %>%
  summarize(sales=sum(Global_Sales)) 

genretosales<-ggplot(data = gmes_df,
                     aes(x=Genre,y=sales)) +
  geom_bar(position = "dodge",stat = "identity", fill="steelblue") + 
  scale_x_discrete(guide = guide_axis(n.dodge = 2)) +
  labs(title = "Genre Vs. Sales (millions)", y = "Sales")

genretosales


