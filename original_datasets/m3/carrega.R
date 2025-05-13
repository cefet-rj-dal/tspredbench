library(dplyr)
library(stringr)

carrega <- function(file, n = 10) {
  data <- read.csv(sprintf("%s.csv", file), header = FALSE, row.names = 1)
  idx <- round(seq(1, nrow(data), length.out = n))
  data <- data[idx, ]
  
  dataset <- list()
  for (i in 1:nrow(data)) {
    x <- as.vector(t(data[i, ]))
    dataset[[rownames(data)[i]]] <- x
  }
  return(dataset)
}

datasets <- c('m3-monthly', 'm3-other', 'm3-quarterly', 'm3-yearly')
n <- 10

data_dir <- "../../data"
if (!dir.exists(data_dir))
  dir.create(data_dir, recursive = TRUE)

for (file in datasets) {
  m1 <- carrega(file, n)
  assign(file, m1)
  save(list = file, file = file.path(data_dir, sprintf("%s.RData", file)))
  #write.csv(m1, file = file.path(data_dir, sprintf("%s.csv", file)), row.names = TRUE)
}