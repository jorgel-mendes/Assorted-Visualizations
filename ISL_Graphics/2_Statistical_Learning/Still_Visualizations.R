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

library(tidyverse)
library(Cairo)

Income <- read_csv('http://faculty.marshall.usc.edu/gareth-james/ISL/Income2.csv',
                   col_types = cols(X1 = col_skip()))

model <- Income %>% 
  loess(Income ~ Education + Seniority, data = .)

x_Education <- seq(min(Income$Education), max(Income$Education), length = 30)
x_Seniority <- seq(min(Income$Seniority), max(Income$Seniority), length = 30)

pred_function <- function(x1, x2){
  predict(model, newdata = cbind(x1,x2))
}

y_Income <- outer(x_Education, x_Seniority, pred_function) 

#For windows users cairo makes the plot looks more sharp
Cairo::CairoWin()
#Cairo(file = 'plot.png', type = 'png', bg = 'snow') 

point_pmat <- persp(x = x_Education, y = x_Seniority, z = y_Income, 
      theta = 45, phi = 35, col = 'dodgerblue3', xlab = 'Years of Education',
      ylab = 'Seniority', zlab = 'Income')
points(trans3d(x = Income$Education, y = Income$Seniority,
               z = Income$Income, pmat = point_pmat), col = 'red', pch = 16)
for(i in 1:dim(Income)[1]){
  z <- seq(Income$Income[i], pred_function(Income$Education[i], Income$Seniority[i]),
           length = 10)
  lines(trans3d(x = Income$Education[i], y = Income$Seniority[i],
                z = z, pmat = point_pmat))
}
dev.off()

# Figure 2.4 Income dataset

model <- Income %>% 
  lm(Income ~ Education + Seniority, data = .)

x_Education <- seq(min(Income$Education), max(Income$Education), length = 30)
x_Seniority <- seq(min(Income$Seniority), max(Income$Seniority), length = 30)

pred_function <- function(x1, x2){
  predict(model, newdata = data.frame(Education = x1, Seniority = x2))
}

y_Income <- outer(x_Education, x_Seniority, pred_function) 

Cairo::CairoWin() #For windows users cairo makes the plot looks more sharp
point_pmat <- persp(x = x_Education, y = x_Seniority, z = y_Income, 
                    theta = 45, phi = 35, col = 'gold2', border = 'dodgerblue3',
                    xlab = 'Years of Education', ylab = 'Seniority', zlab = 'Income')
points(trans3d(x = Income$Education, y = Income$Seniority,
               z = Income$Income, pmat = point_pmat), col = 'red', pch = 16)
for(i in 1:dim(Income)[1]){
  z <- seq(Income$Income[i], pred_function(Income$Education[i], Income$Seniority[i]),
           length = 10)
  lines(trans3d(x = Income$Education[i], y = Income$Seniority[i],
                z = z, pmat = point_pmat))
}

# Figure 2.5 Income dataset

#### Make it after chapter 7

# Figure 2.6 Income dataset

#### Make it after chapter 7

# Figure 2.7 Statistical Models

tibble(
  Models = c('Subsect Selection', 'Lasso', 'Least Squares',
             'Generalized Additive Models', 'Trees',
             'Bagging, Boosting', 'Support Vector Machines'),
  Interpretability = c(1, .95, .7, .5, .45, .3, .05),
  Flexibility = c(0, 0, .2, .4, .4, .9, .7)
) %>% 
  ggplot() +
  geom_text(aes(x = Flexibility, y = Interpretability, label = Models),
            color = 'darkblue') +
  scale_x_continuous(breaks = c(0, 1), labels = c('Low', 'High'), expand = c(.1,.1)) +
  scale_y_continuous(breaks = c(0, 1), labels = c('Low', 'High'), limits = c(0, 1)) + 
  islr_theme


