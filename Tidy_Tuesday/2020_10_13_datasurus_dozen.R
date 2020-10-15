library(plotly)

datasaurus <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-13/datasaurus.csv')

highlightsaurus <- highlight_key(datasaurus, ~dataset)

boxsaurus_h <- highlightsaurus %>% 
  plot_ly() %>% 
  add_boxplot(x = ~x,
              y=~dataset,
              color = ~dataset,
              colors = ggthemes::tableau_color_pal("Tableau 20")(13),
              showlegend = FALSE) %>% 
  layout(xaxis = list(range = c(0, 100),
                      showgrid = FALSE,
                      zeroline = FALSE),
         yaxis = list(showgrid = FALSE,
                      showticklabels=FALSE,
                      title = "Each box is a dataset"))


pointsaurus <- highlightsaurus %>% 
  plot_ly() %>% 
  add_markers(x=~x,
              y=~y,
              color=~dataset,
              colors = ggthemes::tableau_color_pal("Tableau 20")(13),
              showlegend = FALSE) %>% 
  layout(xaxis = list(range = c(0, 100),
                      showgrid = FALSE,
                      showline = FALSE,
                      zeroline = FALSE),
         yaxis = list(showgrid = FALSE,
                      showline = FALSE,
                      zeroline = FALSE,
                      title = ""))

subplot(boxsaurus_h,
        pointsaurus,
        shareX = TRUE,
        titleX = FALSE,
        titleY = TRUE,
        nrows = 2) %>% 
  layout(title = list(text = "Click on a box and see what it hides", 
                      font = list(size = 18))) %>% 
  highlight(opacityDim = 0.1,
            off = "plotly_doubleclick")

