library(ISLR)
library(tidyverse)

islr_theme <-   theme_bw() + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

# Figure 2.1 Advertising dataset

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

# Figure 2.2 Income dataset

Income <- read_csv('http://faculty.marshall.usc.edu/gareth-james/ISL/Income1.csv',
                        col_types = cols(X1 = col_skip()))

##Points
Income %>% 
  ggplot(aes(Education, Income)) +
  geom_point(color = 'orangered2') +
  scale_x_continuous(labels = scales::number_format(accuracy =1),
    'Years of Education') +
  islr_theme

##Model

model <- Income %>% 
  loess(Income~Education, data = .)

tibble(
    Education = model$x[,1],
    Income = model$y,
    Fitted = model$fitted
  ) %>% 
  ggplot() +
  geom_point(aes(x = Education, y = Income), color = 'red2') +
  geom_line(aes(Education, Fitted), color = 'navyblue') +
  geom_segment(aes(x = Education, xend = Education,
                   y = Income, yend = Fitted)) +
  scale_x_continuous(labels = scales::number_format(accuracy =1),
                     'Years of Education') +
  islr_theme

# Figure 2.3 Income dataset

library(plotly)

Income <- read_csv('http://faculty.marshall.usc.edu/gareth-james/ISL/Income2.csv',
                   col_types = cols(X1 = col_skip()))

model <- Income %>% 
  loess(Income ~ Education + Seniority, data = .)

matrix_data <- tibble(
  Education = model$x[,1],
  Seniority = model$x[,2],
  Fitted = model$fitted
) %>% 
  as.matrix

p <- plot_ly(z = ~matrix_data) %>% add_surface()
p
  
###couldn't reproduce the plot
###I'll try again if they redo this plot later in the book
