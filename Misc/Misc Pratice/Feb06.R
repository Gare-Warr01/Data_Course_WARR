library(tidyverse)
library(ggplot2)
library(patchwork)
library(ggplot2)
library(gganimate)
library(ggrepel)

install.packages('ggrepel')
install.packages('ggforce')

ggplot(mtcars, aes(x = disp, y = mpg)) +
  geom_point() +
  geom_text_repel(aes(label = row.names(mtcars)))

library(ggforce)
ggplot(mtcars, aes(x=disp, y = mpg)) + geom_point() +
  geom_mark_ellipse(aes(filter = gear == 4, label = '4 gear'))

install.packages('gghighlight')
install.packages('ggpragh')
install.packages('tidygraph')

data("iris")
ggplot(iris, aes(x =Sepal.Length, y = Sepal.Width, shape = 'triangle', alpha = '0.5')) +
  geom_point()


ggplot(pie) + 
  geom_col(aes(x=0, y = ))
