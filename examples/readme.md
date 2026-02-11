---
title: "Package Examples: Index"
output: html_document
---

This document lists the example notebooks available under `examples`, with direct links and a short description of each notebook’s purpose. Use it as a starting point to explore the datasets and modeling flows included in the package.

## How to Navigate

- Click each link to open the corresponding `.md` file.
- Every notebook begins with an overview, followed by well‑commented code blocks and a references section.

## Examples

- [Bioenergy (FAOSTAT)](/examples/bioenergy.md)
  - Load, visualize, and forecast country bioenergy series (consumption/production) using a simple ARIMA model.

- [Climate – Temperature Change (FAOSTAT)](/examples/climate.md)
  - Land temperature anomalies by country: inspect a series, perform a train/test split, and evaluate forecasts.

- [Emissions – GHG (FAOSTAT)](/examples/emissions.md)
  - Country CH4 and N2O emission series with visualization and short‑horizon forecasting.

- [Fertilizers by Nutrient (FAOSTAT)](/examples/fertilizers.md)
  - Country nutrient usage (N, P2O5, K2O): select a series and build a simple ARIMA forecast.

- [GDP – Macro Indicators (FAOSTAT)](/examples/gdp.md)
  - Country GDP series: load, visualize, and forecast a short horizon.

- [M1 Competition](/examples/m1.md)
  - Consolidated M1 by frequency; monthly series example with an ARIMA workflow.

- [M3 Competition](/examples/m3.md)
  - M3 monthly series example (M1111) and a basic forecasting pipeline.

- [M4 Competition](/examples/m4.md)
  - M4 monthly series example (M32000) and forecast evaluation.

- [Pesticides Use (FAOSTAT)](/examples/pesticides.md)
  - Country pesticides usage; visualization and forecasting with a train/test split.

- [Stocks – IBX‑50 (B3)](/examples/stocks.md)
  - Daily OHLCV per ticker; closing‑price example and a simple forecast.

## Tips

- To run the notebooks, open the `.md` file in RStudio and click “Knit”, or execute chunks individually.
- If an example depends on data built via ETLs, run the scripts in `etl/<dataset>/1-build-*.R` beforehand to refresh the `data/` folder.
