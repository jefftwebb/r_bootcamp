#--------------------------------------
# R Bootcamp Script
# August 31, 2024
# 1 - 4 PM
#--------------------------------------

# We'll start with base R then move to the tidyverse packages to introduce you 
# some of the more modern tools.

#--------------------------------------
# Using R as a calculator
#--------------------------------------

# - All the usual arithmetic operators are available: +, -, *, /, ^ (raise to a power).
# - Group operations with parentheses: (2 + 2) * 3 is not the same as 2 + 2 * 3.
# = Order of operations applies.

2 + 2

(10 - 3) / 1.5 # different from 10 - 3 / 1.5!

## Practice
# 1. Calculate the result of 189 divided by 3
# 2. Calculate 189 divided by (3 minus 17)
# 3. Experiment with the arrow keys in the console. What do they do?

#--------------------------------------
# Objects
#--------------------------------------

# - Assign values to alphabetic objects with <-, known as the assignment operator.
# - To assign the value of 4 to x, type x <- 4.
# - The object can be used in later calculations.
# - Notice that x is now listed in the Environment pane. It is "in memory" and 
#   available for use.

x <- 4
x * 3

## Practice
# 1. Define two objects, 'a' and 'b', to be 5 and 10, respectively
# 2. Calculate a + b
# 3. Calculate a^2 + b^2
# 4. Try to assign the value 10 to 3 (i.e., 3 <- 10). What happens and why?

#--------------------------------------
# Vectors
#--------------------------------------

# - A vector is a basic data structure in R consisting of any collection of 
#   similar items, observations or measurements.
# - Examples: the letters in the alphabet, salaries of bank managers, heights of 
#   students in a class, whole numbers between 1 and 100, the names of trees.

rivers  # Built-in dataset of North American river lengths

rivers * 2 # Notice that the calculation is done element-wise

## Practice
# 1. Convert the 'rivers' vector from miles to kilometers (1 mile = 1.60934 km)
# 2. Save the result of this conversion to a new object called 'rivers_km'
# 3. Create a histogram of the 'rivers' data using the hist() function

#--------------------------------------
# Functions
#--------------------------------------

# - The various commands we've been using are functions: +, *, <-, etc.
# - Functions take arguments as inputs and output a result.
# - For example, + is a function. It takes two arguments: the numbers to be added. 
#   You can think of it as +(a, b).
# - Functions for calculating summary statistics include mean() and median()
# - Let's visualize the distribution of river lengths with a histogram using the 
#   hist() function.


hist(rivers)

## Practice
# 1. Calculate the mean of the 'rivers' vector
# 2. Calculate the median of the 'rivers' vector
# 3. Find the sum of all river lengths (guess the name of the function)

#--------------------------------------
# Subsetting a Vector
#--------------------------------------

# - Extract a subset of a vector using square brackets, [ ].
# - The numbers in the brackets indicate the index positions of the elements to 
#   be extracted.
# - Index position is the location of an element in a vector. For example, the 
#   first element is at index position 1.

## Practice
# 1. Extract the first element of the 'rivers' vector
# 2. What is the length of the 10th river in the vector?

#--------------------------------------
# Data Types
#--------------------------------------

# R has several basic data types. The most common are:
# - numeric (real numbers)
# - integer (whole numbers)
# - character (text or string data)
# - logical (TRUE or FALSE). Very important in R!

#--------------------------------------
# Logical Vectors
#--------------------------------------

# A logical vector consists of TRUE and FALSE values, which are produced by logical operators:
# - >: greater than
# - <: less than
# - ==: equal to (or identical to)
# - !=: not equal to
# - >=: greater than or equal to
# - <=: less than or equal to
# - !x: not x
# - x | y: OR 
# - x & y: AND

rivers > 1000
sum(rivers > 1000)

## Practice
# 1. How many rivers are longer than 2000 miles?
# 2. How many rivers are shorter than 500 or longer than 1000 miles?
# 3. How many rivers are between 500 and 1000 miles long?
# 4. Create a vector containing only the rivers between 500 and 1000 miles long

#--------------------------------------
# Data Frames 
#--------------------------------------

# - Data frames are the most common data structure in R.
# - They are two-dimensional, consisting of rows and columns, just like a spreadsheet:
#   - The columns are vectors of the same length. Each one has the same data type.
#   - The rows are observations and can contain different data types.

# Example data frame: mtcars

mtcars

#--------------------------------------
# Subsetting Data Frames
#--------------------------------------

# - To subset a data frame, use square brackets [ ] with a comma to separate the rows from the columns: data[rows, columns].
# - To select all rows, leave the row position blank: data[, columns].
# - To select all columns, leave the column position blank: data[rows, ].

mtcars[1, 1]

## Practice
# 1. Select just the first row of mtcars
# 2. Select just the first column (mpg) of mtcars
# 3. Create a histogram of the 'mpg' column
# 4. Select the first 5 rows and the first 3 columns of mtcars

#--------------------------------------
# Installing and Loading Packages 
#--------------------------------------

# 1. Top menu: Tools > Install Packages...
# 2. In the dialog box type 'tidyverse' in the Packages field.
# 3. Click Install.
# 4. To load the package type library(tidyverse) in the console. (You must do 
#    this in every new R session.)

library(tidyverse)

#--------------------------------------
# Data Wrangling with dplyr 
#--------------------------------------

# dplyr is pronounced "dee-ply-er". This package consists of a set of tools--pliers--- 
# for manipulating data frames.

# 4 main verbs:
# - filter(): subsets rows
# - select(): subsets columns
# - mutate(): creates new columns
# - summarize(): summarizes a column

# Additionally, pipes are an important paradigm in modern R programming.
# A pipe looks like this:  |>
# Pipes organize functions sequentially onto different lines for readability.

# filter() and select()
mtcars |>
     filter(cyl == 6) |>
     select(mpg)

## Practice
# 1. Use filter() and select() to find the horsepower (hp) of cars with 4 cylinders

# mutate() and summarize()
mtcars |>
     mutate(mpg_per_cyl = mpg / cyl) |> 
     summarize(mean_mpg_per_cyl = mean(mpg_per_cyl))

## Practice
# 1. Create a new column called 'kpl' (kilometers per liter) by converting 'mpg' 
#    to metric (1 mpg = 0.425144 kpl)
# 2. Calculate the average 'kpl' for each number of cylinders (hint: use group_by())

#--------------------------------------
# group_by
#--------------------------------------

# group_by() groups a data frame into smaller subsets for use with a summary statistic
# to create conditional statistics 

mtcars |>
     group_by(cyl) |>
     summarize(mean_mpg = mean(mpg))

## Practice
# 1. What is average weight by gear?
# 2. What is average and median wt and mpg by cylinder?

#--------------------------------------
# Visualizing Data with ggplot2 
#--------------------------------------

# Relationship between car weight and fuel efficiency
ggplot(data = mtcars,
       aes(x = wt, y = mpg)) +
     geom_point() +
     labs(title = "Fuel Efficiency and Weight",
          x = "Weight (1000 lbs)",
          y = "Miles per Gallon")

## Practice
# 1. Create a scatter plot showing the relationship between horsepower (hp) and 
#    quarter-mile time (qsec)
# 2. Add appropriate labels and a title to your plot
# 3. Color the points based on the number of cylinders (cyl)