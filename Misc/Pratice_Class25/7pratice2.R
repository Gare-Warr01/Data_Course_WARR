library(tidyverse)
df <- read.csv("./Assignments:Exams/Assignment_7/Utah_Religions_by_County.csv", stringsAsFactors = FALSE)
population_df <- df %>%
  select(County, Pop_2010)
df_cleaned <- df %>%
  select(-Religious, -Pop_2010)  # Removing both "Religious" and "Pop_2010"
write.csv(population_df, "Utah_Population.csv", row.names = FALSE)
write.csv(df_cleaned, "Utah_Religions_Cleaned.csv", row.names = FALSE)


df <- read.csv("Utah_Religions_Cleaned.csv", stringsAsFactors = FALSE)

# Check the structure of the dataset
glimpse(df)
df_tidy <- df %>%
  pivot_longer(cols = -County,   # Keep County as an identifier
               names_to = "Religion",
               values_to = "Proportion")
# View the tidied data
head(df_tidy)
df_tidy <- df_tidy %>%
  rename(county = County, religion = Religion, proportion = Proportion) %>%
  mutate(religion = str_replace_all(religion, "_", " ")) # Replace underscores with spaces
write.csv(df_tidy, "Utah_Religions_Tidy.csv", row.names = FALSE)

df_tidy %>% filter(county == "Salt Lake County")
df_tidy %>% group_by(religion) %>% summarise(mean_proportion = mean(proportion))
ggplot(df_tidy, aes(x = religion, y = proportion)) +
  geom_boxplot() +
  coord_flip()

