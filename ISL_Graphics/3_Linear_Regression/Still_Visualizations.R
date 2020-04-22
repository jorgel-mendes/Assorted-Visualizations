library(ISLR)
library(tidyverse)

islr_theme <-   theme_bw() + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

# Figure 3.1 Advertising dataset

Advertising <- read_csv('http://faculty.marshall.usc.edu/gareth-james/ISL/Advertising.csv',
                        col_types = cols(X1 = col_skip()))

model <- lm(sales ~ TV, Advertising)

Cairo::CairoWin() 
Advertising %>%
  mutate(fitted = model$fitted.values) %>% 
  ggplot() + 
  geom_smooth(aes(TV, fitted), method = "lm", se = FALSE,
              fullrange = TRUE, color = "navyblue", size = .8) + 
  geom_segment(aes(x = TV, xend = TV,
                   y = sales, yend = fitted),
               color = "slategrey") +
  geom_point(aes(TV, sales), color = "red2") +
  scale_x_continuous(expand = c(0,0), limits = c(-10, 310),
                     breaks = scales::breaks_width(50)) +
  scale_y_continuous("Sales", breaks = scales::breaks_width(5)) +
  islr_theme
