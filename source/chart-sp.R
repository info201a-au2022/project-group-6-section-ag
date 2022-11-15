library(tidyverse)

vgs <- read.csv("../data/Video_Games_Sales_as_at_22_Dec_2016.csv")

vgs_test <- vgs %>% mutate(User_Score = as.numeric(User_Score)) %>% mutate(User_Score = na_if(User_Score, "tbd")) %>% drop_na()

plot_user <- ggplot(data = vgs_test) + ggtitle("Global Sales of Video Games Vs. Metacritic User Score") +
  xlab("User Score (Metacritic)") + ylab("Global Sales (millions)") +
  geom_point(mapping = aes(
    x = User_Score,
    y = Global_Sales
    ), alpha = .2) +
  coord_cartesian(ylim = c(0,10)) +
  geom_smooth(method="gam", formula = y ~s(x), color = "red", mapping = aes(
    x = User_Score,
    y = Global_Sales
  ))

plot_critic <- ggplot(data = vgs_test) + ggtitle("Global Sales of Video Games Vs. Metacritic Critic Score") +
  xlab("Critic Score (Metacritic)") + ylab("Global Sales (millions)") +
  geom_point(mapping = aes(
    x = Critic_Score,
    y = Global_Sales
  ), alpha = .2) +
  coord_cartesian(ylim = c(0,10)) +
  geom_smooth(method="gam", formula = y ~s(x), color = "red", mapping = aes(
    x = Critic_Score,
    y = Global_Sales
  ))
