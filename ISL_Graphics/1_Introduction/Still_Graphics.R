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

facet_titles <- c("Lag1" = "Yesterday", 
                     "Lag2" = "Two Days Previous",
                     "Lag3" = "Three Days Previous")

Smarket %>% 
  select(Lag1, Lag2, Lag3, Direction) %>% 
  pivot_longer(cols = starts_with("Lag"), names_to = "Lag", values_to = "Percentage") %>% 
  ggplot(aes(Direction, Percentage, fill = Direction)) +
  geom_boxplot(outlier.shape = 21, outlier.fill = 'white') +
  facet_wrap(~Lag,
             labeller = as_labeller(facet_titles),
             scales = 'free') +
  scale_fill_manual(values = c('deepskyblue3', 'darkorange2'), guide = FALSE) +
  ylab("Percentage change in S&P") +
  xlab("Today's direction") +
  islr_theme +
  theme(
    strip.background = element_blank(),
    strip.text.x = element_text(
      size = 10, face = "bold"
    )
  )


#Figure 1.3 qda Smarket

model_qda <- Smarket %>% 
  filter(Year < 2005) %>% 
  MASS::qda(Direction~Lag1+Lag2, data = .)
###page163/173from pdf

Smarket %>% 
  filter(Year == 2005) %>% 
  predict(model_qda, newdata = .) %>% 
  .[[2]] %>%  
  as_tibble() %>% 
  transmute(Direction = Smarket$Direction[Smarket$Year == 2005],
         Probability = ifelse(Direction == 'Down', Down, Up)) %>%
  ggplot(aes(Direction, Probability, fill = Direction)) +
  geom_boxplot() +
  scale_fill_manual(values = c('deepskyblue3', 'darkorange2'), guide = FALSE) +
  xlab("Today's Direction") +
  ylab('Predicted Probability') +
  islr_theme
###Not exactly the same as the one in the book
###but I couldn't get it exactly right.


# Figure 1.4 NCI60 data

data("NCI60")

##4 groups
prcomp(NCI60$data, scale = TRUE)$x[,1:2] %>% 
  as_tibble() %>% 
  mutate(Groups = case_when(
    PC1 < -30 & PC2 < 0 ~ '1',
    between(PC1,-40,50) & PC2 > -5 ~ '2',
    PC1 > 20 & between(PC2, -25, 10) ~ '3',
    PC2 < -25 ~ '4'
  )) %>% 
  ggplot(aes(PC1,PC2, 
             color = Groups)) +
  geom_point() +
  scale_color_manual(values = c('red', 'navyblue', 'springgreen4', 'royalblue'),
                     guide = FALSE) +
  xlab(expression(Z[1])) +
  ylab(expression(Z[2])) +
  islr_theme


##by cancer type
prcomp(NCI60$data, scale = TRUE)$x[,1:2] %>% 
  as_tibble() %>% 
  mutate(Cancer_type = NCI60$labs) %>% 
  ggplot(aes(PC1,PC2, 
             color = Cancer_type,
             shape = Cancer_type)) +
  geom_point() +
  scale_shape_manual(values = 1:length(unique(NCI60$labs))) +
  guides(color = FALSE,
         shape = FALSE) +
  xlab(expression(Z[1])) +
  ylab(expression(Z[2])) +
  islr_theme
