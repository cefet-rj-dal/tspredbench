library(dplyr)
library(stringr)

# 01-extract_transform_load-m1.R
# Purpose: Build consolidated M1 dataset (monthly/quarterly/yearly)
# Input: CSV files in current directory named: m1-monthly.csv, m1-quarterly.csv, m1-yearly.csv
# Output: ../../tspredit/m1.RData (object: m1, a list with keys: monthly, quarterly, yearly)

build_subset <- function(file_stem, n = 10) {
  # Read wide CSV where rownames are series identifiers and columns are time steps
  subset_data <- read.csv(file.path("source", sprintf("%s.csv", file_stem)), header = FALSE, row.names = 1)
  # Uniformly sample up to n series to reduce size
  indices <- round(seq(1, nrow(subset_data), length.out = n))
  subset_data <- subset_data[indices, ]
  return(subset_data)
}

dataset_files <- c('m1-monthly', 'm1-quarterly', 'm1-yearly')
# Keep only files that actually exist under source/
dataset_files <- dataset_files[file.exists(file.path('source', paste0(dataset_files, '.csv')))]
n <- 10
data_dir <- "../../tspredit"

if (!dir.exists(data_dir)) {
  dir.create(data_dir, recursive = TRUE)
}

# Build consolidated object with one entry per frequency
m1 <- list()
for (file_stem in dataset_files) {
  type_key <- sub('^m1-', '', file_stem)
  m1[[type_key]] <- build_subset(file_stem, n)
}

save(m1, file = file.path(data_dir, 'm1.RData'))


