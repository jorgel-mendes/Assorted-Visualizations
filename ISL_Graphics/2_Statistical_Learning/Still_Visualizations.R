library(ISLR)
library(tidyverse)

islr_theme <-   theme_bw() + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

# Figure 2.1 Advertising data set models

Advertising <- read_csv('http://faculty.marshall.usc.edu/gareth-james/ISL/Advertising.csv',
                        col_types = cols(X1 = col_skip()))

facet_titles <- c(
  'TV' = 'TV',
  'radio' = 'Radio',
  'newspaper' = 'Newspaper'
)

Advertising %>%
  pivot_longer(-sales, names_to = 'Media', values_to = 'Expenditure') %>% 
  mutate(Media = factor(Media, levels = c('TV', 'radio', 'newspaper'))) %>% 
  ggplot(aes(Expenditure, sales)) + 
  geom_point(shape = 21, fill = 'white',
             color = 'orangered2') +
  geom_smooth(method = 'lm', se = FALSE) + 
  facet_wrap(~Media, scales = 'free',
             labeller = as_labeller(facet_titles),
             strip.position = 'bottom') +
  islr_theme +
  xlab(NULL) +
  ylab('Sales') +
  theme(
    strip.background = element_blank(),
    strip.placement = 'outside'
  )
##scales different from book but I found no straightfoward way to change them


