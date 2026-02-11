#!/usr/bin/env Rscript

# 02-build-minidata.R
# Purpose: Build mini .RData files in `data/` from full .RData files in `tspredit/`.
# Rules:
# - If object is data.frame: keep first 30 rows.
# - If object is list: keep only first element; if this first element is data.frame,
#   keep first 30 rows of that data.frame.
# - Add attr(obj, "url") pointing to the full file in GitHub.
# Output: ../data/*.RData

shrink_object <- function(x) {
  if (is.data.frame(x)) {
    return(utils::head(x, 30))
  }

  if (is.list(x)) {
    if (length(x) == 0) {
      return(x)
    }

    mini <- x[1]
    if (is.data.frame(mini[[1]])) {
      mini[[1]] <- utils::head(mini[[1]], 30)
    }
    return(mini)
  }

  x
}

build_minidata <- function() {
  etl_dir <- normalizePath("etl", mustWork = TRUE)
  repo_root <- normalizePath(file.path(etl_dir, ".."), mustWork = TRUE)
  full_dir <- file.path(repo_root, "tspredit")
  mini_dir <- file.path(repo_root, "data")
  base_url <- "https://raw.githubusercontent.com/cefet-rj-dal/tspredbench/refs/heads/main/tspredit"

  if (!dir.exists(full_dir)) {
    stop(sprintf("Full data directory not found: %s", full_dir))
  }
  if (!dir.exists(mini_dir)) {
    dir.create(mini_dir, recursive = TRUE)
  }

  files <- sort(list.files(full_dir, pattern = "\\.RData$", full.names = FALSE))
  if (length(files) == 0) {
    stop(sprintf("No .RData files found in: %s", full_dir))
  }

  for (f in files) {
    full_path <- file.path(full_dir, f)
    mini_path <- file.path(mini_dir, f)
    url <- sprintf("%s/%s", base_url, f)

    in_env <- new.env(parent = emptyenv())
    obj_names <- load(full_path, envir = in_env)
    if (length(obj_names) == 0) {
      warning(sprintf("Skipping %s (no objects in file).", f))
      next
    }
    if (length(obj_names) > 1) {
      warning(sprintf("File %s has multiple objects; using first: %s", f, obj_names[1]))
    }

    obj_name <- obj_names[1]
    obj <- get(obj_name, envir = in_env)
    mini_obj <- shrink_object(obj)
    attr(mini_obj, "url") <- url

    out_env <- new.env(parent = emptyenv())
    assign(obj_name, mini_obj, envir = out_env)
    save(list = obj_name, file = mini_path, envir = out_env)
    cat(sprintf("[OK] %s -> %s (obj: %s)\n", full_path, mini_path, obj_name))
  }

  cat("Mini data generation completed.\n")
}

build_minidata()

