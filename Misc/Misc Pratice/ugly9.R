library(ggplot2)

# Create some bizarre and chaotic data
data <- data.frame(
  category = c("Apples", "Bananas", "Quantum Foam", "42", "Undefined"),
  value = c(3.14, 99, -25, 0.001, 500)
)


ggplot(data, aes(x = "", y = value, fill = category)) +
  geom_bar(stat = "identity", width = 5, color = "black", linetype = "twodash", size = 5, alpha = 1) + 
  coord_polar(theta = "y", start = pi/8, direction = -1) + 
  scale_fill_manual(values = c("#e695d3", "#05f2db", "#a82207", "#7bd48e", "#d1d47b")) + 
  theme(
    panel.background = element_rect(fill = "#fc62d9"), # 
    panel.grid.major = element_line(color = "#91493a", size = 5, linetype = "dotdash"), 
    axis.text = element_text(size = 5, family = "Comic Sans MS", color = "#5a7d94", angle = 180), 
    axis.title = element_text(size = 8, family = "Papyrus", color = "#46916c", face = "italic", angle = 210), 
    plot.title = element_text(size = 2, family = "Wingdings", color = "#2e2729", face = "bold", angle = -35),
    legend.position = "top",
    legend.background = element_rect(fill = "#a8d61e"), 
    legend.text = element_text(size = 10, color = "#5c255b", family = "Courier", angle = 45) # Diagonally rotated legend text
  ) +
  labs(title = "The Ultimate Pie Chart Eyesore", x = "What Even Is This", y = "Utter Confusion")

