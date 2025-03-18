library(tidyverse)
#Read Data Set
df <- read.csv("./Assignments:Exams/Assignment_7/Utah_Religions_by_County.csv", stringsAsFactors = FALSE)

#Clean and Save the Tidy Version 
str(df)
head(df)
df <- janitor::clean_names(df)
df_tidy <- df %>%
  pivot_longer(cols = -county,  # Keep the "county" column as an identifier
               names_to = "religion",
               values_to = "adherents")
head(df_tidy)
write.csv(df_tidy, "Utah_Religions_Tidy.csv", row.names = FALSE)

#Read New Tidy 
df_tidy <- read.csv("Utah_Religions_Tidy.csv", stringsAsFactors = FALSE)
glimpse(df_tidy)

# Load the original dataset (assuming it contains population data)
df_wide <- read.csv("./Assignments:Exams/Assignment_7/Utah_Religions_by_County.csv", stringsAsFactors = FALSE)

# Select only county and population
population_data <- df_wide %>%
  select(County, Pop_2010) %>%
  rename(county = County)  # Ensure county names match between datasets

# Merge population data into tidy dataset
df_tidy <- df_tidy %>%
  left_join(population_data, by = "county")
correlation_population <- df_tidy %>%
  group_by(religion) %>%
  summarise(correlation = cor(Pop_2010, adherents, use = "complete.obs"))

# Plot
ggplot(correlation_population, aes(x = reorder(religion, correlation), y = correlation)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Correlation: County Population vs. Religious Group Proportion",
       x = "Religious Group", y = "Correlation Coefficient")
