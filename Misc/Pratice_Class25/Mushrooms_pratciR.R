# Assignment 8 - Mushroom Growth Modeling

# Load required libraries
library(tidyverse)
library(caret)


# 1. Load the dataset
data <- read_csv("Data/mushroom_growth.csv")

# 2. Explore the data with plots
glimpse(data)
summary(data)

# Scatter plots
ggplot(data, aes(x = Light, y = GrowthRate)) + geom_point() + geom_smooth(method = "lm") + ggtitle("GrowthRate vs Light")
ggplot(data, aes(x = Humidity, y = GrowthRate)) + geom_point() + geom_smooth(method = "lm") + ggtitle("GrowthRate vs Humidity")
ggplot(data, aes(x = Temperature, y = GrowthRate)) + geom_point() + geom_smooth(method = "lm") + ggtitle("GrowthRate vs Temperature")
ggplot(data, aes(x = Species, y = GrowthRate)) + geom_boxplot() + ggtitle("GrowthRate vs Species")

# 3. Define models
model1 <- lm(GrowthRate ~ Light, data = data)
model2 <- lm(GrowthRate ~ Light + Humidity, data = data)
model3 <- lm(GrowthRate ~ Light + Humidity + Temperature, data = data)
model4 <- lm(GrowthRate ~ Light + Humidity + Temperature + Species, data = data)

# 4. Calculate mean squared errors
mse <- function(model) mean(resid(model)^2)

mse1 <- mse(model1)
mse2 <- mse(model2)
mse3 <- mse(model3)
mse4 <- mse(model4)

mse_results <- tibble(
  Model = c("Light only", "Light + Humidity", "Light + Humidity + Temp", "All Predictors"),
  MSE = c(mse1, mse2, mse3, mse4)
)

print(mse_results)

# 5. Select best model (lowest MSE)
best_model <- model4

# 6. Add predictions for hypothetical values

# 7. Plot predictions alongside real data
