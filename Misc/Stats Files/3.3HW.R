library(Lock5Data)
library(tidyverse)

CarDep <- data("CarDepreciation")
head(CarDepreciation)

# step 1 Find mean and SD
mean_depreciation <- mean(CarDepreciation$Depreciation)
sd_depreciation <- sd(CarDepreciation$Depreciation)

mean_depreciation
sd_depreciation

# Step 2 Create a bootstrap

# Load necessary library
library(boot)
boot_mean <- function(data, indices) {
  return(mean(data[indices]))
}
set.seed(123)
bootstrap_results <- boot(CarDepreciation$Depreciation, boot_mean, R = 10000)
bootstrap_means <- bootstrap_results$t
hist(bootstrap_means, main="Bootstrap Distribution of Mean Depreciation",
     xlab="Mean Depreciation", col="lightblue", breaks=30, border="black")

# Describe the Bootstrap  Shape = Normal center, Center = Close to mean 
se_bootstrap <- sd(bootstrap_means)
se_bootstrap

# Step 3 95% confidence interval 
# Compute the standard error
se_bootstrap <- sd(bootstrap_means)
ci_lower <- quantile(bootstrap_means, 0.025)
ci_upper <- quantile(bootstrap_means, 0.975)
se_bootstrap
ci_lower
ci_upper

