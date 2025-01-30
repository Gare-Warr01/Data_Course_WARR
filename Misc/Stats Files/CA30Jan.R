# Question 1
# Define population
set.seed(2025)  
population <- c("Ravenburg", "Corsair", "Sapphire", "Dallhoise", "Baggate", "Bamboro", "Cherryport", "Foxwood", "Strommond", "Saturo")

# Part (a) 
sample_without_replacement <- sample(population, size = 4, replace = FALSE)
print(sample_without_replacement)

# Part (b) - Random sample of size 4 with replacement (run three times)
set.seed(NULL) 
sample_with_replacement_1 <- sample(population, size = 4, replace = TRUE)
sample_with_replacement_2 <- sample(population, size = 4, replace = TRUE)
sample_with_replacement_3 <- sample(population, size = 4, replace = TRUE)

print(sample_with_replacement_1)
print(sample_with_replacement_2)
print(sample_with_replacement_3)

# Part (c) Explanation:
# "Without replacement" means once object is selected, it cannot be done again. 
# "With replacement" means each it can be repeated 

# Question 2 
library(Lock5Data)
data("PASeniors")  
nrow(PASeniors)
data("PASeniors")  
Sleep1 <- PASeniors$Sleep1
# Part (a)
# The parameter of interest is the population mean sleep hours, denoted as μ (mu).

# Part (b) - graphs
hist(Sleep1, main="Histogram of Sleep Hours", xlab="Sleep Hours", col="red", border="black")
boxplot(Sleep1, main="Boxplot of Sleep Hours", ylab="Sleep Hours", col="orange")

# symmetry and outliers
summary(Sleep1)

# Part (c) - mean and median
mean_sleep <- mean(Sleep1, na.rm = TRUE)
median_sleep <- median(Sleep1, na.rm = TRUE)

print(paste("Mean Sleep Hours:", mean_sleep))
print(paste("Median Sleep Hours:", median_sleep))
# Notation: The mean is denoted as x̄ (x-bar).

# Part (d) - Compute standard deviation and IQR
sd_sleep <- sd(Sleep1, na.rm = TRUE)
iqr_sleep <- IQR(Sleep1, na.rm = TRUE)

print(paste("Standard Deviation:", sd_sleep))
print(paste("Interquartile Range:", iqr_sleep))
# Notation: The standard deviation is denoted as s.

# Part (e) - Approximate range for 95% of sleep hours
lower_bound <- mean_sleep - 2 * sd_sleep
upper_bound <- mean_sleep + 2 * sd_sleep

print(paste("95% of students' sleep hours fall within:", round(lower_bound, 2), "to", round(upper_bound, 2)))

