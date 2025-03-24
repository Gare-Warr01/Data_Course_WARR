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

mod2 <- 
  iris %>%
  glm(data = .,
      formula = Sepal.Length ~ Species + Sepal.Width)
summary(mod2)

ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, colour = Species))+
  geom_point() +
  geom_smooth(method = 'glm')

mod3 <-  
  iris %>%
  glm(data = .,
      formula = Sepal.Length ~ Species * Sepal.Width)
summary(mod3)

compare_models(mod1, mod2, mod3) %>% plot()
compare_performance(mod1, mod2, mod3) %>% plot()
  