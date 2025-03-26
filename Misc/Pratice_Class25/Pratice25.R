library(tidyverse)
library(caret)
library(pROC)
---
title: "Graduate School Admissions Analysis"
author: "Garrett"
date: "''"
output: html_document
---
  
  ```{r setup, include=FALSE}
# Set global chunk options for reproducibility
knitr::opts_chunk$set(echo = TRUE, warning = FALSE, message = FALSE)

# Load the dataset
data <- read.csv("./Data/GradSchool_Admissions.csv")
# Display the first few rows
head(data)

# Check the structure of the dataset
str(data)

# Display summary statistics
summary(data)

library(ggplot2)

# Histogram for GRE scores
ggplot(data, aes(x = gre)) +
  geom_histogram(binwidth = 10, fill = "lightblue", color = "black") +
  labs(title = "Distribution of GRE Scores", x = "GRE Score", y = "Count")

# Histogram for GPA
ggplot(data, aes(x = gpa)) +
  geom_histogram(binwidth = 0.1, fill = "lightgreen", color = "black") +
  labs(title = "Distribution of GPA", x = "GPA", y = "Count")

# Bar plot for institution rank
ggplot(data, aes(x = factor(rank))) +
  geom_bar(fill = "lightcoral", color = "black") +
  labs(title = "Undergraduate Institution Rank", x = "Rank", y = "Count")

# Fit the logistic regression model
model <- glm(admit ~ gre + gpa + factor(rank), data = data, family = binomial)
summary(model)

# Create a new data frame for prediction
new_data <- data.frame(
  gre = seq(min(data$gre), max(data$gre), length.out = 100),
  gpa = mean(data$gpa),
  rank = factor(1)  # Assume top-tier institution
)

# Predict probabilities from the logistic model
new_data$predicted_prob <- predict(model, newdata = new_data, type = "response")

# Plot predicted probability against GRE score
ggplot(new_data, aes(x = gre, y = predicted_prob)) +
  geom_line() +
  labs(title = "Predicted Admission Probability",
       subtitle = "For candidates with average GPA and from top-tier institutions (Rank 1)",
       x = "GRE Score",
       y = "Probability of Admission")
