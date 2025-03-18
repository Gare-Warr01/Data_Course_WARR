library(tidyverse)
library(ggplot2)

# I. Read the CSV file
covid_data <- read_csv("Data/cleaned_covid_data.csv")
covid_data

# II. Subset data for states that begin with "A"
A_states <- covid_data %>% 
  filter(grepl("^A", Province_State))
A_states

# III. Create scatter plot of Deaths over time with facets for each state
A_states %>% 
  ggplot(aes(x = Last_Update, y = Deaths)) + 
  geom_point(colour =  'orange' ) + 
  facet_wrap(~ Province_State, scales = "free") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "COVID-19 Deaths Over Time in A States", 
       x = "Date", y = "Deaths")

# IV. Find the peak Case_Fatality_Ratio for each state
state_max_fatality_rate <- covid_data %>%
  group_by(Province_State) %>%
  summarise(Maximum_Fatality_Ratio = max(Case_Fatality_Ratio, na.rm = TRUE)) %>%
  arrange(desc(Maximum_Fatality_Ratio))
state_max_fatality_rate

# V. Create a bar plot for the Maximum Fatality Ratio per state
state_max_fatality_rate %>%
  mutate(Province_State = factor(Province_State, levels = state_max_fatality_rate$Province_State)) %>%
  ggplot(aes(x = Province_State, y = Maximum_Fatality_Ratio)) +
  geom_bar(stat = "identity", fill= 'blue') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Peak Case Fatality Ratio by State", x = "State", y = "Max Fatality Ratio") 

# VI. BONUS: Plot cumulative deaths for the entire US over time
us_cumulative_deaths <- covid_data %>%
  group_by(Last_Update) %>%
  summarise(Cumulative_Deaths = sum(Deaths, na.rm = TRUE))

us_cumulative_deaths %>%
  ggplot(aes(x = Last_Update, y = Cumulative_Deaths)) +
  geom_line(colour = 'red', linewidth = 3) +
  labs(title = "Cumulative COVID-19 Deaths in the US Over Time", x = "Date", y = "Cumulative Deaths")
