#!/usr/bin/env Rscript

# 02-build-minidata.R
# Purpose: Build mini artifacts from the full .RData files in `tspredit/`.
# Rules (miniaturization, shared by both outputs):
# - If object is data.frame: keep first 30 rows.
# - If object is list: keep only first element; if this first element is data.frame,
#   keep first 30 rows of that data.frame.
# - Add attr(obj, "url") pointing to the full file in GitHub.
#
# Dual output (Eidolon miniatures in two package-native serializations):
# - R   : ../data/*.RData            (consumed by the tspredbench/tspredit R packages)
# - Py  : ../data/python/*.csv|json  + manifest.json  (consumed by pytspredit)
#   Both are written from the SAME shrunk object, so the R and Python miniatures are
#   content-identical by construction. The Python serialization preserves the Eidolon
#   contract (identity, schema, url) rather than the R serialization: data.frame -> CSV,
#   list -> JSON, plus a manifest.json recording {name: {url, kind, schema}}.

suppressWarnings(suppressMessages({
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    stop("Package 'jsonlite' is required to emit the Python miniatures.")
  }
}))

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

# Classify a (shrunk) object into one of the Eidolon miniature kinds.
detect_kind <- function(obj) {
  if (is.data.frame(obj)) return("dataframe")
  if (is.list(obj)) {
    el <- obj[[1]]
    if (is.data.frame(el)) return("df_list")
    if (is.list(el))       return("nested_list")
    return("series_list")
  }
  "unknown"
}

# Write one Python miniature (CSV or JSON) and return its manifest entry.
write_python_mini <- function(obj, name, url, py_dir) {
  kind <- detect_kind(obj)
  entry <- list(url = url, kind = kind)

  if (kind == "dataframe") {
    fn <- paste0(name, ".csv")
    utils::write.csv(obj, file.path(py_dir, fn), row.names = FALSE)
    entry$file <- fn
    entry$nrow <- nrow(obj)
    entry$ncol <- ncol(obj)
    entry$columns <- names(obj)
  } else {
    fn <- paste0(name, ".json")
    js <- jsonlite::toJSON(obj, dataframe = "rows", na = "null", null = "null",
                           digits = NA, auto_unbox = FALSE)
    writeLines(js, file.path(py_dir, fn))
    entry$file <- fn
    entry$keys <- names(obj)
    if (kind == "series_list") entry$lengths <- vapply(obj, length, integer(1))
    if (kind == "df_list")     entry$shapes  <- lapply(obj, function(d) c(nrow = nrow(d), ncol = ncol(d)))
    if (kind == "nested_list") entry$subkeys <- lapply(obj, names)
  }
  entry
}

build_minidata <- function() {
  etl_dir <- normalizePath("etl", mustWork = TRUE)
  repo_root <- normalizePath(file.path(etl_dir, ".."), mustWork = TRUE)
  full_dir <- file.path(repo_root, "tspredit")
  mini_dir <- file.path(repo_root, "data")
  py_dir <- file.path(mini_dir, "python")
  base_url <- "https://raw.githubusercontent.com/cefet-rj-dal/tspredbench/refs/heads/main/tspredit"

  if (!dir.exists(full_dir)) {
    stop(sprintf("Full data directory not found: %s", full_dir))
  }
  if (!dir.exists(mini_dir)) {
    dir.create(mini_dir, recursive = TRUE)
  }
  if (!dir.exists(py_dir)) {
    dir.create(py_dir, recursive = TRUE)
  }

  files <- sort(list.files(full_dir, pattern = "\\.RData$", full.names = FALSE))
  if (length(files) == 0) {
    stop(sprintf("No .RData files found in: %s", full_dir))
  }

  manifest <- list()

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

    # R miniature (unchanged behavior)
    out_env <- new.env(parent = emptyenv())
    assign(obj_name, mini_obj, envir = out_env)
    save(list = obj_name, file = mini_path, envir = out_env)

    # Python miniature (same shrunk object)
    manifest[[obj_name]] <- write_python_mini(mini_obj, obj_name, url, py_dir)

    cat(sprintf("[OK] %s -> %s + python/%s (obj: %s)\n",
                full_path, mini_path, manifest[[obj_name]]$file, obj_name))
  }

  manifest_path <- file.path(py_dir, "manifest.json")
  writeLines(
    jsonlite::toJSON(manifest, pretty = TRUE, auto_unbox = TRUE, na = "null", null = "null"),
    manifest_path
  )
  cat(sprintf("Mini data generation completed. Python manifest: %s (%d datasets)\n",
              manifest_path, length(manifest)))
}

build_minidata()
