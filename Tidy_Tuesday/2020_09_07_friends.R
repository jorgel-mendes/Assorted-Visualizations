library(tidyverse)
library(extrafont)

# font_import() #took forever AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
# fonts()
loadfonts("win")

friends <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-08/friends.csv')

glimpse(friends)

friends %>% 
  filter(str_detect(text, regex("oh[,\\. ]*my[\\.,! ]+[g\\. ]", ignore_case = TRUE)),
    str_starts(speaker, "Janice")) %>% 
  mutate(oh_my_gods = str_extract(text, regex("oh[,\\. ]*my[\\., ]+(g[awo]{1,2}d)*[.!]*", ignore_case = TRUE))) %>%
  pull(oh_my_gods)

friends %>% 
  filter(str_starts(speaker, "Janice")) %>% 
  View()

View()

