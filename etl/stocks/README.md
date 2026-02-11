ETL: Stocks (IBX-50, Yahoo Finance)

- Source: Ticker list IBX-50 — https://sistemaswebb3-listados.b3.com.br/indexPage/day/IBXL?language=pt-br
- Source: Historical prices snapshot from Yahoo Finance — https://finance.yahoo.com/
- Inputs:
  - `source/stocks.RData` (cache local, usado por padrao)
  - `source/ibx50.xlsx` (lista de tickers para recarga)
- Output: `../../tspredit/stocks.RData` (object `stocks`)

Structure of final data
- Object: `stocks` — named list where each entry is a data frame per ticker.
- Entry name: stock ticker symbol without the `.SA` suffix (e.g., `PETR4`).
- Data frame columns: `date`, `open`, `high`, `low`, `close`, `volume`.

ETL process (etl/stocks/01-extract_transform_load-stocks.R)
- Padrao (sem recarga): carrega `source/stocks.RData` e salva em `../../tspredit/stocks.RData`.
- Recarga opcional: define `TSPREDBENCH_STOCKS_REFRESH=true`, baixa do Yahoo, atualiza
  `source/stocks.RData` (cache) e salva em `../../tspredit/stocks.RData`.
- A recarga nao e o comportamento padrao.

Files in this folder
- Code: `01-extract_transform_load-stocks.R` — builds the final dataset.
- Source data: files under `source/`.
- Intermediate data: `intermediary/` (reserved; not used currently).


