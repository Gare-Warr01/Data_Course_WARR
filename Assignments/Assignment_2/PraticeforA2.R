getwd()
list.files()
?list.files()
list.files(path = "Data", pattern = ".csv" , all.files =TRUE,
           full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
file.exists("Data/wingspan_vs_mass.csv"  )

csv_files <-
list.files(path = "Data", pattern = ".csv" , all.files =TRUE,
           full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
class(csv_files)
length(csv_files)
csv_files[1]
csv_files[1:10] # first 10 csv files 
csv_files[c(1,3,5)] # combine data
1:100
c(1:50,53,55,57)
c("your", "mom", "is", 100)
c(1:5, "6")
x <- "old"
c("your mom is", x)
y <- c(1:5, "6")
x+y
as.numeric(c(x,y,100))
z <-as.numeric(c(x,y,100))
mean(z, na.rm = TRUE)
head(csv_files,10)
list.files(path = "Data", pattern = ".csv" , all.files =TRUE,
           full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
length(csv_files)
list.files(path = "Data", recursive = TRUE, pattern="wingspan_vs_mass.csv", full.names = TRUE)
read.csv("wingspan_vs_mass.csv")


bird <- list.files(path = "Data", recursive = TRUE, pattern="cleaned_bird_data.csv", full.names = TRUE)
file.copy(bird, ".", overwrite = TRUE)
bird
dat <- read.csv(bird)
class(dat)
dim(dat)
dat[c(1,3,5),]
dat[, "Egg_mass"] # do the same thing 
dat$Egg_mass # do the same thing 
keepers <- dat$Egg_mass > 10 
big_egg_names <- dat[keepers , ]
is.na(dat$Egg_mass)
#subset where egg_mass is greater than 10 and removes nas 
big_egg_names <- dat[dat$Egg_mass > 10 & !is.na(dat$Egg_mass), ]
plot(big_egg_names$Egg_mass)
plot(density((big_egg_names$Egg_mass)))
summary(big_egg_names$Egg_mass)     
str(dat)
summary(dat$mass)
summary(dat$tarsus)
bigmassbuddies <- dat$mass > median(dat$mass, na.rm = TRUE) & dat$tarsus > median(dat$tarsus, na.rm = TRUE)
plot(dat[bigmassbuddies, "Egg_mass"])
getwd
list.files
list.files(path = "Data", pattern = ".csv" , all.files =TRUE,
           full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
?dat
# Loop through each .csv file in the csv_files list
for (file in csv_files) {
  first_line <- tryCatch({
    read.csv(file, nrows = 1)
  }, error = function(e) {
    cat("Error reading file:", file, "\n")
    return(NULL)
  })
  if (!is.null(first_line)) {
    cat("First line of file:", file, "\n")
    print(first_line)
  }
}

for (file in csv_files) {
  first_line <- read.csv(file, nrows = 1)
  print(paste("First line of file:", file))
  print(first_line)
}
