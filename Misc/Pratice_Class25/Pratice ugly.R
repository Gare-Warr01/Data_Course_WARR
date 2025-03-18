# Ugly Graph in R Studio

# Set seed for reproducibility
set.seed(42)

# Create some data
x <- 1:50
y <- cumsum(rnorm(50))

# Set up a garish plotting environment with a bright background and clashing text colors
par(bg = "yellow", col.main = "purple", col.lab = "orange", col.axis = "green", mar = c(5, 5, 5, 5))

# Plot with conflicting colors, point types, and line types
plot(x, y,
     main = "Behold, The Ugly Graph!",
     xlab = "X Axis", ylab = "Y Axis",
     col = "red", pch = 19, cex = 2, type = "o", lty = 3, lwd = 4)

# Add a horizontal line at the mean (in a contrasting style)
abline(h = mean(y), col = "blue", lty = 2, lwd = 3)

# Overlay an extra line with random noise for extra clutter
lines(x, y + runif(length(y), -5, 5), col = "pink", lty = 4, lwd = 2)

# Add a mismatched grid
grid(col = "darkgreen", lty = 1)

# Clutter the plot by adding random letters at each data point
text(x, y, labels = sample(letters, length(x), replace = TRUE),
     pos = 3, col = "brown", cex = 1.2)

