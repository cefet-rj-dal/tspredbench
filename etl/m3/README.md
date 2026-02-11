ETL: M3 Competition Subsets

- Reference: M-competitions (M3) — https://zenodo.org/records/4656262
- Inputs: CSVs under `source/`: `m3-monthly.csv`, `m3-other.csv`, `m3-quarterly.csv`, `m3-yearly.csv`.
- Output: `../../tspredit/m3.RData` (object `m3`)

Structure of final data
- Object: `m3` — named list with keys by frequency: `monthly`, `other`, `quarterly`, `yearly`.
- Each frequency contains a list of series: names are series IDs; values are numeric vectors with time-ordered observations.

ETL process (etl/m3/01-extract_transform_load-m3.R)
- Read each available CSV from `source/` (wide format with series in rows and time in columns, row names are series IDs).
- Uniformly sample up to `n = 10` series to limit dataset size for the package.
- Convert each row to a numeric vector and store under its series ID.
- Save consolidated list `m3` to `../../tspredit/m3.RData`.

Files in this folder
- Code: `01-extract_transform_load-m3.R` — builds the final dataset.
- Source data: files under `source/`.
- Intermediate data: `intermediary/` (reserved; not used currently).


