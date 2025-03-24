library(tidyverse)
library(dplyr)
library(tidyr)
library(easystats)
library(janitor)

# 1. Read in the unicef data (10 pts)
unicef <- read_csv("Exams/Exam_2/unicef-u5mr.csv")

# 2. Get it into tidy format (10 pts)
glimpse(unicef)

unicef_long <- unicef %>%
  pivot_longer(
    cols = starts_with("U5MR"),
    names_to = "Year",
    values_to = "U5MR",
    values_drop_na = TRUE
  ) %>%
  mutate(Year = as.numeric(sub("U5MR\\.", "", Year)))

glimpse(unicef_long)

# 3. Plot each country’s U5MR over time (20 pts)
plot1 <- ggplot(unicef_long, aes(x = Year, y = U5MR, group = CountryName)) +
  geom_line(alpha = 0.7) +
  facet_wrap(~ Continent, scales = "free_y") +
  labs(title = "Under-5 Mortality Rate Over Time by Country",
       x = "Year",
       y = "U5MR (deaths per 1000 live births)") +
  theme_minimal()

print(plot1)

# 4. Save this plot as LASTNAME_Plot_1.png (5 pts)
ggsave("Warr_Plot_1.png", plot = plot1, width = 10, height = 6)

# 5. Create another plot that shows the mean U5MR for all the countries 

mean_data <- unicef_long %>%
  group_by(Continent, Year) %>%
  summarise(mean_U5MR = mean(U5MR, na.rm = TRUE)) %>%
  ungroup()

# Create a line plot
plot2 <- ggplot(mean_data, aes(x = Year, y = mean_U5MR, color = Continent)) +
  geom_line() +
  labs(title = "Mean Under-5 Mortality Rate Over Time by Continent",
       x = "Year",
       y = "Mean U5MR (deaths per 1000 live births)") +
  theme_minimal()

print(plot2)

# 6. Save that plot as LASTNAME_Plot_2.png (5 pts)
ggsave("Warr_Plot_2.png", plot = plot2, width = 10, height = 6)

# 7. Create three models of U5MR (20 pts)

unicef_long <- unicef_long %>%
  mutate(Continent = as.factor(Continent))

# Model 1: Only Year
mod1 <- lm(U5MR ~ Year, data = unicef_long)

# Model 2: Year and Continent
mod2 <- lm(U5MR ~ Year + Continent, data = unicef_long)

# Model 3: Year, Continent, and their interaction term
mod3 <- lm(U5MR ~ Year * Continent, data = unicef_long)

mod1
mod2
mod3

# 8. Compare the three models with respect to their performance (20 pts)
rmse <- function(model) {
  sqrt(mean(model$residuals^2, na.rm = TRUE))
}

rmse_mod1 <- rmse(mod1)
rmse_mod2 <- rmse(mod2)
rmse_mod3 <- rmse(mod3)

cat("RMSE for mod1 (Year):", rmse_mod1, "\n")
cat("RMSE for mod2 (Year + Continent):", rmse_mod2, "\n")
cat("RMSE for mod3 (Year * Continent):", rmse_mod3, "\n")

# mod3 has the lowest AIC, we would choose mod3 as our best model.

# 9. Plot the 3 models’ predictions (10 pts)
unicef_long <- unicef_long %>%
  mutate(pred_mod1 = predict(mod1, newdata = unicef_long),
         pred_mod2 = predict(mod2, newdata = unicef_long),
         pred_mod3 = predict(mod3, newdata = unicef_long))

predictions_long <- unicef_long %>%
  dplyr::select(CountryName, Continent, Year, pred_mod1, pred_mod2, pred_mod3) %>%
  tidyr::pivot_longer(
    cols = starts_with("pred_mod"),
    names_to = "Model",
    values_to = "pred"
  ) %>%
  dplyr::mutate(Model = recode(Model,
                               "pred_mod1" = "mod1",
                               "pred_mod2" = "mod2",
                               "pred_mod3" = "mod3"))
head(predictions_long)

ggplot(predictions_long, 
       aes(x = Year, y = pred, group = CountryName, color = Continent)) +
  geom_line(alpha = 0.6) +
  facet_wrap(~ Model, scales = "free_y") +
  labs(title = "Predicted U5MR Over Time by Model (Faceted)",
       x = "Year",
       y = "Predicted U5MR (deaths per 1000 live births)") +
  theme_minimal()

# 10 Bonus Create an improved model (mod4) using a log transformation on U5MR
mod4 <- lm(log(U5MR) ~ Year * Continent, data = unicef_long)

new_ecuador <- data.frame(
  CountryName = "Ecuador",
  Continent = factor("Americas", levels = levels(unicef_long$Continent)),
  Year = 2020
)

pred_log <- predict(mod4, newdata = new_ecuador)

pred_ecuador_mod4 <- exp(pred_log)

difference_mod4 <- pred_ecuador_mod4 - 13

# Print the results
cat("Using mod4:\n")
cat("Predicted U5MR for Ecuador in 2020:", pred_ecuador_mod4, "\n")
cat("Difference from the real value (13):", difference_mod4, "\n")
