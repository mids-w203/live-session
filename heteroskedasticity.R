library(ggplot2)
library(patchwork)

make_data <- function(amount_of_data=10, narrow_or_wide='narrow') {
  if (narrow_or_wide == 'narrow') { 
    x_bases <- c(49, 50, 51) 
    } else if (narrow_or_wide == 'middle') { 
      x_bases <- c(40, 50, 60) 
      } else if (narrow_or_wide == 'wide') { 
        x_bases <- c(20, 50, 80)
      }
  
  x_noise <- rnorm(n = length(x_bases)*amount_of_data, mean = 0, sd = 0.1)
  x       <- rep(x_bases, each = amount_of_data) + x_noise
  y       <- rnorm(n = length(x_bases)*amount_of_data, mean = x_bases, sd = 1)
  
  data.frame(x,y)
  }

pull_coefficients <- function(data) { 
  model <- lm(y ~ x, data = data)
  coef(model)
}

show_regression_lines <- function(narrow_or_wide='narrow', number_of_iterations=100, amount_of_data=10) { 
  d <- make_data(amount_of_data = amount_of_data, narrow_or_wide = narrow_or_wide)
  coefs <- pull_coefficients(d)
  
  regression_plot <- ggplot(data = d) + 
    aes(x,y) + 
    # geom_point() + 
    geom_abline(intercept = coefs[1], slope = coefs[2], alpha = 0.2) + 
    lims(x = c(0, 100), y = c(40, 60))
  
  for (i in 1:number_of_iterations) { 
    d <- make_data(amount_of_data = amount_of_data, narrow_or_wide = narrow_or_wide) 
    coefs <- pull_coefficients(d)
    regression_plot <- regression_plot + 
      geom_abline(intercept = coefs[1], slope = coefs[2], alpha = 0.2)
  }
  print(regression_plot)
}

plot_5_n      <- show_regression_lines(amount_of_data = 5)
plot_50_n     <- show_regression_lines(amount_of_data = 50)
plot_100_n    <- show_regression_lines(amount_of_data = 100)
plot_1000_n   <- show_regression_lines(amount_of_data = 1000)
plot_10000_n  <- show_regression_lines(amount_of_data = 10000)
plot_100000_n <- show_regression_lines(amount_of_data = 100000)

plot_5_m      <- show_regression_lines(narrow_or_wide = 'middle', amount_of_data = 5)
plot_50_m     <- show_regression_lines(narrow_or_wide = 'middle', amount_of_data = 50)
plot_100_m    <- show_regression_lines(narrow_or_wide = 'middle', amount_of_data = 100)
plot_1000_m   <- show_regression_lines(narrow_or_wide = 'middle', amount_of_data = 1000)
plot_10000_m  <- show_regression_lines(narrow_or_wide = 'middle', amount_of_data = 10000)
plot_100000_m <- show_regression_lines(narrow_or_wide = 'middle', amount_of_data = 100000) 

plot_5_w      <- show_regression_lines(narrow_or_wide = 'wide', amount_of_data = 5)

(plot_5_n + plot_50_n) / 
  (plot_100_n + plot_1000_n) / 
    (plot_10000_n + plot_100000_n)

(plot_5_m + plot_50_m) / 
  (plot_100_m + plot_1000_m) / 
    (plot_10000_m + plot_100000_m)

plot_5_n / plot_5_m / plot_5_w

make_data(narrow_or_wide = 'middle')