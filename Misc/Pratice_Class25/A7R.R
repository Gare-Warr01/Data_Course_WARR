
# Load libraries
library(tidyverse)
library(ggplot2)
library(corrplot)

# Load the dataset
df <- read.csv("./Assignments:Exams/Assignment_7/Utah_Religions_by_County.csv")

# View first few rows
head(df)

# Standardize column names (replace spaces with underscores)
colnames(df) <- gsub(" ", "_", colnames(df))

# Check for missing values
colSums(is.na(df))

# Ensure proportions sum to ~1 (Religious + Non-Religious)
df <- df %>%
  mutate(Total_Proportion = Religious + Non.Religious)

# Check if proportions are valid
head(df %>% select(County, Total_Proportion))

# Convert correlation vector to a properly formatted data frame
non_religious_correlation_df <- data.frame(
  Religion = names(non_religious_correlation),
  Correlation = as.numeric(non_religious_correlation)
) %>%
  filter(Religion != "Non_Religious")  # Remove self-correlation

# Ensure Religion is treated as a factor for ordering in ggplot2
non_religious_correlation_df$Religion <- factor(non_religious_correlation_df$Religion, levels = non_religious_correlation_df$Religion[order(non_religious_correlation_df$Correlation)])

# Plot correlation bar chart
ggplot(non_religious_correlation_df, aes(x = Religion, y = Correlation)) +
  geom_bar(stat = "identity", fill = "red") +
  coord_flip() +
  labs(title = "Correlation Between Religious Proportions and Non-Religious Proportion", 
       x = "Religious Groups", 
       y = "Correlation") +
  theme_minimal()
# Get top 3 correlated religions with population
top_correlated <- names(sort(abs(pop_correlation), decreasing = TRUE))[2:4]

# Generate scatter plots
for (religion in top_correlated) {
  p <- ggplot(df, aes_string(x = "Pop_2010", y = religion)) +
    geom_point(color = "blue") +
    labs(title = paste("Population vs", religion, "Proportion"), x = "County Population", y = paste(religion, "Proportion")) +
    theme_minimal()
  
  print(p)
}

# Extract correlations of Non-Religious with other variables
non_religious_correlation <- cor_matrix["Non_Religious", ]

# Convert correlation vector to a data frame
non_religious_correlation_df <- data.frame(
  Religion = names(non_religious_correlation),
  Correlation = as.numeric(non_religious_correlation)
)

# Remove "Non_Religious" since we're analyzing correlations with it
non_religious_correlation_df <- non_religious_correlation_df %>%
  filter(Religion != "Non_Religious")

# Plot correlation bar chart
ggplot(non_religious_correlation_df, aes(x = reorder(Religion, Correlation), y = Correlation)) +
  geom_bar(stat = "identity", fill = "red") +
  coord_flip() +
  labs(title = "Correlation Between Religious Proportions and Non-Religious Proportion", 
       x = "Religious Groups", 
       y = "Correlation") +
  theme_minimal()

# Get top 3 correlated religious groups with Non-Religious proportion
top_correlated_non_religious <- names(sort(abs(non_religious_correlation), decreasing = TRUE))[2:4]

# Generate scatter plots
for (religion in top_correlated_non_religious) {
  p <- ggplot(df, aes_string(x = "Non_Religious", y = religion)) +
    geom_point(color = "red") +
    labs(title = paste("Non-Religious Proportion vs", religion, "Proportion"), x = "Non-Religious Proportion", y = paste(religion, "Proportion")) +
    theme_minimal()
  
  print(p)
}
