library(dplyr)
library(stringr)

# 01-extract_transform_load-m3.R
# Purpose: Build consolidated M3 dataset (monthly/other/quarterly/yearly)
# Input: CSV files in current directory named: m3-monthly.csv, m3-other.csv, ...
# Output: ../../tspredit/m3.RData (object: m3, a list with keys: monthly, other, quarterly, yearly)

build_subset <- function(file_stem, n = 10) {
  # Read wide CSV where rownames are series identifiers and columns are time steps
  subset_data <- read.csv(file.path("source", sprintf("%s.csv", file_stem)), header = FALSE, row.names = 1)
  # Uniformly sample up to n series to reduce size
  indices <- round(seq(1, nrow(subset_data), length.out = n))
  subset_data <- subset_data[indices, ]

  # Convert each row into a numeric vector and store in a named list
  series_list <- list()
  for (i in 1:nrow(subset_data)) {
    x <- as.vector(t(subset_data[i, ]))
    series_list[[rownames(subset_data)[i]]] <- x
  }
  return(series_list)
}

dataset_files <- c('m3-monthly', 'm3-other', 'm3-quarterly', 'm3-yearly')
# Keep only files that actually exist under source/
dataset_files <- dataset_files[file.exists(file.path('source', paste0(dataset_files, '.csv')))]
n <- 10

data_dir <- "../../tspredit"
if (!dir.exists(data_dir))
  dir.create(data_dir, recursive = TRUE)

# Build consolidated object with one entry per frequency
m3 <- list()
for (file_stem in dataset_files) {
  type_key <- sub('^m3-', '', file_stem)
  m3[[type_key]] <- build_subset(file_stem, n)
}

save(m3, file = file.path(data_dir, 'm3.RData'))


