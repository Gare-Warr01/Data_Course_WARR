library(Lock5Data)
data("CommuteAtlanta")
head(CommuteAtlanta)
nrow(CommuteAtlanta)
hist(CommuteAtlanta$Time, breaks=20)

xbar<-mean(CommuteAtlanta$Time)
std<-sd(CommuteAtlanta$Time)
n<-500
k<-1000
samples<-replicate(k, sample(CommuteAtlanta$Time, n, replace = TRUE))
xbars<-apply(samples, 2, mean)
hist(xbars)


center.xbars<-mean(xbars)
se.xbars<-sd(xbars)
se.xbars
ci.95<-c(xbar-2*se.xbars, xbar+2*se.xbars)
print(ci.95)
ci.95.q<-quantile(xbars, c(0.025, 0.975))
ci.95.q


data("CommuteAtlanta")
nrow(CommuteAtlanta)
hist(CommuteAtlanta$Time, breaks=20)
xbar<-mean(CommuteAtlanta$Time)
std<-sd(CommuteAtlanta$Time)
b<-2000
n<-500
y<-CommuteAtlanta$Time
boot.dist=rep(NA,b)
for(i in 1:b){
  boot.sample=sample(n, replace=TRUE)
  boot.dist[i]=mean(y[boot.sample])
}
hist(boot.dist)
summary(boot.dist)
center.boot.dist<-mean(boot.dist)
ci.95q<-quantile(boot.dist, c(0.025,0.975))
ci.95q
se<-sd(boot.dist);se
lowerb<-center.boot.dist-2*se
upperb<-center.boot.dist+2*se
ci.95r<-c(lowerb, upperb)
ci.95r




data("CommuteAtlanta", package="Lock5Data")
head(CommuteAtlanta)
mean(CommuteAtlanta$Time)
xbar <- mean(CommuteAtlanta$Time)
k<- 10000
x<- CommuteAtlanta$Time
means<-replicate(k, mean(sample(x, replace=T)))
head(means)
length(means)
hist(means)
SE <- sd(means)
xbar - 2*SE
xbar + 2*SE
quantile(means, c(.025,.975))
xbar - 1.96*SE
xbar + 1.96*SE
