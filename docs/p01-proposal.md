## Project Proposal

Code name: Video Game-1

Project title: Study of Video Games

Authors:

Jimmy Yang, xyang23@uw.edu

Gordon Tran, gotran@uw.edu

Kaia Armas, karmas@uw.edu

Affiliation: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

Date: Autumn 2022

## Abstract:
Our main question is what types of video games people enjoy, the differences in regions, and how they can benefit people. This question is important because we want to be able to help people choose the games they like, tell the cultural difference in the regions across the world, and we find out how video games can benefit people. To address the question, we will look into video game sales, ratings, and World Happiness scores.

## Keywords:
Video Games, Sales,  Mental health, Culture

## Introduction:
For our project, we are analyzing video games. We want to know about the types of video games that people play and enjoy and the differences in games that people enjoy between different regions across the world. We also want to find out if video games have some positive benefits, such as improving the mental health of the players and making them happier. We will be looking into different datasets, such as video game sales, Steam games, and the World Happiness Report. Some of the things we want to identify are the most popular games in each region if there is a correlation between ratings and sales, and how video games relate to the World Happiness score. By looking into the datasets, we hope to be able to find the answer to our questions.

## Problem Domain:
### Background:
We live in a society full of pressure from work, school, etc. One way people relieve these pressures is by playing video games; a good video game can not only help people relieve stress but also be good for mental health.

### Human Values:
A good video game can also help players to learn about different cultures, and some games with morality options given to players to decide can develop players’ positive personal values. Players can play video games to relieve boredom and video games like Minecraft can ignite players’ creativity. One of the ways to determine the popularity of a game is through sales. From this, we can infer if a game is good or not. By doing so, we can help people choose the best game. We can also identify differences in cultures through the sales by looking at what kind of games are popular in different regions. Also, we are facing a huge economic issue due to COVID-19 and Russo-Ukrainian War, and game sales are a considerable part of the world’s economy.

### Direct and Indirect Stakeholders:
Some direct stakeholders can be friends or family. Video games can also help people build connections with friends and family. Families can also be an indirect stakeholder because video games might help improve the player’s mental health, then their families are also affected (4).
Another purpose of our project is to help developers, which is another direct stakeholder, to create better games and earn more money. There are different types of games, such as shooter and role play, and they're always more people who like one specific type of game than others. By analyzing video game sales data, we can tell which type of game is more popular and help developers to determine what types of games they should focus on.

### Potential Benefits and Harms:
Some benefits of video games are that it can relieve stress, boredom and improve mental health. Video games can help with people’s creativity. Developers can use our findings to their benefit by understanding what kind of games that people like and make games like that. As we mentioned above, video games have lots of benefits, but they also have some harms. One of our goals for this project is to help people choose the right game they are interested in, but this might cause a problem of video game addiction (5). Our analysis may also include games with violent elements, which might have negative effects on others (1).


## Research Questions:

- What is the most popular video game genre?

	Importance: This question can help us figure out which genre of game people most enjoy.

	Motivation: We are striving to show the different types of video games and how they differ from each other and to see which genre of game is most popular. We can then understand what people on different platforms prefer in terms of video games.

- What is the correlation between the rating of a video game to the sales of the video game?

	Importance: By comparing the rating of a video game to the sales of the video game, we can see how the reception of a video game affects the sales.

	Motivation: By seeing the correlation between sales and ratings, we can have a better understanding of how people view video games, and it can help developers plan their games.

- How does amount of money spend on video game relate to the World Happiness score? Does the the people live in a region with a higher happiness score spend more money on gaming?

	Importance: We want to be able to see if the sales of video games have an effect on the World Happiness score.

	Motivation: By looking at the World Happiness score and sales of video games, we might be able to see a correlation between the two, and we are able to see the benefits of playing video games.


## The Dataset:
### Video Game Sales with Ratings
[Video Game Sales with Ratings dataset](https://www.kaggle.com/datasets/rush4ratio/video-game-sales-with-ratings)

This dataset is called “Video Game Sales with Ratings,” and it has 16,719 observations and 16 variables. This dataset is about game sales; we are planning to use this dataset to help us answer most of our questions. We will use the dataset to find out what types of game and platform are more popular in different regions and find the relationship between game sales and World Happiness score.

This dataset is an extension of another dataset called “Video Game Sales.” The “Video Game Sales” dataset was collected from VGChartz, a website that collects game sales data. The website claims that they only record the official shipment/sales data; those data are provided by the developers and publishers. So if they are telling the truth, then it's trustworthy. This dataset is on Kaggle, and it’s one of the best in Kaggle (7th vote). The “Video Game Sales with Ratings” dataset, created by Rush Kirubi, shares columns with the “Video Game Sales” dataset but includes some additional variables collected from Metacritic, a very popular and reputable game rating website. This dataset can benefit the gamers that want to find the game that they are interested in and might be able to help the author to gain some followers and Kaggle will have prize money for the people that made good datasets.

### World Happiness Report 2016
[2016 World Happiness Report](https://worldhappiness.report/ed/2016/)

This dataset, called “World Happiness Report 2016, ” is about the happiness score of more than 150 countries around the world. It has 11 variables and 156 observations. We are planning to use this dataset to find the relationship between game sales and happiness scores.

This dataset was collected by “The World Happiness Report” in 2019 to show the rating of happiness scores of countries around the world. We think this dataset can benefit everyone because We believe a list ranking of happiest countries can encourage the country leaders to work harder to help their countries to get a higher ranking. They use the data from “Gallup World Poll surveys.” Both “The World Happiness Report” and the Gallup poll are very popular; the data is collected from random subjects. Based on their popularity, we believe the data is trustworthy.

### Steam Store Games (Clean dataset)
[Steam Store Games dataset](https://www.kaggle.com/datasets/nikdavis/steam-store-games?select=steam.csv)

This dataset is called “Steam Store Games (Clean dataset).” There are 18 variables and 1,069,460 observations. This dataset contains the games listed on Steam, a video game digital distribution service on PC. It shows a list of information about each game on Steam, such as the game rating and ownership amount. We want to use this data to answer what types of people enjoy. This dataset was created by Nik Davis around May 2019. They stated the purpose of creating this dataset was to be used as a data science learning journey. The data is gathered from the Steam Store and the SteamSpy APIs, which should be reliable as it takes data from the source.

### Population by Country - 2020
[Pop by Country](https://www.kaggle.com/datasets/tanuprabhu/population-by-country-2020)

This data is have the poplation data for the countires around the world. The author is Tanu N Prabhu, he collected the data from a website call worldometers. I believe it's reliable because the website collect data from UN. There'are 235 observations and 11 variables. We are going to combine this dataset with the revenues to find out how much money on vdieo game spend per person in one country.

### Top 100 Countries by Game Revenues
[Top 100 Countries by Game Revenues](https://public.knoema.com/qjjodt/top-100-countries-by-game-revenues)

This data is about the video game revenues of each countries, own by Keoema, a privately owned based data technology company, this dataset is base on revenue figures published by Newzoo.com, which is a very popular data source that many top-tier media will use. Base on that, I think the revenues data is reliable. There's 115 observations and 18 variables. We are planing to use this dataset to find out the relationship between video games and the world happiness score.

#### Table 1: Summary of datasets

  | Data File                       | Observations| Variables|  
  | --------------------------------| ----------- |----------|
  | Video Game Sales with Ratings   | 16,719      |  16      |
  | World Happiness Report 2016     | 158         |  11      |
  |Steam Store Games (Clean dataset)| 1,069,460   |  18      |
  |Population by Country - 2020     | 235         |  11      |
  |Top 100 Countries by Game Revenues| 115        |  18      |

## Expected Implications:  
The goal of our project is to help gamers to find a game that they are interested in and help developers to get a better understanding on which type of game is more popular and be able to focus on the games that gamers like, so we expect our result can address the things above.
Also, there’re a lot of debates on whether a video game is good or bad for people. We want to find the relationship between the score world happiness with the amount of video game revenues of that country. If our result is that the region with higher video game sales has a higher happiness score, then we can show that video games are beneficial to people, at least in the happiness area, vice versa.

## Limitations:
One limitation that we have determined is that the video game sales dataset lists the sales as NA sales, EU sales, Japan sales, and others. We are planning to analyze the game sales data by region and find out if it has connections to the happiness level, but the game sales dataset only specifies the data for NA, EU, and Japan; the rest of the countries fall into the others category, which limits our ability to analyze the relationship between regions, other than NA, EU, and Japan, and its happiness level.

Another limitation is that the dataset we are using is not recent, it only covers the game through 2017, and it has some missing games, which might make our results to be less reliable and not up to date with the current time. Same as the World Happiness dataset, it only has data from 156 countries, and we have 195 countries in the world.

## Findings

- What is the most popular video game genre?

For this question, we made a bar graph that shows the game sales in different genre of game and found that action game is have the most number of sales, followed by sport games. The least popular video game genre is strategy games.

- What is the correlation between the rating of a video game to the sales of the video game?

To answer this question, we created two scatter plots to show the relationship between video game sales and user and critic's rating. As result, for critic's rating, we found that when the rating score increase, the world sales tend to increase too. But for the user rating, the correlation is very weak, we don't think there's a relationship between user rating and the video game sales.

- How does amount of money spend on video game relate to the World Happiness score? Does the people live in a region with a higher happiness score spend more money on gaming?

For this question, we made two different map shows the happiness score and average video game money spent on different countries. Due to the missing data on Africa, we can't find the connection, but on North America, Asia, and Australia, we found that the amount of money spent on video games does impact the happiness scores, in most cases, countries with more money people spend on games, tend to have a higher happiness score.


## Discussion

One of the goals of our project is to help developers to have better understand which type of game is more popular on the market. We believe that video game sales can tell the popularity on one types of game, by showing the games sales for different types of games, we can help developers to better understand which type of game can help them earn money and they probably want to focus on making those types of games. 
Another goal for this project is to found out the impact of video game to people's mood. We had heard many times about video game can make people irritable and anxiety, but will also help people relieve stress and happier. This two opinion is completely opposite, and we are interested to find out which opinion is more true. We believe that the amount of money that people spent on video games on one specific country can show the popularity of video game on that country and we found that countries with higher money spend on video game often have a higher happiness score. This shows that video games does have positive impact on people's mood in most cases.
Another thing we are interested is the connection between video game sales and rating, and we found that there's a connection between vdieo game sales and critic's rating but we can't find a evidence shows the connection between user rating and sales. This is important because it show the impact of critic rating to the game sales and we think that's probably because it will help more people know about the game and shows the developers the importance of letting critic to rate their games.

## Conclusion

Video games are a big part of our life and economy, but there are a lot of arguments on the pros and cons of video games. By analyzing the video game revenue data and the world happiness data, we found that countries with more money people spend on video games often have a higher happiness score compared to others; this shows that video games do help people to become happier, we understand that not all video games will have positive impact to the player, but we want to eliminate some stereotypes about video games by showing that generally, playing video game can help people happier. The economy benefit is another point that we are focusing on; by analyzing the game sales dataset, we found the most popular video game genres. We believe this can help developers to focus on making games that most people like and bring a more positive elements to the gamers and use the money they earn to make another exciting game, achieving a positive cycle. We also want to find out if there's a connection between users' rating and video game sales, but at the end, our result shows us that there's no evidence shows there's a connection, we don't believe that is true because there're lots of people purchase games base on the user rating score.

## References:
1. American Psychological Association. (n.d.). *Violent video games can increase aggression.* American Psychological Association. Retrieved October 30, 2022, from https://www.apa.org/news/press/releases/2000/04/video-games
2. Davis, N. (2019). *Steam Store Games (Clean dataset), Version 3.* Retrieved October 31, 2022 from https://www.kaggle.com/datasets/nikdavis/steam-store-games?select=steam.csv
3. Kirubi, R. (2017). *Video Game Sales with Ratings, Version 2.* Retrieved October 31, 2022 from https://www.kaggle.com/datasets/rush4ratio/video-game-sales-with-ratings
4. WebMD. (n.d.). *Video games: Do they have mental health benefits?* WebMD. Retrieved October 30, 2022, from https://www.webmd.com/mental-health/mental-health-benefits-of-video-games#:~:text=Video%20games%20can%20act%20as,traumatic%20stress%20disorder%20(PTSD).
5. WebMD. (n.d.). *Video game addiction: Symptoms, treatment, and prevention.* WebMD. Retrieved October 30, 2022, from https://www.webmd.com/mental-health/addiction/video-game-addiction
6. World Happiness Report. (2019). *World Happiness Report 2019.* Retrieved October 31, 2022 from https://worldhappiness.report/ed/2019/

## Appendix A: Questions
For the World Happiness Dataset, there are only 156 observations because there are only so many countries in the world, however the requirement is 500 or more. Is that alright? Should we use a different dataset?
