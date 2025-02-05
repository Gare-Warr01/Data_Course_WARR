csv_files <- list.files("Data/", pattern = "\\.csv$", full.names = TRUE)
length(csv_files)
df <- read.csv("Data/wingspan_vs_mass.csv")
head(df, 5)
b_files <- list.files("Data/", pattern = "^b", full.names = TRUE, recursive = TRUE)
for (file in b_files) {
  first_line <- readLines(file, n = 1)
  cat(sprintf("First line of %s:\n%s\n\n", file, first_line))
}
for (file in csv_files) {
  first_line <- readLines(file, n = 1)
  cat(sprintf("First line of %s:\n%s\n\n", file, first_line))
}

