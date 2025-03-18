library(tidyverse)
data("iris")
iris %>%
  ggplot(aes(x=Sepal.Length, y = Sepal.Width, color= Petal.Width)) + 
  geom_point() + 
  theme_classic() + theme(axis.title.x = element_text(face='bold', angle = 300 ))
