---
title: "Tidy Tuesday 27/08/2019 Simpsons Guests"
excerpt_separator: "<!--more-->"
categories:
  - Tidy Tuesday
tags:
  - Tidy Tuesday
  - Frequency Polygons
  - ggplot
visNetwork: true
---

# Data description

From From [TidyTuesdays
github](https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-08-27):

> This week’s data is from Wikipedia, by way of Andrew Collier.

# Import data and packages

``` r
library(tidyverse)
library(Cairo)

simpsons <- readr::read_delim("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-08-27/simpsons-guests.csv", delim = "|", quote = "")
```

# Data

``` r
glimpse(simpsons)
```

    ## Observations: 1,386
    ## Variables: 6
    ## $ season          <chr> "1", "1", "1", "1", "1", "1", "1", "1", "1", "...
    ## $ number          <chr> "002–102", "003–103", "003–103", "006–106", "0...
    ## $ production_code <chr> "7G02", "7G03", "7G03", "7G06", "7G06", "7G09"...
    ## $ episode_title   <chr> "Bart the Genius", "Homer's Odyssey", "Homer's...
    ## $ guest_star      <chr> "Marcia Wallace", "Sam McMurray", "Marcia Wall...
    ## $ role            <chr> "Edna Krabappel;  Ms. Melon", "Worker", "Edna ...

# Looking ate the roles

``` r
simpsons %>% 
  select(role) %>% 
  top_n(15)
```

<div class="kable-table">

| role                        |
| :-------------------------- |
| Worker                      |
| Woody Boyd                  |
| Wink                        |
| Werewolf; Werewolf Flanders |
| Zoo animals                 |
| Warden                      |
| Zelda                       |
| Warden                      |
| Wise Old Cat singer         |
| Wayne Slater                |
| Walter White (live action)  |
| Zhenya                      |
| Young Man                   |
| William Masters             |
| Whistler                    |

</div>

Sometimes that’s more than one role for guest in one episode. Let’s
split this.

``` r
simpsons %>% 
  separate_rows(role, sep = ";\\s*") %>% 
  select(season, role) %>% 
  filter(season != "Movie") %>% 
  mutate(type_guest = case_when(
    str_detect(role, regex('^Sings', ignore_case = TRUE)) ~ "Sings",
    str_detect(role, regex('voice', ignore_case = TRUE)) ~ "Voice",
    str_detect(role, regex('himself|herself|themselves', ignore_case = TRUE)) ~ "Themselves",
    str_detect(role, regex('narrator', ignore_case = TRUE)) ~ "Narrator",
    TRUE ~ "Character"
    ),
    season = as.numeric(season)
    ) %>% 
  ggplot(aes(season, 
             color = factor(type_guest,
                            levels = c("Character", "Themselves", "Sings",
                                       "Narrator", "Voice")))) + 
  geom_freqpoly() + 
  labs(x = "Season",
       y = "Count",
       title = "Which do guests play more each season of the Simpsons?",
       subtitle = "They usually play non-singing characters or themselves",
       color = "Type of Guest") + 
  scale_colour_brewer(palette = 'Dark2') +
  theme_classic() +
  theme(
        title = element_text(colour = "darkslategrey"),
        legend.text = element_text(colour = "darkslategrey"),
        axis.ticks = element_line(color = 'lightslategrey'),
        axis.text = element_text(color = 'lightslategrey'),
        axis.line = element_blank()
        )
```

![](https://raw.githubusercontent.com/jorgel-mendes/Behold-the-Vision/master/docs/assets/images/simg_freq-1.png)<!-- -->
