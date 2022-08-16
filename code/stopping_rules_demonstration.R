library(dplyr)
library(magrittr)

make_data <- function(number_of_rows = 10) { 
  d <- data.frame(
    y = c(
      rnorm(n = number_of_rows/2, mean = 0, sd = 1), 
      rnorm(n = number_of_rows/2, mean = 0, sd = 1)),
    x = sample(x = c(TRUE, FALSE), size = number_of_rows, replace = TRUE))
  
  return(d)
}

add_data_retest <- function(existing_data, amount_to_add = 10) { 
  ## this is going to: 
  ##  1. Add data to existing data, and return it into an object
  ##     that persists. 
  ##  2. print the results of a t.test
  
  new_data <- make_data(number_of_rows = amount_to_add)
  
  d <- rbind(existing_data, new_data)
  
  print(paste('There are', nrow(d), 'rows of data now.'))
  print(paste('The t-test p-value is:', round(t.test(y ~ x, data = d)$p.value, 4)))
  
  return(d)
}