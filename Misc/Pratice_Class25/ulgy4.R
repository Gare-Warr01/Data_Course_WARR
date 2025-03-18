library(ggplot2)

# Create some random categorical data
data <- data.frame(
  category = c("A", "B", "C", "D"),
  value = c(10, 40, 30, 20)
)

# Create the ugly pie chart
ggplot(data, aes(x = "", y = value, fill = category)) +
  geom_bar(stat = "identity", width = 1, color = "black", linetype = "dotted", size = 3) +
  coord_polar(theta = "y") +
  scale_fill_manual(values = c("#FF0000", "#00FF00", "#0000FF", "#FFFF00")) + # Eye-burning colors
  theme(
    panel.background = element_rect(fill = "pink"), # Horrible pink background
    axis.text = element_text(size = 25, family = "Comic Sans MS", color = "cyan"), # Ugly font & color
    axis.title = element_text(size = 35, family = "Papyrus", color = "green"), # Even worse font
    plot.title = element_text(size = 50, family = "Wingdings", color = "black", face = "bold"), # Unreadable title
    legend.position = "bottom",
    legend.background = element_rect(fill = "orange"), # Clashing legend background
    legend.text = element_text(size = 20, color = "purple", family = "Courier") # More chaos
  ) +
  labs(title = "Unholy Pie Chart", x = "", y = "")

