library(tidyverse)
library(Lock5Data)
data("APMultipleChoice")
attach(APMultipleChoice)
head(APMultipleChoice)
f.table = table(APMultipleChoice)
f.table
n = length(Answer)
k = length(unique(Answer))
p = rep(0.2, 5)
expected = n*0.2
simulated.count=rmultinom(1, size=n,prob=p)
stimulated.test = sum((simulated.count - expected)^2/expected)
stimulated.test
r = 1000
stimulated.test = replicate(r, sum((rmultinom(1, size=n,prob=p) - expected)^2/expected))
stimulated.test
summary(stimulated.test)
length(stimulated.test)
hist(stimulated.test, prob = TRUE)
lines(density(stimulated.test), col=1, lwd = 3)
