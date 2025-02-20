library(ggplot2)

# Create some random data
data <- data.frame(
  x = 1:10,
  y = c(3, 5, 2, 8, 7, 10, 4, 6, 9, 1)
)

# Create the ugly plot
ggplot(data, aes(x, y)) +
  geom_point(size = 10, shape = 8, color = "#FF00FF") +  # Neon pink star-shaped points
  geom_line(size = 5, linetype = "dashed", color = "#00FF00") +  # Neon green thick dashed line
  theme(
    panel.background = element_rect(fill = "yellow"),  # Yellow background
    panel.grid.major = element_line(color = "red", size = 3),  # Thick red grid lines
    panel.grid.minor = element_line(color = "blue", size = 2),  
    axis.text = element_text(size = 20, family = "Comic Sans MS", color = "purple"),
    axis.title = element_text(size = 30, family = "Papyrus", color = "brown"),  
    plot.title = element_text(size = 40, family = "Wingdings", color = "black", face = "bold") 
  ) +
  labs(title = "Ugly Graph", x = "Horrible X", y = "Terrible Y")
