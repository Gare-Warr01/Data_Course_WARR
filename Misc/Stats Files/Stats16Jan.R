library(Lock5Data)
data("MammalLongevity")
attach(MammalLongevity)
names(MammalLongevity)
stripchart(Longevity, method = "stack", at=0.01, pch=20, cex=2, frame.plot = FALSE, xlim=c(0,max(Longevity)), main="Mammal Longevity")
hist(Longevity, main="Histogram for Mammal Longevity", xlab="Longevity", border="blue", col="green",xlim=c(0,40), las=1, breaks=8)


library(Lock5Data)
data("FloridaLakes")
head(FloridaLakes)
names(FloridaLakes)
hist(Alkalinity, main="Histogram for Alkalinity",
     xlab="Alkalinity",
     border="blue",
     col="green",
     xlim=c(0,max(Alkalinity)),
     las=1,
     breaks=8)
