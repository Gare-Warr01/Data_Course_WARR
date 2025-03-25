# Load necessary libraries
library(tidyverse)

# ______________ STEP 1: IMPORT DATA ______________
# Read in the dataset
df <- read.csv("./Assignments/Assignment_7/Utah_Religions_by_County.csv", stringsAsFactors = FALSE)

# Inspect the data structure
glimpse(df)

# ______________ STEP 2: CLEAN THE DATA ______________
# The data is currently in wide format; we need to tidy it
df_tidy <- df %>%
  pivot_longer(cols = -c(County, Pop_2010),   # Keep County & Population columns
               names_to = "Religion",
               values_to = "Proportion")

# Clean column names (Optional)
df_tidy <- df_tidy %>%
  rename(county = County, population = Pop_2010, religion = Religion, proportion = Proportion) %>%
  mutate(religion = str_replace_all(religion, "_", " "))  # Replace underscores with spaces

# Inspect the cleaned data
glimpse(df_tidy)

# ______________ STEP 3: EXPLORE THE DATASET WITH FIGURES ______________
# Distribution of religious proportions across counties
ggplot(df_tidy, aes(x = proportion)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "black") +
  labs(title = "Distribution of Religious Proportions Across Counties",
       x = "Proportion of Adherents", y = "Count")

# Top 10 religions by average proportion
df_tidy %>%
  group_by(religion) %>%
  summarise(mean_proportion = mean(proportion)) %>%
  arrange(desc(mean_proportion)) %>%
  top_n(10) %>%
  ggplot(aes(x = reorder(religion, mean_proportion), y = mean_proportion)) +
  geom_col(fill = "darkgreen") +
  coord_flip() +
  labs(title = "Top 10 Religions by Average Proportion in Utah Counties",
       x = "Religion", y = "Average Proportion")

# ______________ STEP 4: CORRELATION ANALYSIS ______________

## **Question 1: Does Population Correlate with Any Religion?**
# Compute correlations
correlation_population <- df_tidy %>%
  group_by(religion) %>%
  summarise(correlation = cor(population, proportion, use = "complete.obs"))

# Plot correlation of population with religious proportions
ggplot(correlation_population, aes(x = reorder(religion, correlation), y = correlation)) +
  geom_bar(stat = "identity", fill = "blue") +
  coord_flip() +
  labs(title = "Correlation: County Population vs. Religious Group Proportion",
       x = "Religious Group", y = "Correlation Coefficient")

## **Question 2: Does a Religion Correlate with Non-Religious Proportion?**
# Compute correlation of each religion with non-religious proportion


#______________ STEP 5: SAVE THE CLEANED DATA ______________
write.csv(df_tidy, "Utah_Religions_Tidy.csv", row.names = FALSE)

