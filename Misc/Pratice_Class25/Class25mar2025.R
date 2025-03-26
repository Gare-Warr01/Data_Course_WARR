library(tidyverse)
library(easystats)
library(palmerpenguins)

# moedl pequins 
# resonse = 'sex'

dat <- 
  penguins %>%
  filter(!is.na(sex)) %>%
  mutate(male = sex=='male') %>%
  # mutate(male = case_when(sex == 'male' ~ TRUE, TRUE ~ FALSE))

dat$sex == 'male' # if male true, if female false 

names(dat)

mod1 <- 
  glm(data = dat %>% select(-sex),
    formula = male ~ .,
    family = 'binomial')
summary(mod1)

dat <-
dat %>%
  mutate(pred = predict(mod1,dat,type = 'response'))

dat %>%
  ggplot(aes(x=body_mass_g,y = pred, colour = sex)) +
  geom_point()

dat <- 
dat %>%
  mutate(error = pred > .5) %>% 
  mutate(success = male == error) 

dat$success %>% summary

x <- read_csv('Data/GradSchool_Admissions.csv')

mod2 <- 
  x %>% 
  glm(data = .,
      formula = admit ~ (gre +gpa) * rank,
      family = 'binomial')
x %>% 
  mutate(pred = predict(mod2, x, type = 'response')) %>% 
  ggplot(aes(x = gpa, y = pred, colour = factor(rank))) +
  geom_point() +
  geom_smooth()+
  theme_dark()

report(mod2)

library(ranger)
library(vip)

mod3 <- 
  ranger(data = x, 
         formula = admit ~ .,
         importance = 'permutation')
summary(mod3)
pred <- predict(mod3, x)
x$pred <- pred$prediction 
vip(mod3)

x %>% 
  ggplot(aes(x=pred, y = admit)) +
  geom_point()

titanic[complete.cases(titanic),] %>% 
  mutate(survived = survived== 'yes') %>% 
  ranger(data = .,
         formula = survived ~ .,
         importance = 'permutation') %>% 
  vip()
