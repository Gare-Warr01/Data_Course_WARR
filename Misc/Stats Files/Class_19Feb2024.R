library(Lock5Data)
data("LightatNight")
head(LightatNight)

light<-LightatNight$BMGain[LightatNight$Group=="Light"]
dark<-LightatNight$BMGain[LightatNight$Group=="Dark"]
sample.mean.diff<-mean(light)-mean(dark)
sample.mean.diff

boxplot(light, dark, horizontal=T)

x<-LightatNight$BMGain
s<-length(x)
n<-length(LightatNight$Group[LightatNight$Group=="Light"])
k<-3000
means.diff<-rep(NA,k)
for (i in 1:k) {
  pointer<-sample(1:s,n,replace=FALSE)
  sample.light<-x[pointer]
  sample.dark<-x[-pointer]
  means.diff[i]<-mean(sample.light)-mean(sample.dark)
}
hist(means.diff, breaks=80)

se<-sd(means.diff)
se

center<-mean(means.diff)
center


