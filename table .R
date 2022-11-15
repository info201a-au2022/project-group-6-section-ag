gmes_df<-video_games %>% 
  filter(Platform !="") %>%
  group_by(Platform) %>%
  summarize(sales=sum(Global_Sales)) %>% 
  arrange(-sales)
