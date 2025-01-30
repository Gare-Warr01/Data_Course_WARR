library(Lock5Data)
data("HollywoodMovies")
nrow(HollywoodMovies)
HollywoodMovies.2013<-HollywoodMovies[which(HollywoodMovies$Year==2013),]
head(HollywoodMovies.2013)
summary(HollywoodMovies.2013$Budget)
five.num<-fivenum(HollywoodMovies.2013$Budget); five.num
i.q.r<-five.num[4]-five.num[2]
boxplot(HollywoodMovies.2013$Budget)
lower.inner.fence<-five.num[2]-1.5*i.q.r
upper.inner.fence<-five.num[4]+1.5*i.q.r
c(lower.inner.fence,upper.inner.fence)
location.larg.outlier<-which(HollywoodMovies.2013$Budget==250)
name.movie<-HollywoodMovies.2013$Movie[location.larg.outlier]
name.movie
location.frozen<-which(HollywoodMovies.2013$Movie=="Frozen")
value.budget<-HollywoodMovies.2013$Budget[location.frozen]
value.budget




library(Lock5Data)
data("BaseballSalaries2019")
head(BaseballSalaries2019)
nrow(BaseballSalaries2019)
mu<-mean(BaseballSalaries2019$Salary);mu
set.seed(2022)
s.seed<-sample(BaseballSalaries2019$Salary,30, replace=FALSE)
xbar.seed<-mean(s.seed);xbar.seed
diff.xbar.mu<-mu-xbar.seed; diff.xbar.mu
s<-sample(BaseballSalaries2019$Salary,30, replace=FALSE)
xbar<-mean(s);xbar
diff.xbars<-xbar-xbar.seed;diff.xbars
