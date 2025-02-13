library(Lock5Data)
library(tidyverse)

# Question 1 
# Part A Sample data: responses of students to whether they prefer studying in the morning
responses <- c("yes", "yes", "yes", "yes", "no", "no", "no", "no", "no", "no", "no", "no")
responses_numeric <- ifelse(responses == "yes", 1, 0)
prop_yes <- mean(responses_numeric)
prop_yes

#Part B  Set seed
set.seed(123)
bootstrap_sample <- sample(responses_numeric, size=length(responses_numeric), replace=TRUE)
prop_bootstrap <- mean(bootstrap_sample)
prop_bootstrap

#Part C Generate 1000 bootstrap samples
n_bootstrap <- 1000
bootstrap_proportions <- replicate(n_bootstrap, {
  bootstrap_sample <- sample(responses_numeric, size=length(responses_numeric), replace=TRUE)
  mean(bootstrap_sample)
})
head(bootstrap_proportions)

#Part D Visualize bootstrap distribution with histogram
hist(bootstrap_proportions, main="Bootstrap Distribution of Proportion", xlab="Proportion of 'Yes' (Morning Study)", col="lightblue", border="black")
mean_bootstrap <- mean(bootstrap_proportions)
mean_bootstrap

#Part E Calculate 90% confidence interval
ci_lower <- quantile(bootstrap_proportions, 0.05)
ci_upper <- quantile(bootstrap_proportions, 0.95)
c(ci_lower, ci_upper)


# Question 2. (18 pts) The dataset "MustangPrice"
# Question A Mean and Standard Deviation 
data("MustangPrice")
MustangPrice$Price
n <- length(MustangPrice$Price)
mean_price <- mean(MustangPrice$Price)
sd_price <- sd(MustangPrice$Price)
print(mean_price)
print(sd_price)
hist(MustangPrice$Price, main = "Mustang Prices Distribution", xlab = "Price (in $1000s)", col = "lightblue")

# Question B thru D Bootstrap and Visualation 
set.seed(123) 
B <- 10000
bootstrap_means <- replicate(B, mean(sample(MustangPrice$Price, size = n, replace = TRUE)))
ggplot(data.frame(bootstrap_means), aes(x = bootstrap_means)) +
  geom_histogram(color = "black", fill = "lightblue", bins = 30) +
  labs(title = "Bootstrap Distribution of Mean Mustang Price", x = "Mean Price ($1000s)", y = "Frequency")

# Question E thru F  95% interval and Standard Error 
CI_95_percentile <- quantile(bootstrap_means, c(0.025, 0.975))
SE_bootstrap <- sd(bootstrap_means)
CI_95_SE <- mean_price + c(-1.96, 1.96) * SE_bootstrap

# See results 
cat("Sample Mean:", mean_price, "\n")
cat("Sample Standard Deviation:", sd_price, "\n")
cat("95% Confidence Interval (Percentile Method):", CI_95_percentile, "\n")
cat("95% Confidence Interval (SE Method):", CI_95_SE, "\n")


