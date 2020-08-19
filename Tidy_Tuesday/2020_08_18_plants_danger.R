

library(tidyverse)

plants <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/plants.csv')

plants_plot <- plants %>% 
  filter(!is.na(year_last_seen)) %>% 
  group_by(year_last_seen) %>% 
  count() %>% 
  ungroup() %>% 
  mutate(year_last_seen = factor(year_last_seen, 
                                 c("Before 1900", "1900-1919", "1920-1939",
                                   "1940-1959", "1960-1979", "1980-1999", "2000-2020"))
         ) %>% 
  ggplot() +
  geom_segment(aes(x = year_last_seen, xend = year_last_seen, y = 0, yend=n),
               color = "lightsalmon4", size = 1) +
  geom_point(aes(x = year_last_seen, y = n), color = "darkolivegreen4", size = 3) +
  labs(
    title = "At least 500 plant species have been declared extinct since 1900",
    subtitle = "Over 50 of them were last seen in the last 20 years",
    x = NULL,
    y = "Number of species last seen in the period",
    caption = "By @jorgelsm for #TidyTuesday"
  ) +
  tvthemes::theme_avatar(title.size = 13)

ggsave("Tidy_Tuesday/plot.png", plants_plot)
