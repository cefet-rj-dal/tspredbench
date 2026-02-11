#!/usr/bin/env Rscript

# ETL Orchestrator
# -----------------------------------------------------------------------------
# Purpose:
#   Execute all ETL build scripts under `etl/` to generate the available
#   `.RData` artifacts in a single run.
#
# Usage:
#   Rscript etl/etl.R
#
# Behavior:
#   1) Runs each ETL script from its own directory (required by relative paths).
#   2) Verifies expected outputs for each script.
#   3) Reports `.RData` files present in `tspredit/` that currently do not have a
#      generating script under `etl/`.
#
# Notes:
#   - This orchestrator covers all ETL scripts currently versioned in `etl/`.
#   - Some files in `tspredit/` may come from older pipelines not present in this
#     folder anymore; those are reported at the end.
# -----------------------------------------------------------------------------

get_script_path <- function() {
  cmd_args <- commandArgs(trailingOnly = FALSE)
  file_arg <- "--file="
  idx <- grep(file_arg, cmd_args)
  if (length(idx) > 0) {
    return(normalizePath(sub(file_arg, "", cmd_args[idx[1]]), winslash = "/", mustWork = FALSE))
  }

  if (!is.null(sys.frames()[[1]]$ofile)) {
    return(normalizePath(sys.frames()[[1]]$ofile, winslash = "/", mustWork = FALSE))
  }

  normalizePath(file.path("etl", "etl.R"), winslash = "/", mustWork = FALSE)
}

run_script <- function(script_path) {
  if (!file.exists(script_path)) {
    stop(sprintf("Script not found: %s", script_path))
  }

  old_wd <- getwd()
  on.exit(setwd(old_wd), add = TRUE)

  script_dir <- dirname(script_path)
  script_name <- basename(script_path)

  setwd(script_dir)
  source(script_name, local = new.env(parent = globalenv()))
}

script_self <- get_script_path()
etl_dir <- dirname(script_self)
repo_root <- normalizePath(file.path(etl_dir, ".."), winslash = "/", mustWork = TRUE)
data_dir <- file.path(repo_root, "tspredit")

if (!dir.exists(data_dir)) {
  dir.create(data_dir, recursive = TRUE)
}

plan <- list(
  list(script = "bioenergy/01-extract_transform_load-bioenergy.R", outputs = c("bioenergy.RData")),
  list(script = "cats/01-extract_load-cats.R", outputs = c("CATS.RData")),
  list(script = "climate/01-extract_transform_load-climate.R", outputs = c("climate.RData")),
  list(script = "emissions/01-extract_transform_load-emissions.R", outputs = c("emissions.RData")),
  list(script = "eunite-loads/01-extract_load-eunite-loads.R", outputs = c("EUNITE.Loads.RData")),
  list(script = "eunite-reg/01-extract_load-eunite-reg.R", outputs = c("EUNITE.Reg.RData")),
  list(script = "eunite-temp/01-extract_load-eunite-temp.R", outputs = c("EUNITE.Temp.RData")),
  list(script = "fertilizers/01-extract_transform_load-fertilizers.R", outputs = c("fertilizers.RData")),
  list(script = "gdp/01-extract_transform_load-gdp.R", outputs = c("gdp.RData")),
  list(script = "ipeadata-d/01-extract_load-ipeadata-d.R", outputs = c("ipeadata.d.RData")),
  list(script = "ipeadata-m/01-extract_load-ipeadata-m.R", outputs = c("ipeadata.m.RData")),
  list(script = "m1/01-extract_transform_load-m1.R", outputs = c("m1.RData")),
  list(script = "m3/01-extract_transform_load-m3.R", outputs = c("m3.RData")),
  list(script = "m4/01-extract_transform_load-m4.R", outputs = c("m4.RData")),
  list(script = "nn3/01-extract_load-nn3.R", outputs = c("NN3.RData")),
  list(script = "nn5/01-extract_load-nn5.R", outputs = c("NN5.RData")),
  list(script = "pesticides/01-extract_transform_load-pesticides.R", outputs = c("pesticides.RData")),
  list(script = "santafe-a/01-extract_load-santafe-a.R", outputs = c("SantaFe.A.RData")),
  list(script = "santafe-d/01-extract_load-santafe-d.R", outputs = c("SantaFe.D.RData")),
  list(script = "stocks/01-extract_transform_load-stocks.R", outputs = c("stocks.RData"))
)

cat("Starting ETL orchestration...\n")
failures <- character(0)

for (step in plan) {
  script_path <- file.path(etl_dir, step$script)
  cat(sprintf("\n[RUN ] %s\n", script_path))

  ok <- tryCatch(
    {
      run_script(script_path)
      TRUE
    },
    error = function(e) {
      cat(sprintf("[FAIL] %s\n", conditionMessage(e)))
      FALSE
    }
  )

  if (!ok) {
    failures <- c(failures, step$script)
    next
  }

  expected_paths <- file.path(data_dir, step$outputs)
  missing_outputs <- step$outputs[!file.exists(expected_paths)]

  if (length(missing_outputs) > 0) {
    cat(sprintf("[WARN] Expected output(s) missing after run: %s\n", paste(missing_outputs, collapse = ", ")))
    failures <- c(failures, step$script)
  } else {
    cat(sprintf("[OK  ] Generated: %s\n", paste(step$outputs, collapse = ", ")))
  }
}

if (length(failures) > 0) {
  stop(sprintf(
    "ETL finished with failures in %d script(s): %s",
    length(failures),
    paste(failures, collapse = ", ")
  ))
}

covered_outputs <- unique(unlist(lapply(plan, function(x) x$outputs)))
all_data_outputs <- basename(list.files(data_dir, pattern = "\\.RData$", full.names = FALSE))
not_covered <- setdiff(all_data_outputs, covered_outputs)

cat("\nETL orchestration finished successfully.\n")
if (length(not_covered) > 0) {
  cat("\nRData files currently in `tspredit/` without matching ETL script in `etl/`:\n")
  cat(sprintf("- %s\n", sort(not_covered)))
}


