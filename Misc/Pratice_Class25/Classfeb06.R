library(tidyverse)
library(ggplot2)
library(palmerpenguins)
library(plotly)
library(patchwork)
library(RColorBrewer)

p <- 
  iris %>%
  ggplot(aes(x=Sepal.Length, y = Sepal.Width, colour = Species)) +
  geom_point()
p

penguins %>% names

p1 <- penguins %>%
  ggplot(aes(x = bill_length_mm, y=flipper_length_mm, colour = species))+
  geom_point()
p1


penguins %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x=bill_length_mm, y = flipper_length_mm, colour = sex, shape = species)) +
  geom_point() 

p2 <-
  iris %>% 
  ggplot(aes(x=Sepal.Length, y = Sepal.Width, colour = Species)) +
  geom_point()

p3 <- 
  iris %>%
  ggplot(aes(x=Petal.Length, y = Petal.Width, colour = Species)) + 
  geom_boxplot()
p3
p1 + p2

penguins %>%
  filter(penguins$sex == 'male') %>%
  ggplot(aes(x= species, y= body_mass_g, fill = species)) +
  geom_boxplot(color = 'gray30')+
  geom_jitter(width = .1, color='black', alpha= 1, aes(shape = species, size = 100)) +
  geom_hline(yintercept = 1000) +
  labs( x= 'Species',y = 'Pegnuins Body mass', title = 'Sexy and Mass') +
  theme(legend.position = 'none') +
  geom_violin(colour = 'orange', size = 2)+
  theme_minimal() +
  theme(panel.grid.major = element_line(colour = 'black', linetype = 2),
        panel.grid.minor = element_line(colour = 'gray50', linetype = 2)) +
  scale_fill_viridis_d(option = 'inferno', n=.6, begin = .5)+
  scale_shape_manual(values = c(8, 11, 23)) +
  theme(panel.background = element_rect(fill = 'yellow'), 
        legend.title = element_text(face = 'bold', angle = 71, hjust = 0.5, color = 'purple', size = 24), axis.title = element_text(colour = 'orange', size = 23),
        legend.text = element_text(angle = 180))
  
  


grad <- RColorBrewer::brewer.pal(name = 'PuRd', n=3)
grad


?scale_fill_brewer
  


penguins %>% names
