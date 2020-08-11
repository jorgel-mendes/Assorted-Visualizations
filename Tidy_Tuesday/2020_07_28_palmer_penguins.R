

library(tidyverse)
library(waffle)

penguins <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-28/penguins.csv')

glimpse(penguins)

penguins %>% 
  group_by(species) %>% 
  count(island) %>% 
  ungroup() %>% 
  mutate(species = fct_relevel(species, c('Adelie', 'Gentoo', 'Chinstrap'))) %>% 
  ggplot(aes(fill = species, values = n)) +
  geom_waffle(color = "white", size = .2, n_rows = 10, flip = TRUE) +
  facet_wrap(~island, nrow=1, strip.position = 'bottom') +
  scale_x_discrete(expand=c(0,0)) +
  scale_y_continuous(labels = function(x) x * 10,
                     expand = c(0,0)) +
  scale_fill_manual(values = c('darkorange2', 'darkseagreen4', 'darkviolet')) +
  labs(
    title = "Penguins per island, Palmer Station LTER",
    fill = "Species",
    caption = 'By @jorgelsm for #TidyTuesday'
  ) +
  theme_minimal() +
  theme(legend.position = 'top',
        text = element_text(face = 'bold', color = 'grey20'),
        strip.text = element_text(face = 'bold', color = 'grey20'),
        panel.grid = element_blank())
