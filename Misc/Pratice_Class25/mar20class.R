library(tidyverse)
library(easystats)
library(MASS)
library(caret)


x <- rnorm(1000,100) # 100 numbers, mean of 100
y <- rnorm(1000,99.9) # 100 numbers, mean of 99.9
t.test(x,y)

mean(x)
mean(y)

data.frame(x,y) %>%
  pivot_longer(everything()) %>% 
  ggplot(aes(x=value,fill=name)) +
  geom_density(alpha=.5)


data.frame(x,y) %>%
  pivot_longer(everything()) %>% 
  glm(data=.,
      formula = value ~ name) %>% 
  summary()


library(palmerpenguins)
 
# make 3 models preditiing body_mass_g
penguins %>% glimpse
glm()

model1 <- glm(body_mass_g ~ flipper_length_mm, data = penguins, family = gaussian)
summary(model1)

model2 <- glm(body_mass_g ~ flipper_length_mm + bill_length_mm + species, 
              data = penguins, family = gaussian)
summary(model2)

model3 <- glm(body_mass_g ~ flipper_length_mm * species + bill_length_mm * species, 
              data = penguins, family = gaussian)
summary(model3)


compare_models(model1, model2, model3) %>% plot()
compare_performance(model1, model2, model3) %>% plot()

mod4 <- 
  glm(data = penguins,
      formula = body_mass_g ~.^2)

mod5 <- 
  glm(data = penguins,
      formula = body_mass_g ~.)

mod6 <- 
  glm(data = penguins,
      formula = body_mass_g ~ flipper_length_mm)

mod4$formula
mod5$formula
mod6$formula


step <- stepAIC(object = mod4)
step$formula

mod7 <- glm(data = penguins,
            formula = step$formula)
compare_performance(mod7, mod4, mod5, mod6) %>% plot()

new_penquin <- 
  data.frame(species ='Adelie',
             island = 'Torgersen', 
             bill_length_mm = 37,
             bill_depth_mm = 19.2,
             flipper_length_mm = 194,
             sex = 'female',
             year = 2007)
predict(object = mod7,newdata = new_penquin)
penguins$preds <- predict(mod7,penguins)
ggplot(penguins, aes(x = body_mass_g, y = preds)) +
  geom_point()+
  geom_smooth(method = 'lm')

#cross -valdiation 
skimr::skim(penguins)
dat <-penguins[complete.cases(penguins),]
train_rows <- caret::createDataPartition(y = dat$body_mass_g,p = 0.5)

train <- dat[train_rows$Resample1,]
test <- dat[-train_rows$Resample1,]

mod_xval <- 
  glm(data = train,
      formula = step$formula)
xval_preds <- predict(mod_xval, newdata = test)
test%>%
  mutate(xval_preds =xval_preds) %>%
  ggplot(aes(x = body_mass_g, y = xval_preds)) +
  geom_point() +
  geom_smooth(method = 'lm')

model_performance(mod_xval)
model_performance(mod7)
check_model(mod_xval)
report(mod_xval)
