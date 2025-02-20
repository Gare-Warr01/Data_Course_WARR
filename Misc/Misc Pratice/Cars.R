library(ggplot2)
data("mtcars")

# 1. Subset mtcars for only automatic transmissions (am == 0)
auto_mtcars <- subset(mtcars, am == 0)
auto_mtcars

# 2. Save the automatic transmission dataset
write.csv(auto_mtcars, "automatic_mtcars.csv", row.names = FALSE)

# 3. Plot Horsepower vs MPG for automatic cars
hp_plot <- ggplot(auto_mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "blue") +
  labs(title = "MPG vs Horsepower (Automatic Cars)",
       x = "Horsepower (hp)",
       y = "Miles per Gallon (MPG)") +
  theme_minimal()

# Save the plot as a PNG
ggsave("mpg_vs_hp_auto.png", plot = hp_plot, width = 6, height = 4)

# 4. Plot Weight vs MPG for automatic cars
wt_plot <- ggplot(auto_mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "red") +
  labs(title = "MPG vs Weight (Automatic Cars)",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon (MPG)") +
  theme_minimal()

# Save the plot as a TIFF
ggsave("mpg_vs_wt_auto.tiff", plot = wt_plot, width = 6, height = 4, device = "tiff")

# 5. Subset original mtcars for displacement <= 200
mtcars_max200 <- subset(mtcars, disp <= 200)

# 6. Save the subsetted dataset
write.csv(mtcars_max200, "mtcars_max200_displ.csv", row.names = FALSE)

# 7. Calculate maximum horsepower for each dataset
max_hp_original <- max(mtcars$hp)
max_hp_auto <- max(auto_mtcars$hp)
max_hp_max200 <- max(mtcars_max200$hp)

# 8. Write the maximum horsepower values to a text file
hp_output <- paste(
  "Maximum Horsepower Values:",
  "Original mtcars: ", max_hp_original,
  "Automatic Transmission Cars: ", max_hp_auto,
  "Displacement ≤ 200 Cars: ", max_hp_max200,
  sep = "\n"
)

writeLines(hp_output, "hp_maximums.txt")

# Print completion message
print("Assignment 5 tasks completed! All required files are saved.")
