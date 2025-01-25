library(Lock5Data)
data(Cars2020)
names(Cars2020)
attach(Cars2020)
hist(QtrMile, breaks=20)
nrow(Cars2020)
x.bar= mean(QtrMile); xbar
s.sd=sd(QtrMile); s.sd
