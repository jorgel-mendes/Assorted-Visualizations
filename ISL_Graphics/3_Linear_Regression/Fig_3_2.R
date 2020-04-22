function(){
  library(tidyverse)
  Advertising <- read_csv('http://faculty.marshall.usc.edu/gareth-james/ISL/Advertising.csv',
                        col_types = cols(X1 = col_skip()))

  model_3_2 <- Advertising %>% 
    lm(sales ~ TV, data = .) %>% 
    coef()
  
  B0 <- seq(4.9, 9.1, length.out = 100)
  B1 <- seq(0.027, 0.069, length.out = 100)

  ### Left plot. Contour
  

    




  ### Right plot. 3d surface

  RSS_function <- function(intercept, slope){
    sum((Advertising$sales -intercept*rep(1,200)  -slope*Advertising$TV)^2)
  }
  
  data_3_2 <- expand_grid(B0, B1) %>% 
    mutate(RSS_values = map2_dbl(B0, B1, RSS_function))

  RSS_surface <- outer(B0, B1, FUN = Vectorize(RSS_function))

  print(lattice::wireframe(RSS_values ~ B0 + B1, data = data_3_2,
                           xlab = bquote(~beta[0]), ylab = bquote(~beta[1]),
                           zlab = "RSS"))
  
  plot_ly() %>% 
    add_surface(x = B0, y = B1, z = RSS_surface) %>% 
    add_markers(x = model_3_2[1], y = model_3_2[2], 
               z = RSS_function(model_3_2[1], model_3_2[2]))
    
  
  
}


