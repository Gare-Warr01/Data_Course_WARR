
library(ggplot2)
library(readr)

flu_data <- read_csv('Assignments/Assignment_4/Simulated_Influenza_Data.csv')
flu_data

ggplot(flu_data, aes(x = Year, y = Reported_Cases, color = Dominant_Strain)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(title = "Annual Reported Influenza Cases by Strain",
       x = "Year",
       y = "Reported Cases",
       color = "Dominant Strain") +
  theme_minimal()
