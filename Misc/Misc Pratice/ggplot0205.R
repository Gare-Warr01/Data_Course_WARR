library(tidyverse)
library(cowsay)
say("why did the chicken cross the road", "chicken")
say("To get to the idoits house", "chicken")
say("knock, knock", "stegosaurus")

ggplot(faithful) +
  geom_point(aes(x=eruptions, y = waiting)) +
  geom_abline(slope = -30, intercept = 200)


library(Lock5Data)
data("Cars2020")
head(Cars2020)
ggplot(data = Cars2020,
       mapping = aes(x=HighPrice))+ geom_bar(col = "yellow")


ggplot(mpg) +
  geom_point(aes(x=displ, hwy, colour= class))+
  scale_color_brewer(name = 'CLASS', palette = 'set1')

ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy, colour= class, size = cyl)) +
  scale_colour_brewer(name = 'qual') +
  guides(colour = 'legend')

ggplot(mpg) +
  geom_point(aes(x= displ, y=hwy)) +
  #facet_grid(year ~ drv)
  facet_wrap(~ drv, scales = 'free_x') 

ggplot(mpg) +
  geom_bar(aes(y = manufacturer)) +
  facet_grid(class ~ ., space = 'free_y', scale = 'free_y')

ggplot(mpg) +
  geom_point(aes(x = displ, y=hwy))+
  facet_wrap(~ drv + year)

ggplot(mpg) +
  geom_bar(aes(x= class)) +
  coord_polar(theta = 'y') +
  expand_limits(y=70)

ggplot(mpg) +
  geom_bar(aes(x = class)) +
  scale_y_continuous(limits = c(0, 40))

ggplot(mpg) +
  geom_bar(aes(x =class)) +
  coord_cartesian(ylim = c(0, 40))


?scale_color_brewer
ggplot(mpg) +
  geom_point(aes(x=displ, y = hwy)) +
  scale_x_continuous((breaks = c(3,5,6)))+
  scale_y_continuous(trans = 'log10')

ggplot(mpg) +
  geom_point(aes(x=hwy, y = displ)) +
  coord_trans(y = 'log')

ggplot(mpg) +
  geom_bar(aes(y = class)) +
  facet_wrap(~year) +
  theme_classic()
  
library(tidyverse)
library(modelr)
library(GGally)

read.csv("./Data/GradSchool_Admissions.csv", stringsAsFactors = FALSE)
dat <- read.csv("./Data/GradSchool_Admissions.csv", stringsAsFactors = FALSE) 
ggpairs(dat)
names(dat)
dat$admit <- as.logical(dat$admit)
dat$admit[dat$admit == 0 ] <- FALSE
dat$admit[dat$admit == 1] <-TRUE
dat$rank <- factor(dat$rank) 


mod1 <- glm(formula = admit ~ gre + gpa +rank, data=dat, family = "binomial")
summary(mod1)
dat2 <- add_predictions(dat,mod1,type='response')
ggplot(dat2, aes(x=gpa, y = pred, colour = rank)) + 
  geom_point()

ggplot(dat2, aes(x=gre, y = pred, colour = rank)) + 
  geom_point()

ggplot(dat2, aes(x=gpa, y = pred, colour = rank)) + 
  geom_smooth(method = "lm")


