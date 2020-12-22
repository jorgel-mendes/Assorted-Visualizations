library(gt)
library(tidyverse)


tournament <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-06/tournament.csv')

glimpse(tournament)

seed_lookup <- c(3.3, 2.4, 1.8, 1.6, 1.1, 1.1, 0.9, 0.7, 0.6, 0.6, 0.6, 0.5, 0.3, 0.2, 0.1, 0)/3.3*100

tournament %>% 
  mutate(decade = year - year%%10) %>% 
  group_by(school, decade) %>% 
  summarise(points_sum = mean(seed_lookup[seed])) %>% 
  filter(n() > 2) %>% 
  slice_max(mean(points_sum), n = 20)
