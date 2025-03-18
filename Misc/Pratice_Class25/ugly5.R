library(ggplot2)

# Create some random data
data <- data.frame(
  category = c("A", "B", "C", "D"),
  value = c(10, 40, 30, 20)
)

# Create the unholy combination of an ugly scatter plot and pie chart
ggplot(data, aes(x = category, y = value, fill = category)) +
  geom_bar(stat = "identity", width = 1, color = "black", linetype = "dotted", size = 3) +
  geom_point(aes(y = value * 2), size = 15, shape = 8, color = "#FF00FF") + # Neon pink star points
  geom_line(aes(y = value * 1.5), size = 5, linetype = "dashed", color = "#00FF00") + # Neon green thick dashed line
  coord_polar(theta = "y") +
  scale_fill_manual(values = c("#FF0000", "#00FF00", "#0000FF", "#FFFF00")) + # Eye-burning colors
  theme(
    panel.background = element_rect(fill = "yellow"), # Horrible yellow background
    panel.grid.major = element_line(color = "red", size = 3), # Thick red grid lines
    panel.grid.minor = element_line(color = "blue", size = 2), # Thick blue minor grid lines
    axis.text = element_text(size = 25, family = "Comic Sans MS", color = "cyan"), # Ugly font & color
    axis.title = element_text(size = 35, family = "Papyrus", color = "green"), # Even worse font
    plot.title = element_text(size = 50, family = "Wingdings", color = "black", face = "bold"), # Unreadable title
    legend.position = "bottom",
    legend.background = element_rect(fill = "orange"), # Clashing legend background
    legend.text = element_text(size = 20, color = "purple", family = "Courier") # More chaos
  ) +
  labs(title = "The Worst Graph Ever", x = "Horrible X", y = "Terrible Y")
