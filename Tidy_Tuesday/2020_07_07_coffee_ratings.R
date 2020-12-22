library(tidyverse)

coffee_ratings <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv')

glimpse(coffee_ratings)

unique(coffee_ratings$country_of_origin)

coffee_ratings %>% 
  count(country_of_origin)

