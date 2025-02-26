library(ggplot2)

# Create some bizarre and chaotic data
data <- data.frame(
  category = c("Apples", "Bananas", "Quantum Foam", "42", "Undefined"),
  value = c(3.14, 99, -25, 0.001, 500) # Mixing decimals, large values, negatives, and tiny values
)

# Create an even uglier and chaotic pie chart mixed with other elements
ggplot(data, aes(x = "", y = value, fill = category)) +
  geom_bar(stat = "identity", width = 9, color = "black", linetype = "twodash", size = 6, alpha = 1) + # Ridiculously thick bars
  geom_point(aes(y = value * 2), size = 8, shape = 8, color = "#00FF00") + # Random large green stars
  geom_line(aes(y = value * 1.5), size = 7, linetype = "dotted", color = "#FF0000") + # Thick dotted red line
  coord_polar(theta = "y", start = pi/8, direction = -1) + # Off-angle and reversed for max confusion
  scale_fill_manual(values = c("#FF00FF", "#00FFFF", "#FF0000", "#00FF00", "#FFFF00")) + # Absolute eye-pain color scheme
  theme(
    panel.background = element_rect(fill = "magenta"), # Blinding magenta background
    panel.grid.major = element_line(color = "red", size = 5, linetype = "dotdash"), # Absurdly thick red grid lines
    axis.text = element_text(size = 3, family = "Comic Sans MS", color = "blue", angle = 180), # Upside-down, clashing text
    axis.title = element_text(size = 5, family = "Papyrus", color = "chartreuse", face = "italic", angle = 270), # Huge, rotated, terrible font
    plot.title = element_text(size = 6, family = "Wingdings", color = "black", face = "bold", angle = -45), # Unintelligible tilted title
    legend.position = "top",
    legend.background = element_rect(fill = "yellow"), # Bright yellow clashing legend background
    legend.text = element_text(size = 3, color = "purple", family = "Courier", angle = 45) # Diagonally rotated legend text
  ) +
  labs(title = "The Ultimate Pie Chart Eyesore", x = "What Even Is This", y = "Utter Confusion")

