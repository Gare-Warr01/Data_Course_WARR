# Assignment 6 - Tidy and Plot BioLog Data
# Author: [Your Name]
# Date: [Date]

# Load required libraries
library(tidyverse)
library(gganimate)

# Step 1: Load untidy dataset
# Adjust this relative path to correctly locate your dataset
raw_data <- read_csv("./Data/BioLog_Plate_Data.csv")

# Step 2: Tidy the dataset into a long format
idy_data <- raw_data %>%
  pivot_longer(cols = starts_with("Hr_"),
               names_to = "Time",
               values_to = "Absorbance") %>%
  mutate(Time = as.numeric(str_remove(Time, "Hr_")))

# Step 3: Create a column to identify sample type (soil or water)
tidy_data <- tidy_data %>%
  mutate(SampleType = if_else(str_detect(`Sample ID`, "Soil"), "Soil", "Water"))

# Filter data for plotting (dilution = 0.1 & substrate = "Itaconic Acid")
plot_data <- tidy_data %>%
  filter(Dilution == 0.1, Substrate == "Itaconic Acid") %>%
  group_by(`Sample ID`, SampleType, Time, Well) %>%
  summarise(mean_absorbance = mean(Absorbance, na.rm = TRUE))

# Step 4: Static plot with ggplot
ggplot(plot_data, aes(x = Time, y = mean_absorbance, color = `Sample ID`)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(title = "Utilization of Itaconic Acid (Dilution = 0.1)",
       x = "Time (Hours)",
       y = "Mean Absorbance",
       color = "Sample ID") +
  theme_minimal()

# Step 5: Animated plot
ggplot(plot_data, aes(x = Time, y = mean_absorbance, color = `Sample ID`)) +
  geom_line(linewidth = 1.2) +
  labs(title = "Itaconic Acid Utilization Over Time",
       subtitle = "Time: {frame_along} hours",
       x = "Time (Hours)",
       y = "Mean Absorbance",
       color = "Sample ID") +
  theme_minimal() +
  transition_reveal(Time) +
  ease_aes('linear')
