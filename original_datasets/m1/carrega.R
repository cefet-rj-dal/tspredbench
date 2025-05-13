library(dplyr)
library(stringr)

carrega <- function(file, n = 10) {
  dataset <- read.csv(sprintf("%s.csv", file), header = FALSE, row.names = 1)
  idx <- round(seq(1, nrow(dataset), length.out = n))
  dataset <- dataset[idx, ]
  return(dataset)
}

datasets <- c('m1-monthly', 'm1-quarterly', 'm1-yearly')
n <- 10
data_dir <- "../../data"

if (!dir.exists(data_dir)) {
  dir.create(data_dir, recursive = TRUE)
}

for (file in datasets) {
  dataset <- carrega(file, n)
  assign(file, dataset)
  save(list = file, file = file.path(data_dir, sprintf("%s.RData", file)))
  #write.csv(dataset, file = file.path(data_dir, sprintf("%s.csv", file)), row.names = TRUE)
}