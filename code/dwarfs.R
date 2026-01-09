library(dplyr)
library(ggplot2)

test_scores <- data.frame(
  hours_studied = rpois(n=98, 20), 
  dwarf = sample(c("dopy", "sleepy", "grumpy"), size = 98, replace = TRUE)
  ) |> 
  mutate(
    # score = 60 +  10* log(hours_studied) + rnorm(n=n(), sd=.1)
    # hours_studied_2 = hours_studied^2,
    # score = 60 + 2*hours_studied - 1*I(hours_studied^2) + rnorm(n=n())
    score = 60 + 2*hours_studied - 10*I(dwarf == "sleepy") - 3*I(dwarf == "sleepy")*hours_studied + rnorm(n=n()))


test_scores |> 
  ggplot() + 
  aes(x=hours_studied, y=score, colour=dwarf) + 
  geom_point()

cor(test_scores)

test_scores |> 
  ggplot() + 
  aes(x=hours_studied, y=score) + 
  geom_point() + 
  stat_smooth()

test_scores

## I think that at first, it will be really helpful, but then later on
## adding more hours won't matter that much. 

model_1 <- lm(score ~ hours_studied, data = test_scores)
model_2 <- lm(score ~ hours_studied + I(hours_studied^2), data = test_scores)

model_3 <- lm(score ~ hours_studied + I(hours_studied^2) + I(hours_studied^3), data = test_scores)
model_4 <- lm(score ~ log(hours_studied), data = test_scores)

summary(model_1)
summary(model_2)
summary(model_3)
summary(model_4)

anova(model_2, model_1)

predict(model_2, newdata = data.frame(hours_studied = c(10, 15)))
predict(model_2, newdata = data.frame(hours_studied = c(25, 30)))


## Conditional Models 

model_1 <- lm(score ~ hours_studied,         data = test_scores)
model_2 <- lm(score ~ hours_studied * dwarf, data = test_scores)

summary(model_1)
summary(model_2)

predict(
  object = model_2, 
  newdata = data.frame(
    dwarf = c("grumpy"), 
    hours_studied = c(15, 16))
  )
