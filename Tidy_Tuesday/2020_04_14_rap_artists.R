## Rap Artists

library(tidyverse)
library(patchwork)

rankings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-04-14/rankings.csv')


#made after the plotting
#could be done with code but not necessary for a small vector

top_songs_artists <- c("JAY-Z", "OutKast")
color_legends <- ifelse()

plots_themes <-   theme_bw() + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        strip.background = element_blank(),
        panel.border = element_rect(color = 'slategrey'),
        title = element_text(colour = "darkslategrey"),
        strip.text = element_text(color = 'darkslategrey'),
        axis.ticks.x = element_line(color = 'lightslategrey'),
        axis.ticks.y = element_blank(),
        axis.text = element_text(color = 'darkslategrey'))


top_col <- 
  rankings %>% 
  count(artist, name = "top_song") %>%
  distinct() %>% 
  arrange(desc(top_song)) %>% 
  slice(1:5) %>% 
  mutate(artist = reorder(artist, top_song),
         is_both_tops = ifelse(artist %in% top_songs_artists, "yes", "no")) %>% 
  ggplot() +
  geom_col(aes(top_song, artist, fill = is_both_tops)) +
  scale_x_continuous(expand = expansion(mult = c(0,.1))) +
  scale_fill_manual(values = c("grey60", "purple4"), guide = FALSE) +
  labs(
    x = "Number of songs on the list", 
    y = NULL,
    title = "These are the artists with most songs cited by critics",
    subtitle = "Jay-Z is the only one with more than 10 songs in the list"
  ) +
  plots_themes +
  theme(
    axis.text.y = element_text(
      color = c("darkslategrey", "darkslategrey", "purple4", "darkslategrey", "purple4")))


top_col_n <- rankings %>% 
  count(artist, wt = n, name = "top_artist") %>% 
  distinct() %>% 
  mutate(artist = reorder(artist, top_artist),
         is_both_tops = ifelse(artist %in% top_songs_artists, "yes", "no")) %>% 
  arrange(desc(top_artist)) %>% 
  slice(1:5) %>% 
  ggplot() +
  geom_col(aes(top_artist, artist, fill = is_both_tops)) +
  scale_x_continuous(expand = expansion(mult = c(0,.1))) +
  scale_fill_manual(values = c("grey60", "purple4"), guide = FALSE) +
  labs(
    x = "Number of votes", 
    y = NULL,
    title = "But the list for artists with more votes is a little different...",
    subtitle = "Only Jay-Z and OutKast are in the top 5 on both categories"
  ) +
  plots_themes +
  theme(
    axis.text.y = element_text(
      color = c("purple4", "purple4", "darkslategrey", "darkslategrey", "darkslategrey")))

top_col / top_col_n +
  plot_annotation(
    title = 'More songs \u2260 More votes',
    caption = 'By @jorgelsm with Tidy Tuesday data',
    theme = theme(
      plot.title = element_text(color = 'darkslategrey'),
      plot.subtitle = element_text(color = 'darkslategrey'),
      plot.caption = element_text(color = 'lightslategrey')
    )
  )
