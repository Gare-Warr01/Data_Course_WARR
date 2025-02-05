library(tidyverse)
library(ggplot2)
library(patchwork)
library(ggplot2)
library(gganimate)

p1 <- ggplot(msleep) +
  geom_boxplot(aes(x=sleep_total,
                   y = vore,
                   fill = vore))
p2 <- ggplot(msleep) +
  geom_bar(aes(y = vore, fill = vore))
p3 <- ggplot(msleep) + 
  geom_point(aes(x = bodywt, 
                 y= sleep_total,
                 colour = vore)) +
  scale_x_log10()
p3
p2
p1
p1+p2
(p1 | p2)/ p3
p_all <- (p1 | p2)/ p3
p_all &
  theme(
    legend.position = 'none'
  )
p_all + plot_annotation(title = 'Mammalian sleep', tag_levels = 'A')
p_all + plot_layout(widths = unit(c(5, 1, 1), c('cm', 'null', 'null')))

p4<- ggplot(mtcars[mtcars$gear== 4,]) + geom_point(aes(x=disp, y=mpg))
p3+p4 & scale_y_continuous(limits = c(10, 40))

# above is layout commands 

ggplot(economics) + 
  geom_line(aes(x = date, y= unemploy)) +
  transition_reveal(along = date)
ggplot(mpg) + 
  geom_bar(aes(x = factor(cyl))) +
  labs(title = 'Number of Cars') +
  transition_states(states = year) +
  enter_grow() + 
  exit_fade()

ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy, colour = factor(cyll)))+
  transition_states(factor(cyl))
