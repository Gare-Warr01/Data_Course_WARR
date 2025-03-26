library(tidyverse)
library(ggplot2)
library(dplyr)
library(caret)

# Load the dataset
mushroom_data <- read.csv("./Data/mushroom_growth.csv")
head(mushroom_data)

# GrowthRate vs Light
ggplot(mushroom_data, aes(x = Light, y = GrowthRate)) + 
  geom_point() + 
  geom_smooth(method = "lm") +
  ggtitle("GrowthRate vs Light")

# GrowthRate vs Temperature
ggplot(mushroom_data, aes(x = Temperature, y = GrowthRate)) + 
  geom_point() + 
  geom_smooth(method = "lm") +
  ggtitle("GrowthRate vs Temperature")

# GrowthRate vs Humidity
ggplot(mushroom_data, aes(x = Humidity, y = GrowthRate)) + 
  geom_point() + 
  geom_smooth(method = "lm") +
  ggtitle("GrowthRate vs Humidity")

# GrowthRate vs Species
ggplot(mushroom_data, aes(x = Species, y = GrowthRate)) + 
  geom_boxplot() +
  ggtitle("GrowthRate by Species")

# Model 1: GrowthRate ~ Light
model1 <- lm(GrowthRate ~ Light, data = mushroom_data)

# Model 2: GrowthRate ~ Temperature + Humidity
model2 <- lm(GrowthRate ~ Temperature + Humidity, data = mushroom_data)

# Model 3: GrowthRate ~ Species
model3 <- lm(GrowthRate ~ Species, data = mushroom_data)

# Model 4: GrowthRate ~ Light + Temperature + Humidity + Species
model4 <- lm(GrowthRate ~ Light + Temperature + Humidity + Species, data = mushroom_data)

# Function to compute MSE
get_mse <- function(model, data) {
  mean((data$GrowthRate - predict(model, data))^2)
}

mse1 <- get_mse(model1, mushroom_data)
mse2 <- get_mse(model2, mushroom_data)
mse3 <- get_mse(model3, mushroom_data)
mse4 <- get_mse(model4, mushroom_data)

# Print all MSEs
cat("MSEs:\nModel 1:", mse1, "\nModel 2:", mse2, "\nModel 3:", mse3, "\nModel 4:", mse4, "\n")

# First, create the new hypothetical data (assuming you already fixed this part)
new_data <- data.frame(
  GrowthRate = c(427, 513, 589),  # manually specified
  Light = c(20, 40, 60),
  Temperature = c(22, 24, 26),
  Humidity = factor(c("Low", "Low", "High"), levels = levels(mushroom_data$Humidity)),
  Species = factor(c("P.ostreotus", "P.ostreotus", "P.ostreotus"), levels = levels(mushroom_data$Species))
)

# Predict values
new_data$GrowthRate <- predict(model4, new_data)
new_data$Type <- "Predicted"

# Add type to original data
mushroom_data$Type <- "Observed"

# Combine for plotting
combined_data <- rbind(
  mushroom_data[, c("Light", "GrowthRate", "Type")],
  new_data[, c("Light", "GrowthRate", "Type")]
)

view(combined_data)
# Plot
ggplot(combined_data, aes(x = Light, y = GrowthRate, color = Type, shape = Type)) +
  geom_point(size = 3) +
  ggtitle("Observed vs Predicted Growth Rate by Light") +
  theme_minimal()
