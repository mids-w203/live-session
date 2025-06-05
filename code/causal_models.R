# Load necessary libraries
library(tidyverse)
library(here) 

# Set seed for reproducibility
set.seed(42)

# Number of students
n_students <- 117

# Generate 'ability' from a uniform distribution between 0 and 100
students <- data.frame(
  student_id = 1:n_students,
  ability    = runif(n_students, min = 0, max = 100)
)

# Generate office hour attendance
students <- students %>%
  mutate(
    # Higher ability students tend to attend fewer office hours
    office_hours = round(5 - (ability / 25) + rnorm(n_students, mean = 0, sd = 1)),
    office_hours = pmax(1, pmin(5, office_hours))  # Ensure values stay within [1,5]
  )

# Generate duration of office hours attended per week (normally distributed around 45 mins)
students <- students %>%
  mutate(
    avg_time_per_session = rnorm(n_students, mean = 45, sd = 10),  # Normal dist with 10 min std dev
    avg_time_per_session = pmax(30, pmin(60, avg_time_per_session)), # Keep within [30,60] mins
    time_in_office_hours = office_hours * avg_time_per_session
  )

# Generate red-herring features
students <- students %>% 
  mutate(
    time_reading_book = rnorm(n = n_students, mean = 90 - (ability / 25), sd = 10),
    time_reading_book = round(time_reading_book, 1), 
    practice_problems = rnorm(n = n_students, mean = 4 + (ability / 25), sd = 1), 
    practice_problems = round(pmax(0, pmin(20, practice_problems)), 0)
  )

# Generate test scores
students <- students %>%
  mutate(
    base_score = 70 + (ability / 3),  # Ability contributes positively to test score
    office_hour_boost = office_hours * 1.5,  # Each office hour adds about 1.5 points
    test_score = base_score + office_hour_boost + rnorm(n_students, mean = 0, sd = 3),
    test_score = pmax(70, pmin(100, test_score)) # Ensure within [70,100]
  )

# View the first few rows
print(head(students))

# Save to CSV if needed

write_csv(
  x = students[ , c("student_id", "time_reading_book", "practice_problems", "office_hours", "test_score")], 
  file = here("code/students_data_a.csv")
)

write_csv(
  x = students[ , c("student_id", "time_reading_book", "practice_problems", "office_hours", "time_in_office_hours", "test_score")], 
  file = here("code/students_data_b.csv")
  )

write_csv(
  x = students[ , c("student_id", "time_reading_book", "practice_problems", "office_hours", "time_in_office_hours", "ability", "test_score")], 
  file = here("code/students_data_c.csv")
)