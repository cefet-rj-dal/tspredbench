# 01-extract_load-ipeadata-d.R
# Purpose: Standardize generation of ipeadata.d.RData via ETL copy step.
# Input: source/ipeadata.d.RData
# Output: ../../tspredit/ipeadata.d.RData
# Origin: http://www.ipeadata.gov.br (series de frequencia diaria)

build_dataset <- function() {
  source_file <- file.path("source", "ipeadata.d.RData")
  data_dir <- file.path("..", "..", "tspredit")
  output_file <- file.path(data_dir, "ipeadata.d.RData")

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



