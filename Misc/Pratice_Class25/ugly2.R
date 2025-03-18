# Load necessary library
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Create a sample data frame with subsets
df <- data.frame(
  x = rep(1:50, times = 3),
  y = cumsum(rnorm(150)),
  group = rep(c("Subset 1", "Subset 2", "Subset 3"), each = 50)
)

# Build the ugly ggplot
ugly_plot <- ggplot(df, aes(x = x, y = y, color = group, shape = group)) +
  geom_line(size = 1.8, linetype = "dashed") +
  geom_point(size = 3) +
  facet_wrap(~ group, ncol = 1) +
  labs(title = "An Ugly ggplot Graph with Subsets",
       x = "X Axis",
       y = "Y Axis") +
  theme(
    # Over-the-top plot background
    plot.background = element_rect(fill = "limegreen", color = "magenta", size = 3),
    # Contrasting panel backgrounds
    panel.background = element_rect(fill = "orange", color = "black", size = 2),
    # Clashing grid lines
    panel.grid.major = element_line(color = "red", linetype = "dotted", size = 1),
    panel.grid.minor = element_line(color = "purple", linetype = "dashed", size = 0.5),
    # Unusual strip (facet) formatting
    strip.background = element_rect(fill = "cyan", color = "brown", size = 1),
    strip.text = element_text(color = "darkblue", size = 16, face = "bold.italic"),
    # Bold title and axis styling
    plot.title = element_text(color = "blue", size = 20, face = "bold", hjust = 0.5),
    axis.title = element_text(color = "darkred", size = 16),
    axis.text = element_text(color = "brown", size = 12)
  )

# Display the plot
print(ugly_plot)
