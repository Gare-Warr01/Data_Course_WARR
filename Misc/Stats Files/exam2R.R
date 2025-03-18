2*pnorm(65, 60, 0.5, lower.tail=F) # Pvalue formula 

# Find the critical t-value for a 95% confidence interval
qt(1 - 0.025, df = 29)

# Given data
n1 <- 1080  # Sample size for group program
n2 <- 990   # Sample size for individual program
x1 <- 148   # Successful quitters in group program
x2 <- 120   # Successful quitters in individual program

# Step 1: Compute sample proportions
p1 <- x1 / n1
p2 <- x2 / n2

# Step 2: Compute the pooled proportion
p_pooled <- (x1 + x2) / (n1 + n2)

# Step 3: Compute the standard error (SE)
SE_pooled <- sqrt((p_pooled * (1 - p_pooled) / n1) + (p_pooled * (1 - p_pooled) / n2))

# Step 4: Display result
SE_pooled

