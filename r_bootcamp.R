#--------------------------------------
# R Bootcamp Script
# January 20, 2024
# 1 - 4 PM
#--------------------------------------

#--------------------------------------
# dplyr: filter and select
#--------------------------------------

mtcars |>
     filter(cyl == 6) |> # filter for 6 cylinders
     select(mpg)         # select the mpg column

#--------------------------------------
# Practice
#--------------------------------------

# What is the hp of cars with 4 cylinders?

#--------------------------------------
# dplyr: mutate and summarize
#--------------------------------------

mtcars |>
     mutate(mpg_per_cyl = mpg / cyl) |> # create a new column
     summarize(mean_mpg_per_cyl = mean(mpg_per_cyl)) # summarize

#--------------------------------------
# Practice
#--------------------------------------

# What is the average hp for a car with 4 cylinders?

# Hint.  Use filter() with summarize()

mtcars |>
     filter() |> # filter for 4 cylinders
     summarize() # summarize avg hp

#--------------------------------------
# ggplot2
#--------------------------------------

ggplot(data = mtcars,
       aes(x = wt, y = mpg)) +
     geom_point() +
     labs(title = "Fuel Efficiency and Weight",
          x = "Weight (1000 lbs)",
          y = "Miles per Gallon")

#--------------------------------------
# Practice
#--------------------------------------

# What is the relationship between a car's horsepower 
# and its fuel efficiency?

ggplot() +
     geom_
     labs