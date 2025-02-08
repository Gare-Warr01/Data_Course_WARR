library(tidyverse)
library(ggplot2)

#Step 1 
read_csv("Exams/Exam_1/cleaned_covid_data.csv")
covid_data <- read_csv("Exams/Exam_1/cleaned_covid_data.csv")

#step 2
covid_data %>% 
  filter(grepl("^A", Province_State))
A_states <- covid_data %>% 
  filter(grepl("^A", Province_State))

# step 3
A_states %>%
  ggplot(aes(x = Date, y= Deaths))
  ggplot(aes(x = Date, y = Deaths)) +
  geom_point() + 
  geom_smooth(method = "loess", se = FALSE) +
  facet_wrap(~Province_State, scales = "free") +
  labs(title = "Deaths Over Time by State", x = "Date", y = "Deaths")


