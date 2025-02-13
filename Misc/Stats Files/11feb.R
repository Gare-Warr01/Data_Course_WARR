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



x<-c(16, 22, 9, 31, 6)
one.bootstrap.sample<-sample(x,replace=T)
k<-10000
k.bootstrap.smeans<-replicate(k,mean(sample(x,replace=T)))
hist(k.bootstrap.smeans)
center.means<-mean(k.bootstrap.smeans)
center.means



x<-c(1, 1, 0, 1, 0, 1)
one.bootstrap.sample<-sample(x,replace=T)
mean(one.bootstrap.sample)
k<-10000
k.bootstrap.sproportions<-replicate(k,mean(sample(x,replace=T)))
hist(k.bootstrap.sproportions)
center.means<-mean(k.bootstrap.sproportions)
center.means
ci.q<-quantile(k.bootstrap.sproportions, c(0.025, 0.975))
ci.q
