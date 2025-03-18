# Load necessary libraries
library(tidyverse)
library(ggplot2)
library(reshape2)

# ______________ STEP 1: IMPORT DATA ______________
df <- read.csv("./Assignments:Exams/Assignment_7/Utah_Religions_by_County.csv", stringsAsFactors = FALSE)

# ______________ STEP 2: KEEP ONLY RELIGIOUS & NON-RELIGIOUS DATA ______________
df_filtered <- df %>%
  select(County, Religious, Non.Religious)  # Select only the relevant columns

# Check data structure
glimpse(df_filtered)

# ______________ STEP 3: COMPUTE CORRELATION ______________
correlation_matrix <- cor(df_filtered %>% select(-County), use = "complete.obs")

# Print correlation matrix
print(correlation_matrix)

# Convert correlation matrix to long format for visualization
cor_df <- melt(correlation_matrix)

# ______________ STEP 4: PLOT CORRELATION HEATMAP ______________
ggplot(cor_df, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = round(value, 2)), color = "white") +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  labs(title = "Correlation Heatmap: Religious vs. Non-Religious Proportion",
       x = "", y = "") +
  theme_minimal()

# ______________ STEP 5: SCATTER PLOT FOR RELIGIOUS VS NON-RELIGIOUS ______________
ggplot(df_filtered, aes(x = Religious, y = Non.Religious)) +
  geom_point(color = "blue", alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Adds a trend line
  labs(title = "Scatter Plot: Religious vs. Non-Religious Proportion by County",
       x = "Religious Proportion",
       y = "Non-Religious Proportion") +
  theme_minimal()
