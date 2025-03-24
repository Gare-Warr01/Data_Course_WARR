library(Lock5Data)
library(tidyverse)

#Question 1 part(a)-(i)
# part(a) null and alternative hypotheses
# H0: The reaction time of the dominant hand is greater than or equal to the nondominant hand
# HA: The reaction time of the dominant hand is less than the nondominant hand

# part(b) Read the CSV file into R
hands <- read.csv("./Misc/Stats Files/hands.csv")

# look at data
head(hands)

# part(c) Identify type of design
# This Data is paired design because each student has two measurements (there hands), The data set is dependent.

# part(d) Reduce to a single data set
hands$Difference <- hands$Nondominant.Hand - hands$Dominant.Hand

# View New Data
head(hands)

# part(e) Checking data size and normality
# qqnorm and qqline
qqnorm(hands$Difference)
qqline(hands$Difference, col = "blue")

# Shapiro-Wilk
shapiro.test(hands$Difference)

# Boxplot
boxplot(hands$Difference, main="Boxplot of Differences", ylab="Reaction Time Difference")

# part(f) Interpretation
# Check p-value = 0.5413
# If p > 0.05, p-value is greater then 0.05, p-value is 0.5414
# no outliers 

# part(g) t-test be preformed in this situation = yes 
t_test_result <- t.test(hands$Dominant.Hand, hands$Nondominant.Hand, paired = TRUE, alternative = "less")

# Show Results of T
t_test_result

# part(h) Decision
if (t_test_result$p.value < 0.05) {
  print("Reject the null hypothesis: The dominant hand has a faster reaction time.")
} else {
  print("Fail to reject the null hypothesis: No significant difference.")
}

# (i) Using t.test in RStudio, part g has the data from the pairs.

#Question 2 part(a) - (c) using data from Lock5Data
# part(a) Load it 
data("StudentSurvey")

# View it
head(StudentSurvey)

# Mean of TV hours by gender
library(dplyr)
tv_summary <- StudentSurvey %>%
  group_by(Sex) %>%
  summarise(
    N = n(),
    Mean_TV = mean(TV, na.rm = TRUE),
    SD_TV = sd(TV, na.rm = TRUE)
  )

# summary
print(tv_summary)

# Difference
mean_diff <- tv_summary$Mean_TV[tv_summary$Sex == "M"] - tv_summary$Mean_TV[tv_summary$Sex == "F"]
print(paste("Males watch", mean_diff, "more hours of TV per week on average than females."))

# part(b) Compute 96% CI
n_f <- tv_summary$N[tv_summary$Sex == "F"]
mean_f <- tv_summary$Mean_TV[tv_summary$Sex == "F"]
sd_f <- tv_summary$SD_TV[tv_summary$Sex == "F"]

n_m <- tv_summary$N[tv_summary$Sex == "M"]
mean_m <- tv_summary$Mean_TV[tv_summary$Sex == "M"]
sd_m <- tv_summary$SD_TV[tv_summary$Sex == "M"]

# SE
se_diff <- sqrt((sd_f^2 / n_f) + (sd_m^2 / n_m))

# Z-score for 96% CI
alpha <- 0.04  # 96% confidence level
z_critical <- qnorm(1 - alpha/2)

# bounds
ci_lower <- mean_diff - z_critical * se_diff
ci_upper <- mean_diff + z_critical * se_diff

# Print
print(paste("96% Confidence Interval: (", round(ci_lower, 3), ",", round(ci_upper, 3), ")"))

# part(c) Interpretation
if (ci_lower > 0) {
  print("Since the confidence interval does not include 0, we conclude that males watch significantly more TV than females.")
} else if (ci_upper < 0) {
  print("Since the confidence interval does not include 0, we conclude that females watch significantly more TV than males.")
} else {
  print("Since the confidence interval includes 0, there is no significant difference in TV-watching time between males and females.")
}

