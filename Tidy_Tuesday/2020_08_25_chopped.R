library(tidyverse)
library(lubridate)

chopped <- readr::read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-25/chopped.tsv')


glimpse(chopped)


chopped %>% 
  select(series_episode, 
         starts_with("judge")) %>% 
  pivot_longer(starts_with("judge"))
