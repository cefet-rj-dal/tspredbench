# 01-extract_load-eunite-reg.R
# Purpose: Standardize generation of EUNITE.Reg.RData via ETL copy step.
# Input: source/EUNITE.Reg.RData
# Output: ../../tspredit/EUNITE.Reg.RData
# Origin: http://www.eunite.org/knowledge/Competitions/1st_competition/1st_competition.htm

build_dataset <- function() {
  source_file <- file.path("source", "EUNITE.Reg.RData")
  data_dir <- file.path("..", "..", "tspredit")
  output_file <- file.path(data_dir, "EUNITE.Reg.RData")

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



