library(ISLR)
library(tidyverse)

# Figure 1.1 Wage data
data(Wage)
islr_theme <-   theme_bw() + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

##wage as function of age

ggplot(Wage, aes(age, wage)) + 
  geom_point(color = "lightslategray") +
  geom_smooth(se = F, color = "darkblue") +
  xlab("Age") +
  ylab("Wage") +
  islr_theme
  

##wage as a function of year

ggplot(Wage, aes(year, wage)) + 
  geom_point(color = "lightslategray") +
  geom_smooth(method = 'lm', se = F, color = "darkblue") +
  xlab("Year") +
  ylab("Wage") +
  islr_theme

##wage as function of education level

ggplot(Wage, aes(education, wage, fill = education)) + 
  geom_boxplot() +
  scale_x_discrete('Education Level',
                   labels = c('1', '2', '3', '4', '5')) +
  scale_fill_discrete(guide = FALSE) +
  ylab("Wage") +
  islr_theme


#Figure 1.2 Stock market data
data("Smarket")

Up_Down <- function(x) ifelse(x>0, "Up", "Down")

Smarket %>% 
  transmute(Dif1 = Up_Down(Today - Lag1),
            Dif2 = Up_Down(Today - Lag2),
            Dif3 = Up_Down(Today - Lag3)) %>% 
  pivot_wide


  ggplot(aes(Today, Lag1)) +
  geom_boxplot()
