#1  Get a subset of the "iris" data frame where it's just even-numbered rows
data("iris")
seq(2,150, 2)
even <- seq(2, 150, 2)
iris_even <- iris[even, ]

# 2  Create a new object called iris_chr which is a copy of iris, except where every column is a character class
as.data.frame(lapply(iris, as.character), stringsAsFactors = FALSE)
iris_chr <- as.data.frame(lapply(iris, as.character), stringsAsFactors = FALSE)

# 3. Create a new numeric vector object named "Sepal.Area" which is the product of Sepal.Length and Sepal.Width
iris$Sepal.Length * iris$Sepal.Width
Sepal.Area <- iris$Sepal.Length * iris$Sepal.Width

# 4. Add Sepal.Area to the iris data frame as a new column
iris$Sepal.Area <- Sepal.Area

# 5. Create a new dataframe that is a subset of iris using only rows where Sepal.Area is greater than 20 
# (name it big_area_iris)
subset(iris, Sepal.Area > 20)
big_area_iris <- subset(iris, Sepal.Area > 20)

# 6.Checking to make sure code runs well 
