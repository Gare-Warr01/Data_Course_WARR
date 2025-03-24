library(tidyverse)
library(easystats)
library(Lock5Data)
attach(ICUAdmissions)
head(ICUAdmissions)
ICUAdmissions$Infection


# Given data
x1 <- 84  # Deaths with infection
n1 <- 294 # Total patients with infection

x2 <- 116 # Deaths without infection
n2 <- 841 # Total patients without infection

# Perform two-proportion test to get CI
test <- prop.test(c(x1, x2), c(n1, n2), conf.level = 0.95, correct = FALSE)

# Display confidence interval
test$conf.int

prop.test(c(x1, x2), c(n1, n2), conf.level = 0.95, correct =FALSE)
