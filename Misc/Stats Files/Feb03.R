library(Lock5Data)
data("BaseballSalaries2019")
head(BaseballSalaries2019)
attach(BaseballSalaries2019)
ncol(BaseballSalaries2019)
nrow(BaseballSalaries2019)
mu<-mean(BaseballSalaries2019$Salary);mu
set.seed(2022)
s.seed<-sample(BaseballSalaries2019$Salary,30, replace=FALSE)
xbar.seed<-mean(s.seed);xbar.seed
diff.xbar.mu<-mu-xbar.seed; diff.xbar.mu
s<-sample(BaseballSalaries2019$Salary,30, replace=FALSE)
xbar.s<-mean(s);xbar.s
diff.xbars<-xbar.s-xbar.seed;diff.xbars
hist(BaseballSalaries2019$Salary)
mu<-mean(BaseballSalaries2019$Salary);mu
sigma<-sd(BaseballSalaries2019$Salary);sigma
n<-30
k<-2000
x<-replicate(k, sample(BaseballSalaries2019$Salary, n, replace=FALSE))
xbars<-apply(x, 2, mean )
hist(xbars)
center.xbars<-mean(xbars)
std.xbars<-sd(xbars)
diff.center<-center.xbars-mu; diff.center
diff.variability<-std.xbars-sigma/sqrt(n); diff.variability
