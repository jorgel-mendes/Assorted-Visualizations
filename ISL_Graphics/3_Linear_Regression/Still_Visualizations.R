library(ISLR)
library(tidyverse)
library(broom)

islr_theme <-   theme_bw() + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

# Figure 3.1 Advertising dataset

Advertising <- read_csv('http://faculty.marshall.usc.edu/gareth-james/ISL/Advertising.csv',
                        col_types = cols(X1 = col_skip()))

Cairo::CairoWin() 
Advertising %>% 
  lm(sales ~ TV, .) %>% 
  augment() %>% 
  ggplot() + 
  geom_smooth(aes(TV, .fitted), method = "lm", se = FALSE,
              fullrange = TRUE, color = "navyblue", size = .8) + 
  geom_segment(aes(x = TV, xend = TV,
                   y = sales, yend = .fitted),
               color = "slategrey") +
  geom_point(aes(TV, sales), color = "red2") +
  scale_x_continuous(expand = c(0,0), limits = c(-10, 310),
                     breaks = scales::breaks_width(50)) +
  scale_y_continuous("Sales", breaks = scales::breaks_width(5)) +
  islr_theme


# Fig 3.2 still visualization
RSS_function <- function(intercept, slope){
  sum((Advertising$sales -intercept  -slope*Advertising$TV)^2)
}

model_3_2 <- Advertising %>% 
  lm(sales ~ TV, data = .) %>% 
  coef() %>% 
  as_tibble_row(.name_repair = ~c("Intercept", "Slope")) %>% 
  mutate(lm_RSS = RSS_function(Intercept, Slope))


B0 <- seq(4.8, 9.2, length.out = 50)
B1 <- seq(0.027, 0.068, length.out = 50)
plot_scale <- (max(B0)-min(B0)) / (max(B1)-min(B1))


data_3_2 <- expand_grid(B0, B1) %>% 
  rowwise() %>% 
  mutate(RSS_values = RSS_function(B0, B1))

### Left plot. Contour

Cairo::CairoWin()
# mutate(RSS_values = round(RSS_values/1000)) %>% 
p <- ggplot(data = data_3_2) +
  geom_contour(aes(x = B0, y = B1, z = RSS_values),
               breaks = c(2200, 2500, 3000, 4000, 5000)) +
  geom_point(data = model_3_2, 
             aes(x = Intercept, y = Slope)) +
  # geom_text(data = stage(after_stat = function(x) x %>% group_by(group) %>% slice(1)),
  #           aes(x=x, y=y, label=after_stat(order))) +
  coord_fixed(ratio = plot_scale) +
  labs(
    x = bquote(~beta[0]), 
    y = bquote(~beta[1])
    )

p + 
  geom_text(aes(x = x, y=y, label = order),
          data = layer_data(p) %>% 
            group_by(group) %>% 
            slice(round(n()/2))) +
  geom_text(aes(x = Intercept, y = Slope, label = round(lm_RSS)),
            nudge_y=.0015, data = model_3_2)

### Right plot. 3d surface


###using lattice to get B0 and B1 to display properly
# Tried to making it with lattice. Abandoned 
# Cairo::CairoWin(); print(
#   lattice::wireframe(RSS_values ~ B0 + B1, data = data_3_2,
#                          xlab = bquote(~beta[0]), ylab = bquote(~beta[1]),
#                          zlab = "RSS", screen = list(z = -60, x = -60),
#                          pts = pts,
#                      panel.3d.wireframe = function(x, y, z, ...) {
#                        panel.3dwire(x = x, y = y, z = z, ...)
#                        panel.3dscatter(x = pts$x,
#                                        y = pts$y,
#                                        z = pts$z,
#                                        ...)
#                      })
#   )

matrix_3_2 <- outer(B0, B1, Vectorize(RSS_function))

Cairo::CairoWin() #For windows users cairo makes the plot looks more sharp
point_pmat <- persp(x = B0, y = B1, z = matrix_3_2,
                    theta = 45, phi = 55, col = 'snow', border = 'dodgerblue3',
                    xlab = 'B0', ylab = 'B1', zlab = 'RSS')
points(trans3d(x = model_3_2$Intercept, y = model_3_2$Slope,
               z = model_3_2$lm_RSS, pmat = point_pmat), col = 'red', pch = 16)


