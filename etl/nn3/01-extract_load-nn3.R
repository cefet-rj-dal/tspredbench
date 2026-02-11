# 01-extract_load-nn3.R
# Purpose: Standardize generation of NN3.RData via ETL copy step.
# Input: source/NN3.RData
# Output: ../../tspredit/NN3.RData
# Origin: http://www.neural-forecasting-competition.com/NN3/index.htm

build_dataset <- function() {
  source_file <- file.path("source", "NN3.RData")
  data_dir <- file.path("..", "..", "tspredit")
  output_file <- file.path(data_dir, "NN3.RData")

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



