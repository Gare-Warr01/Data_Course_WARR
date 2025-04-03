library(tidyverse)

data<- matrix(c(372, 807, 34, 363,1005, 44), nrow=3)

colnames(data) <- c('Male', 'Female')
rownames(data) <- c('Agree', 'Disagree', 'Dont know')

two.way.table <- as.table(data)

two.way.table

two.way.table.m<-addmargins(data)

barplot(two.way.table, main = "A segmented bar chart",
        xlab = "Award", ylab = "Frequency",
        col = c("darkred", "darkgreen"))

barplot(two.way.table, legend=TRUE, beside=TRUE,
        main='Side-by-side bar graph', col = c("darkred", "darkgreen", "green"))

p<-apply(two.way.table, 1,sum)/sum(two.way.table)
p

expected<-c(rep(1213,3)*p,rep(1412,3)*p)

chi.square.statistic<-sum((data-expected)^2/expected)
chi.square.statistic

df<-(3-1)*(2-1)

pvalue<-pchisq(chi.square.statistic,df, lower.tail=F)
pvalue

obs<-c(372, 807, 34, 363,1005, 44)

two.way.table<-matrix(obs, nrow=3)
two.way.table

prob.dist.null=apply(two.way.table, 1, sum)/sum(two.way.table)
prob.dist.null

n=apply(two.way.table, 2, sum)
n

expected=c(n[1]*prob.dist.null, n[2]*prob.dist.null)
expected

chisq.stat=sum((obs-expected)^2/expected)
chisq.stat

df=(nrow(two.way.table)-1)*(ncol(two.way.table)-1)
df

pvalue=pchisq(chisq.stat,df, lower.tail = F)
pvalue

library(Lock5Data)
data("WaterTaste")
two.way.table<-table(WaterTaste$UsuallyDrink,WaterTaste$First)
two.way.table.m<-addmargins(two.way.table)
two.way.table.m
p<-apply(two.way.table, 1,sum)/sum(two.way.table)
p
p<-as.matrix(p)
expected<-c(rep(25,3)*p,rep(41,3)*p, rep(24,3)*p, rep(10, 3)*p)
data<-as.matrix(two.way.table)
chi.square.statistic<-sum((data-expected)^2/expected)
chi.square.statistic
df<-(4-1)*(3-1)
pvalue<-pchisq(chi.square.statistic,df, lower.tail=F)
pvalue
chisq.test(WaterTaste$UsuallyDrink,WaterTaste$First)

