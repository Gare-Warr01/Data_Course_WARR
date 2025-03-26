# Load packages ---------------------------
library(tidyverse)

# Load data ---------------------------
mushrooms <- read_csv("./Data/mushroom_growth.csv")

# Explore data ---------------------------
glimpse(mushrooms)

# Plot numeric predictors vs GrowthRate ---------------------------

# Identify numeric columns excluding the response
numeric_predictors <- mushrooms %>% 
  select(where(is.numeric), -GrowthRate) %>% 
  names()

# Pivot only numeric columns
mushrooms %>% 
  select(GrowthRate, all_of(numeric_predictors)) %>% 
  pivot_longer(!GrowthRate, names_to = "variable", values_to = "value") %>% 
  ggplot(aes(x = value, y = GrowthRate)) +
  geom_point(alpha = 0.6) +
  facet_wrap(~ variable, scales = "free_x") +
  theme_minimal() +
  labs(title = "Numeric Predictors vs GrowthRate")


# Define models ---------------------------

# Model 1: Simple linear on Light
model_1 <- lm(GrowthRate ~ Light, data = mushrooms)

# Model 2: Add Temperature
model_2 <- lm(GrowthRate ~ Light + Temperature, data = mushrooms)

# Model 3: Add Humidity
model_3 <- lm(GrowthRate ~ Light + Temperature + Humidity, data = mushrooms)

# Model 4: All predictors + interaction
model_4 <- lm(GrowthRate ~ Light * Temperature + Humidity  + Nitrogen, data = mushrooms)

# MSE calculation function ---------------------------
calculate_mse <- function(model, data) {
  mean((data$GrowthRate - predict(model, newdata = data))^2)
}

# Calculate MSE for each model ---------------------------
mse_1 <- calculate_mse(model_1, mushrooms)
mse_2 <- calculate_mse(model_2, mushrooms)
mse_3 <- calculate_mse(model_3, mushrooms)
mse_4 <- calculate_mse(model_4, mushrooms)

mse_results <- tibble(
  model = c("Model 1", "Model 2", "Model 3", "Model 4"),
  mse = c(mse_1, mse_2, mse_3, mse_4)
)

print(mse_results)

# Select best model ---------------------------
best_model <- model_4  # Assuming lowest MSE
formula(best_model)

# New hypothetical data ---------------------------
new_data <- tibble(
  Light = c(10, 20, 0),
  Temperature = c(20, 25, 30),
  Humidity = c('Low', 'Low', 'High'),
  Nitrogen = c(5, 6, 7)
)

new_data$GrowthRate <- predict(model_4, new_data)
new_data$Type <- "Predicted"

print(new_data)


# Plot predictions vs actual ---------------------------
mushrooms$Type <- "Observed"

# Combine for plotting
combined_data <- rbind(
  mushrooms[, c("Light", "GrowthRate", 'Humidity', 'Nitrogen', 'Type')],
  new_data[, c("Light", "GrowthRate", 'Humidity', 'Nitrogen', 'Type')])
 

ggplot(combined_data, aes(x = Light, y = GrowthRate, color = Type, shape = Type)) +
  geom_point(size = 3) +
  ggtitle("Observed vs Predicted Growth Rate by Light") +
  theme_minimal()
