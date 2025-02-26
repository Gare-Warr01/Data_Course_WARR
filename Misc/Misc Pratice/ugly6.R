library(ggplot2)

# Create some bizarre and unusual data
data <- data.frame(
  category = c("Apples", "Bananas", "Quantum Foam", "42"),
  value = c(3.14, 99, -25, 0.001) # Mixing decimals, large values, negatives, and tiny values
)

# Create a hideous and eye-watering pie chart
ggplot(data, aes(x = "", y = value, fill = category)) +
  geom_bar(stat = "identity", width = 3, color = "black", linetype = "dotted", size = 4, alpha = 0.9) + # Overly thick bars
  coord_polar(theta = "y", start = pi/3, direction = -1) + # Off-angle for maximum chaos
  scale_fill_manual(values = c("#FF0000", "#00FF00", "#0000FF", "#FFFF00")) + # Blinding neon colors
  theme(
    panel.background = element_rect(fill = "green"), # Eye-searing green background
    panel.grid.major = element_line(color = "black", size = 5, linetype = "dashed"), # Thick, distracting grid lines
    axis.text = element_text(size = 3, family = "Comic Sans MS", color = "cyan", angle = 90), # Slanted, unreadable text
    axis.title = element_text(size = 3, family = "Papyrus", color = "orange", face = "italic", angle = 180), # Inverted, awful titles
    plot.title = element_text(size = 3, family = "Wingdings", color = "black", face = "bold", angle = -90), # Unintelligible title
    legend.position = "bottom",
    legend.background = element_rect(fill = "hotpink"), # Clashing pink legend background
    legend.text = element_text(size = 3, color = "purple", family = "Courier", angle = -45) # Tilted, chaotic legend text
  ) +
  labs(title = "The Ultimate Pie Chart Disaster", x = "Unnecessary X Axis", y = "Horrific Y Axis")

