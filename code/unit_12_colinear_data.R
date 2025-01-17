library(tidyverse)
library(car)

left_coef           <- NA
left_coef_colinear  <- NA
right_coef_colinear <- NA

for(i in 1:1000) { 
  d <- data.frame(
    left_foot_size = rnorm(n=100000, mean=245, sd=40)) |>  
    mutate(
      right_foot_size_dirty = left_foot_size + rnorm(n=n(), mean = 0, sd = 2),
      two_d_four_d          = rnorm(n=n(), mean=245, sd=40),
      height                = rnorm(n=n(), mean=left_foot_size - 80) + rnorm(n=n(), mean = 0, sd = 10)
    )
  
  model <- lm(
    formula = height ~ left_foot_size, 
    data = d
  )
  
  model_colinear <- lm(
    formula = height ~ left_foot_size + right_foot_size_dirty + two_d_four_d,
    data = d
  )
  
  left_coef[i]           <- coef(model)['left_foot_size']
  left_coef_colinear[i]  <- coef(model_colinear)['left_foot_size']
  right_coef_colinear[i] <- coef(model_colinear)['right_foot_size']
  }

plot(
  x = left_coef_colinear, 
  y = right_coef_colinear, 
  pch = '.'
)

## CAR Package: Companion to Applied Regression in R 
## This is one of those "rules of thumb..." 
## If the VIF is > 4 then we are worried about them. 
car::vif(model_colinear)
summary(model_colinear)