install.packages("ggplot2")
setwd("/Users/kaiaarmas/Desktop")
video_games<-read.csv("Video_Games_Sales_as_at_22_Dec_2016.csv")
gmes_df<-video_games %>% 
  filter(Genre !="") %>%
  group_by(Genre) %>%
  summarize(sales=sum(Global_Sales)) 

genretosales<-ggplot(gmes_df,
  aes(x=Genre,y=sales)) +
  geom_bar(position = "dodge",stat = "identity")
 
genretosales


