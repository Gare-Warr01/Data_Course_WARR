library(ggplot2)
library(Lock5Data)
data("CarDepreciation")

#1 mean and standard deviation
mean(CarDepreciation$Depreciation)
meand <- mean(CarDepreciation$Depreciation)
sd(CarDepreciation$Depreciation)
sdd <- sd(CarDepreciation$Depreciation)
# printing the results
cat(meand)
cat(sdd)

# 2. bootstrap distribution of the Sample Mean
set.seed(123)  # For reproducibility
n_iterations <- 10000  # Number of bootstrap samples
bootstrap_means <- numeric(n_iterations)

# Resampling with replacement and computing the mean for each sample
for (i in 1:n_iterations) {
  sample_bootstrap <- sample(CarDepreciation, size = length(CarDepreciation), replace = TRUE)
  bootstrap_means[i] <- mean(sample_bootstrap)
}
(warning())
# Plot the bootstrap distribution
bootstrap_data <- data.frame(bootstrap_means)
ggplot(bootstrap_data, aes(x = bootstrap_means)) +
  geom_histogram(binwidth = 0.1, fill = "skyblue", color = "black") +
  labs(title = "Bootstrap Distribution of Sample Mean",
       x = "Sample Mean Depreciation",
       y = "Frequency")

# Descriptive Statistics for the Bootstrap Distribution
cat("Bootstrap Mean of Means:", mean(bootstrap_means), "\n")
cat("Bootstrap Standard Deviation:", sd(bootstrap_means), "\n")

# 3. Confidence Interval Using the Bootstrap Standard Error
# Standard error from bootstrap
se_bootstrap <- sd(bootstrap_means)

# 95% Confidence Interval
ci_lower <- mean(bootstrap_means) - 1.96 * se_bootstrap
ci_upper <- mean(bootstrap_means) + 1.96 * se_bootstrap

cat("95% Confidence Interval for Mean Depreciation: [", ci_lower, ",", ci_upper, "]\n")
