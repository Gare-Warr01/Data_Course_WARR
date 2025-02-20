# Load necessary library
library(ggplot2)

# Set seed for reproducibility
set.seed(456)

# Create a data frame with three subsets
df <- data.frame(
  x = rep(1:50, times = 3),
  y = cumsum(rnorm(150)),
  group = rep(c("Subset 1", "Subset 2", "Subset 3"), each = 50)
)

# Multiply the ugliness by 5: add extra noisy variation and random letters at each point
df$y_noise <- df$y + runif(nrow(df), -5, 5)
df$label <- sample(letters, nrow(df), replace = TRUE)

# Compute mean y for each group to add a horizontal reference line
df_mean <- aggregate(y ~ group, data = df, FUN = mean)

# Build the ultra-ugly ggplot graph
ugly_overload <- ggplot(df, aes(x = x, y = y, color = group, shape = group)) +
  # Main dashed line
  geom_line(size = 2.5, linetype = "dashed") +
  # Bold, oversized points
  geom_point(size = 4) +
  # Overlaid noisy line for extra clutter
  geom_line(aes(y = y_noise), color = "magenta", linetype = "dotted", size = 2) +
  # Horizontal line at group mean (a nod to our base R example)
  geom_hline(data = df_mean, aes(yintercept = y), color = "blue", linetype = "dotdash", size = 2) +
  # Random letters scattered across the plot
  geom_text(aes(label = label), vjust = -1, color = "brown", size = 6) +
  # Facet by group to add more chaos
  facet_wrap(~ group, ncol = 1) +
  # Over-the-top labels
  labs(title = "Ugliness Overload: Times the Ugly by 5",
       subtitle = "Combining the worst of both worlds in one chaotic graph",
       x = "X Axis (Disorder Scale)",
       y = "Y Axis (Random Walk Chaos)") +
  # An extremely clashing theme
  theme(
    plot.background = element_rect(fill = "hotpink", color = "gold", size = 4),
    panel.background = element_rect(fill = "chartreuse", color = "navy", size = 3),
    panel.grid.major = element_line(color = "red", linetype = "dotted", size = 1.5),
    panel.grid.minor = element_line(color = "purple", linetype = "dashed", size = 1),
    strip.background = element_rect(fill = "cyan", color = "brown", size = 2),
    strip.text = element_text(color = "darkblue", size = 20, face = "bold.italic"),
    plot.title = element_text(color = "blue", size = 28, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(color = "darkred", size = 22, face = "italic", hjust = 0.5),
    axis.title = element_text(color = "darkred", size = 18),
    axis.text = element_text(color = "brown", size = 14)
  )

# Display the plot
print(ugly_overload)
