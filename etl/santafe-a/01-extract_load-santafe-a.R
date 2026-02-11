# 01-extract_load-santafe-a.R
# Purpose: Standardize generation of SantaFe.A.RData via ETL copy step.
# Input: source/SantaFe.A.RData
# Output: ../../tspredit/SantaFe.A.RData
# Origin: https://archive.physionet.org/physiobank/database/SantaFe.A/

build_dataset <- function() {
  source_file <- file.path("source", "SantaFe.A.RData")
  data_dir <- file.path("..", "..", "tspredit")
  output_file <- file.path(data_dir, "SantaFe.A.RData")

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



