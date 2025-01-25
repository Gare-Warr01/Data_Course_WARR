library(tidyverse)
data("midwest", package = "ggplot2")
ggplot(midwest) # darkness nothing but there is code being run 
names(midwest) # find out what you can graph
ggplot(midwest, aes(x=area, y = poptotal)) # aes is aesthetic, this makes the graph
ggplot(midwest, aes(x=area, y = poptotal)) + geom_point() # geom points makes point 
ggplot(midwest, aes(x=area, y = poptotal)) + geom_point(colour = "red", size = 4, shape=12) + geom_smooth(method = "lm", color = "#2b5235", fill= "black")
#this can mess with the graph
a <- ggplot(midwest, aes(x=area, y = poptotal)) + geom_point() + geom_smooth(method = "lm")
a
a + lims(x=c(0,0.1),y=c(0,1000000)) #this one zooms in 
a + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) #xlims excludes data out of bonds 
a2 <- coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))
coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + labs(title = "Area Vs Population", subtitle = "Midwest", y= "population", x= "area", caption = "Midwest Graph")
