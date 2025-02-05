set.seed(123)
n=200
p=0.0275
k=2000
x=replicate(k,rbinom(n, size=1, prob=p));x
phats = apply(x, 2, mean); phats
hist(phats)
center_phats = mean(phats); center_phats
se_phats=sd(phats); se_phats
a= sqrt(p*(1-p)/n);a
