# IBX-50 list source (reference):
# https://sistemaswebb3-listados.b3.com.br/indexPage/day/IBXL?language=pt-br
# Historical prices source used to create the local snapshot:
# https://finance.yahoo.com/

# 01-extract_transform_load-stocks.R
# Purpose: Build stocks.RData from Yahoo Finance, using local cache by default.
# Input: source/ibx50.xlsx (tickers) and optional source/stocks.RData (cache)
# Output: ../../tspredit/stocks.RData
# Origin: Yahoo Finance OHLCV for IBX-50 tickers.
# Reload mode: set env var TSPREDBENCH_STOCKS_REFRESH=true to refresh cache from Yahoo.

library(quantmod)
library(readxl)

to_bool <- function(x) {
  tolower(trimws(as.character(x))) %in% c("1", "true", "t", "yes", "y")
}

build_dataset_from_yahoo <- function(ibx50_file) {
  ibx50 <- read_excel(ibx50_file)
  series_list <- list()

  for (i in seq_len(nrow(ibx50))) {
    ticker_base <- ibx50$Code[i]
    ticker <- sprintf("%s.SA", ticker_base)
    cat("Downloading:", ticker, "\n")

    tryCatch({
      getSymbols(
        ticker,
        src = "yahoo",
        from = as.Date("2000-01-01"),
        to = Sys.Date(),
        auto.assign = TRUE
      )
      prices <- get(ticker)
      series_list[[ticker_base]] <- data.frame(
        date = index(prices),
        open = as.numeric(Op(prices)),
        high = as.numeric(Hi(prices)),
        low = as.numeric(Lo(prices)),
        close = as.numeric(Cl(prices)),
        volume = as.numeric(Vo(prices))
      )
    }, error = function(e) {
      cat("Error for", ticker, ":", conditionMessage(e), "\n")
    })
  }

  series_list
}

build_dataset <- function(refresh = FALSE) {
  cache_file <- file.path("source", "stocks.RData")
  ibx50_file <- file.path("source", "ibx50.xlsx")
  data_dir <- file.path("..", "..", "tspredit")
  output_file <- file.path(data_dir, "stocks.RData")

  if (!dir.exists(data_dir)) {
    dir.create(data_dir, recursive = TRUE)
  }

  if (!refresh) {
    if (!file.exists(cache_file)) {
      stop(
        sprintf(
          "Cache not found: %s. To refresh from Yahoo, set TSPREDBENCH_STOCKS_REFRESH=true.",
          cache_file
        )
      )
    }
    load(cache_file)
  } else {
    if (!file.exists(ibx50_file)) {
      stop(sprintf("Ticker source file not found: %s", ibx50_file))
    }
    stocks <- build_dataset_from_yahoo(ibx50_file)
    save(stocks, file = cache_file)
  }

  save(stocks, file = output_file)
}

refresh <- to_bool(Sys.getenv("TSPREDBENCH_STOCKS_REFRESH", unset = "false"))
build_dataset(refresh = refresh)


