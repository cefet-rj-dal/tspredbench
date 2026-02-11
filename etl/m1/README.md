ETL: M1 Competition Subsets

- Reference: M-competitions (M1) — https://zenodo.org/records/4656154
- Inputs: CSVs under `source/`: `m1-monthly.csv`, `m1-quarterly.csv`, `m1-yearly.csv`.
- Output: `../../tspredit/m1.RData` (object `m1`)

Structure of final data
- Object: `m1` — named list with keys by frequency: `monthly`, `quarterly`, `yearly`.
- Each frequency contains a list of series: names are series IDs; values are numeric vectors with time-ordered observations.

ETL process (etl/m1/01-extract_transform_load-m1.R)
- Read each available CSV from `source/` (wide format with series in rows and time in columns, row names are series IDs).
- Uniformly sample up to `n = 10` series to limit dataset size for the package.
- Convert each row to a numeric vector and store under its series ID.
- Save consolidated list `m1` to `../../tspredit/m1.RData`.

Files in this folder
- Code: `01-extract_transform_load-m1.R` — builds the final dataset.
- Source data: files under `source/`.
- Intermediate data: `intermediary/` (reserved; not used currently).


