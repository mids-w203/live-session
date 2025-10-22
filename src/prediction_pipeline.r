readRDS('foo.RDS')

args <- commandArgs(trailingOnly = TRUE)

predict(mod, newdata = args)