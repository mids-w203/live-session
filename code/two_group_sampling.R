n <- 6
mu <- 3
sigma <- 4
tData <- replicate(10000, {
  normData <- rnorm(n,mu,sigma);
  (mean(normData) - mu)/(sd(normData)/sqrt(n))
})
f <- function(x) dt(x,3)
ggplot(data.frame(tData), aes(x = tData)) + 
  geom_density() + 
  stat_function(fun = f, color = "red")

movies |>  
  filter(Title == "Toy Story (1995)" | Title == "Toy Story 2 (1999)") |>  
  t.test(Rating ~ Title, data = _)

movies |>  
  filter(Title == "Toy Story (1995)" | Title == "Toy Story 2 (1999)") |>  
  wilcox.test(Rating ~ Title, data = _)

## Among people who rated both, can we run a paired test? 

paired_data <- movies |>  
  filter(Title == "Toy Story (1995)" | Title == "Toy Story 2 (1999)") |>  
  group_by(UserID) |>  
  filter(n_distinct(Title) == 2) |>  
  ungroup() |>  
  select(UserID, Title, Rating) |>  
  pivot_wider(names_from = Title, values_from = Rating) |>
  janitor::clean_names() 

paired_data %$%
  wilcox.test(x = toy_story_1995, y = toy_story_2_1999, paired = TRUE, data = .)
paired_data %$% 
  t.test(x = toy_story_1995, y = toy_story_2_1999, paired = TRUE, data = .)
paired_data %$% 
  wilcox.test(x = toy_story_1995, y = toy_story_2_1999, paired = FALSE, data = .)


movies |>  
  filter(Title == "Toy Story (1995)" | Title == "Toy Story 2 (1999)") |>  
  pivot_wider(names_from = c(Title, UserID), values_from = Rating) |>  
  
  
  
  grep("Toy Story", movies$Title, value = TRUE) |>  unique()

glimpse(movies)
