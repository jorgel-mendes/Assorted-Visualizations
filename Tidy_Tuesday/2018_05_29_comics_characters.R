library(tidyverse)
library(scales)

comic_book <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-05-29/week9_comic_characters.csv")

plots_themes <-   theme_bw() + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        strip.background = element_blank(),
        panel.border = element_blank(),
        title = element_text(colour = "darkslategrey"),
        strip.text = element_text(color = 'darkslategrey'),
        axis.ticks.x = element_line(color = 'lightslategrey'),
        axis.ticks.y = element_blank(),
        axis.text = element_text(color = 'darkslategrey'))

male_female <- comic_book %>% 
  select(year, sex) %>% 
  filter(!is.na(year), !is.na(sex)) %>% 
  group_by(year, sex) %>%
  summarise(total = n()) %>% 
  mutate(percentage = total/sum(total),
         sex = case_when(
           sex == "Male Characters" ~ "Cis Male",
           sex == "Female Characters" ~ "Cis Female",
           TRUE ~ "Other"
         ),
         sex = factor(sex, c("Other", "Cis Female","Cis Male"))) %>% 
  ungroup() %>% 
  complete(year, sex, fill = list(percentage= 0)) %>% 
  # filter(year > 1980) %>% 
  ggplot() +
  geom_area(aes(year, percentage, fill = sex), color= "snow", size = .5) +
  scale_x_continuous(expand = expansion(mult = c(0,0))) +
  scale_y_continuous(expand = expansion(mult = c(0,0)), labels = percent_format()) +
  scale_fill_manual("", values = c("black", "#FFA840", "#284A7E")) +
  labs(
    title = "Cis Male is still the norm in mainstream comics",
    subtitle = "They make more than 50% of the characters created each year",
    x = NULL,
    y = "Percentage of new characters"
  ) +
  plots_themes
  
ggsave("male_female.jpg", plot = male_female)
