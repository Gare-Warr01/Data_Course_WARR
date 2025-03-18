library(tidyverse)

df <- read.csv("Assignments:Exams/Assignment_7/Utah_Religions_by_County.csv")

#Inspect structure
str(df)

#Convert dataset to tidy format
df_tidy <- df %>% 
  pivot_longer(cols = -c(County, Pop_2010, Religious, Non.Religious),
               names_to = "Religion",
               values_to = "Proportion")

#cleaned data
head(df_tidy)

# Visualization: Distribution of Religious Groups
ggplot(df_tidy, aes(x = Religion, y = Proportion)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Distribution of Religious Groups across Utah Counties")

# Correlation: Population vs. Specific Religious Group Proportions
correlations <- df_tidy %>% 
  group_by(Religion) %>% 
  summarize(Correlation = cor(Pop_2010, Proportion, use = "complete.obs"))

# View correlation results
print(correlations)

# Correlation: Religious Groups vs. Non-Religious Proportion
correlations_nonreligious <- df_tidy %>% 
  group_by(Religion) %>% 
  summarize(Correlation = cor(Non.Religious, Proportion, use = "complete.obs"))

# View correlation results
print(correlations_nonreligious)

# Scatter plot: LDS Proportion vs. Non-Religious Proportion
ggplot(df, aes(x = LDS, y = Non.Religious)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "LDS Proportion vs. Non-Religious Proportion")

