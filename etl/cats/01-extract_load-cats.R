# 01-extract_load-cats.R
# Purpose: Standardize generation of CATS.RData via ETL copy step.
# Input: source/CATS.RData
# Output: ../../tspredit/CATS.RData
# Origin: https://archive.ics.uci.edu/ml/datasets/CATS+Time+Series+Prediction

build_dataset <- function() {
  source_file <- file.path("source", "CATS.RData")
  data_dir <- file.path("..", "..", "tspredit")
  output_file <- file.path(data_dir, "CATS.RData")

  if (!file.exists(source_file)) {
    stop(sprintf("Source file not found: %s", source_file))
  }
  if (!dir.exists(data_dir)) {
    dir.create(data_dir, recursive = TRUE)
  }

  ok <- file.copy(source_file, output_file, overwrite = TRUE, copy.date = TRUE)
  if (!ok) {
    stop(sprintf("Failed to copy '%s' to '%s'.", source_file, output_file))
  }
}

build_dataset()



