library(tidyverse)
library(easystats)

x1<-372
n1<-1213
x2<-363
n2<-1412
p1hat<-x1/n1
p2hat<-x2/n2
s.stat<-p1hat-p2hat
s.stat
## [1] 0.04959551
se<-sqrt(p1hat*(1-p1hat)/n1+p2hat*(1-p2hat)/n2)
se
## [1] 0.0176225
#method 1
c.i_1<-qnorm(c(0.05, 0.95),s.stat, se)
c.i_1
## [1] 0.02060908 0.07858194
#textbook
z.star<-qnorm(0.95)
z.star
## [1] 1.644854
b<-s.stat-z.star*se
ub<-s.stat+z.star*se
c.i_2<-c(lb,ub)
c.i_2
## [1] 0.02060908 0.07858194

x1<-187
n1<-382
x2<-116
n2<-192
p1hat<-x1/n1
p2hat<-x2/n2
s.stat<-p1hat-p2hat
s.stat
## [1] -0.1146379
phat<-(x1+x2)/(n1+n2)
se<-sqrt(phat*(1-phat)/n1+phat*(1-phat)/n2)
se
## [1] 0.04416393
#compute pvalue use s.stat of p1hat-p2hat
pvalue.1<-2*pnorm(s.stat,0,se)
pvalue.1
## [1] 0.009438877
#textbook
z.stat<-s.stat/se
pvalue.2<-2*pnorm(z.stat,0,1)
pvalue.2
## [1] 0.009438877
