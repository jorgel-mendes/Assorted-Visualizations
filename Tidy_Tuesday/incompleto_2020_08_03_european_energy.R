library(tidyverse)
library(treemapify)
library(lubridate)

energy_types <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-04/energy_types.csv')

hydro_table <- energy_types %>% 
  select(-c(country, level)) %>% 
  filter(type %in% c('Hydro', 'Pumped hydro power')) %>% 
  pivot_longer(c(`2016`:`2018`), names_to = "year",
               values_to = "energy_production") %>% 
  pivot_wider(names_from=type, values_from=energy_production) %>% 
  mutate(Hydro_percentage = `Pumped hydro power`/Hydro,
         # year = ymd(year, truncated = 2),
         year = as.integer(year)) %>% 
  drop_na()

hydro_table %>% 
  filter(year == "2018") %>% 
  ggplot(aes(area = `Pumped hydro power`, fill = Hydro_percentage, 
             label = country_name)) +
  geom_treemap() +
  geom_treemap_text(colour = "white", place = "topleft", reflow = T) +
  scale_fill_continuous(breaks = c(.25, .5, .75), 
                        labels = scales::percent_format()) +
  labs(
    fill = c('Percentage of \nhydro that is \nhydro pump')
  ) +
  theme(
    legend.margin = margin()
  )

library(gganimate)

hydro_table %>% 
  ggplot(aes(
  label = country_name,
  area = `Pumped hydro power`,
  fill = Hydro_percentage
  )) +
  geom_treemap(layout = "fixed") +
  geom_treemap_text(layout = "fixed", place = "centre", 
                    grow = TRUE, colour = "white") +
  scale_fill_continuous(breaks = c(.25, .5, .75), 
                        labels = scales::percent_format()) +
  transition_time(year) +
  ease_aes('linear') +
  labs(title = "Year: {frame_time}",
       fill = c('Percentage of \nhydro that is \nhydro pump')) +
  theme(
    legend.margin = margin()
  )

# anim_save("man/figures/animated_treemap.gif", p, nframes = 48)
