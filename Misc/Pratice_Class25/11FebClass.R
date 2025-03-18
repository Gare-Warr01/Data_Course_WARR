library(tidyverse)
library(palmerpenguins)
library(gganimate)
install.packages('ggimage')
library(ggimage)
install.packages('wesanderson')
library(wesanderson)
library(GGally)
install.packages('GGally')

pal <- wesanderson ::wes_palette('IsleofDogs1', 3)
pal <- wesanderson ::wes_palette('IsleofDogs1', 3)
scale_color_manual(values = pal)

dat <- penguins
dat %>%
  filter(!is.na(body_mass_g), !is.na(sex)) %>%
  mutate(sex = recode(sex, 'female' = 'Female', 'male' = 'Male')) %>%
  ggplot(aes(x=flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point()+
  facet_wrap(~ sex) +
  stat_ellipse() +
  labs(x= 'Flipper length (nm)', y = 'Body mass (g)') +
  theme_bw()



 p <- penguins %>% 
  filter(!is.na(sex)) %>%
  mutate(sex = sex %>% str_to_sentence()) %>%
  ggplot(aes(x=flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  stat_ellipse() +
  theme_bw() +
  labs(x= 'Flipper length (nm)', y = 'Body mass (g)', color = 'Species') +
  facet_wrap( ~sex) +
  scale_color_manual(values = pal)
 
 
 


p
p + gganimate:: transition_states(species) + gganimate:: ease_aes()

