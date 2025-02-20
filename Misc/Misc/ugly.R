# Load required library
library(ggplot2)

# Generate random data
set.seed(42)
data <- data.frame(
  Category = rep(letters[1:10], each = 5),
  Value = rnorm(50, mean = 20, sd = 10)
)

# Create the worst graph ever
ugly_plot <- ggplot(data, aes(x = Category, y = Value, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge", color = "pink", size = 5) +  # Oversized bars
  scale_fill_manual(values = sample(colors(), 10)) +  # Random ugly colors
  theme(
    panel.background = element_rect(fill = "yellow"),  # Clashing background
    panel.grid.major = element_line(color = "purple", size = 1, linetype = "dotted"),
    panel.grid.minor = element_line(color = "orange", size = 0.5, linetype = "dashed"),
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 20, color = "red"),
    axis.text.y = element_text(size = 18, face = "italic", color = "blue"),
    plot.title = element_text(size = 25, face = "bold", color = "darkgreen"),
    legend.background = element_rect(fill = "cyan", color = "black"),
    legend.text = element_text(size = 15, face = "bold", color = "darkred")
  ) +
  labs(
    title = "A Truly Horrible Graph",
    x = "Categories (why so many?)",
    y = "Some Random Values"
  ) +
  coord_fixed(ratio = 1)  # Bad aspect ratio

# Display the graph
print(ugly_plot)
