ETL: M4 Competition Subsets

- Reference: M-competitions (M4) — https://github.com/Mcompetitions/M4-methods
- Inputs: CSVs under `source/`: e.g., `m4-daily.csv`, `m4-hourly.csv`, `m4-monthly.csv`, `m4-quarterly.csv`, `m4-weekly.csv`, `m4-yearly.csv` (only existing files are used).
- Output: `../../tspredit/m4.RData` (object `m4`)

Structure of final data
- Object: `m4` — named list with keys by frequency present in `source/` (e.g., `daily`, `hourly`, ...).
- Each frequency contains a list of series: names are series IDs; values are numeric vectors with time-ordered observations.

ETL process (etl/m4/01-extract_transform_load-m4.R)
- Detect which expected CSV stems exist under `source/` and load them (wide format, series in rows, time in columns; row names are series IDs).
- Uniformly sample up to `n = 10` series per frequency to limit dataset size for the package.
- Convert each row to a numeric vector and store under its series ID.
- Save consolidated list `m4` to `../../tspredit/m4.RData`.

Files in this folder
- Code: `01-extract_transform_load-m4.R` — builds the final dataset.
- Source data: files under `source/`.
- Intermediate data: `intermediary/` (reserved; not used currently).


