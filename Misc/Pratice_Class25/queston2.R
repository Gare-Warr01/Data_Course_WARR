# Load necessary libraries
library(tidyverse)

# ______________ STEP 1: IMPORT CLEANED DATA ______________
df <- read.csv("./Assignments:Exams/Assignment_7/Utah_Religions_by_County.csv", stringsAsFactors = FALSE)

# Remove the "Religious" column (since it's redundant)
df <- df %>%
  select(-Religious)

# Convert from wide to long format (tidy data)
df_tidy <- df %>%
  pivot_longer(cols = -c(County, Pop_2010), 
               names_to = "Religion", 
               values_to = "Proportion")

# Rename columns for consistency
df_tidy <- df_tidy %>%
  rename(county = County, population = Pop_2010, religion = Religion, proportion = Proportion)

# ______________ STEP 2: MERGE NON-RELIGIOUS PROPORTIONS ______________

# Extract Non-Religious proportion for each county
non_religious_df <- df_tidy %>%
  filter(religion == "Non-Religious") %>%
  select(county, non_religious_proportion = proportion)

# Merge Non-Religious proportions back into the main dataset
df_tidy <- df_tidy %>%
  left_join(non_religious_df, by = "county")

# Remove rows where non_religious_proportion is missing
df_tidy <- df_tidy %>%
  drop_na(non_religious_proportion)

# ______________ STEP 3: CHECK RELIGION GROUP SIZES (Only Keep Religions with 2+ Valid Data Points) ______________
# Ensure each religion has at least 2 counties reporting both values
valid_religions <- df_tidy %>%
  filter(religion != "Non-Religious") %>%
  group_by(religion) %>%
  summarise(valid_counties = sum(!is.na(proportion) & !is.na(non_religious_proportion))) %>%
  filter(valid_counties >= 2)  # Keep only religions appearing in at least 2 valid counties

# ______________ STEP 4: COMPUTE CORRELATION SAFELY ______________

# Compute correlation for each religion that has enough valid data points
correlation_non_religious <- df_tidy %>%
  filter(religion %in% valid_religions$religion) %>%  # Only include valid religions
  group_by(religion) %>%
  summarise(correlation = ifelse(n() >= 2, cor(proportion, non_religious_proportion, use = "complete.obs"), NA))

# Remove rows with NA correlation (those that still had issues)
correlation_non_religious <- correlation_non_religious %>%
  drop_na(correlation)

# Print correlation results
print(correlation_non_religious)

valid_religions <- df_tidy %>%
  filter(religion != "Non-Religious") %>%
  group_by(religion) %>%
  summarise(valid_counties = sum(!is.na(proportion) & !is.na(non_religious_proportion))) %>%
  filter(valid_counties >= 1)  # Changed from 2 to 1 to allow more religions
if(nrow(correlation_non_religious) > 0) {
  ggplot(correlation_non_religious, aes(x = reorder(religion, correlation), y = correlation)) +
    geom_bar(stat = "identity", fill = "red") +
    coord_flip() +
    labs(title = "Correlation: Religious Group Proportion vs. Non-Religious Proportion",
         x = "Religious Group", y = "Correlation Coefficient")
} else {
  print("No valid correlations found. Try adjusting the filtering criteria.")
}


# ______________ STEP 5: PLOT CORRELATIONS ______________

ggplot(correlation_non_religious, aes(x = reorder(religion, correlation), y = correlation)) +
  geom_bar(stat = "identity", fill = "red") +
  coord_flip() +
  labs(title = "Correlation: Religious Group Proportion vs. Non-Religious Proportion",
       x = "Religious Group", y = "Correlation Coefficient")
