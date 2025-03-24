library(Lock5Data)
library(tidyverse)

x1<-Smiles$Leniency[Smiles$Group=="smile"]
x2<-Smiles$Leniency[Smiles$Group=="neutral"]
n1<-length(x1)
n2<-length(x2)
xbar1<-mean(x1)
xbar2<-mean(x2)
s.var1<-var(x1)
s.var2<-var(x2)
boxplot(x1, x2, horizontal = T)
se<-sqrt(s.var1/n1+s.var2/n2)
df<-min(n1-1, n2-1)
df
t0<-(xbar1-xbar2)/se
t0
pvalue<-pt(t0,df,lower.tail = F)
pvalue
