library(tidyverse)
library(easystats)

iris

mod1 <-
iris %>%
  glm(data = .,
      formula = Sepal.Length ~ Species)
mod1 %>% summary
iris %>% 
  group_by(Species) %>%
  summarise(sl = mean(Sepal.Length))
