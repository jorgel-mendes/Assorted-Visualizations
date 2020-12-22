library(tidyverse)
library(readxl)

tidytuesdaydata <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-11-10/mobile.csv')
density_anatel <- readxl::read_excel("~/Downloads/d5944d56-14e5-4311-baf7-b453aae1dc54.xlsx",
                                                   col_types = c("date", "numeric"))
type_anatel<- read_excel("~/Downloads/198f165b-cc8f-4577-b979-0de7bd6ea584.xlsx", 
                                                    col_types = c("date", "text", "numeric"))
density_annual <- density_anatel %>% 
  mutate(year = lubridate::year(Data),
         .keep = "unused") %>% 
  group_by(year) %>% 
  summarise(Density= mean(Densidade))

tidytuesdaydata %>% 
  filter(entity == "Brazil") %>% 
  ggplot(aes(year, mobile_subs)) +
  geom_point(aes(color = "Our World in Data")) +
  geom_point(data = density_annual,
             aes(x = year,
                 y = Density,
                 color = "Anatel")) +
  scale_color_manual(name = "Fonte", 
                     values = c("blue", "grey40")) +
  labs(
    x = NULL,
    y = "Linhas de\ntelefonia móvel\npor 100 habitantes",
    title = "Densidade de linhas ativas de telefonia móvel no Brasil"
  ) +
  hrbrthemes::theme_ipsum_es(plot_title_size = 14,
                             plot_title_margin =10,
                             plot_margin = margin(15, 30, 30, 30),
                             panel_spacing = grid::unit(2, "lines"),) +
  theme(axis.title.y = element_text(angle = 0,
                                    hjust=0),
        plot.title = element_text(hjust = .48))


type_anatel %>% 
  ggplot(aes(x = Data, y = Acessos)) +
  geom_vline(xintercept = as.POSIXct("2014/03/07")) +
  geom_line(aes(color = `Modalidade de Cobrança`)) +
  stat_summary(fun = sum, na.rm = TRUE, 
               aes(color = 'Total'), 
               geom ='line') +
  annotate("text", x = as.POSIXct("2009/03/01"), y = 260e6,
           label = "Resolução 632\nda Anatel") +
  geom_curve(
    aes(x = as.POSIXct("2009/03/01"), y = 280e6, 
        xend = as.POSIXct("2014/03/01"), yend = 280e6),
    arrow = arrow(length = unit(.03, "npc"), type = "open"),
    curvature = -0.2, ncp = 5, size = .2
  ) +
  scale_y_continuous(labels = scales::label_number(scale = 1e-6)) +
  scale_color_brewer(type = "qual", guide = guide_legend(reverse = TRUE),
                     palette = "Dark2") +
  labs(
    x = NULL,
    y = "Linhas de\ntelefonia móvel\n(em milhões)",
    color = "Modalidade",
    title = "Pré pago baixou o número de linhas móveis ativas",
    subtitle = "Uma possível razão foi a adesão das operadoras a resolução 632 da Anatel,\nque facilitou o cancelamento de linhas pré-pagas."
  ) +
  hrbrthemes::theme_ipsum_es(plot_title_size = 15,
                             plot_title_margin = 5,
                             subtitle_size = 11,
                             subtitle_margin = 10,
                             plot_margin = margin(10, 15, 15, 15),
                             panel_spacing = grid::unit(2, "lines"),) +
  theme(axis.title.y = element_text(angle = 0,
                                    hjust = 0),
        plot.title = element_text(hjust = 0),
        plot.subtitle = element_text(hjust=0),
        plot.title.position = "plot") 
  