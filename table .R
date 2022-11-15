gmes_df<-video_games %>% 
  filter(Genre !="") %>%
  group_by(Genre) %>%
  summarize(sales=sum(Global_Sales)) 