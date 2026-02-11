ETL: Greenhouse Gas Emissions (CH4, N2O)

- Source: FAOSTAT Emissions Totals (GT) — https://www.fao.org/faostat/en/#data/GT
- Inputs: `source/Emissions_Totals_E_All_Data_NOFLAG.csv` (raw), plus reference files in `source/`.
- Output: `../../tspredit/emissions.RData` (object `emissions`)

Structure of final data
- Object: `emissions` — named list where each entry corresponds to a country-gas pair.
- Entry name format: `<country>_<gas>` in lowercase (e.g., `usa_ch4`, `brazil_n2o`).
- Entry value: numeric vector of yearly values; vector names are year labels.

Origin fields and filters
- Columns include: Area Code, Area Code (M49), Area, Item Code, Item, Element Code, Element, Unit, Yxxxx.
- Filters applied:
  - Countries (M49 codes): 231 USA, 351 China, 79 Germany, 110 Japan, 100 India, 229 UK, 68 France, 21 Brazil, 106 Italy, 33 Canada.
  - `Item == "All sectors with LULUCF"`.
  - `Element in {"Emissions (CH4)", "Emissions (N2O)"}` (CO2 excluded in the final object to match published data).

ETL process (etl/emissions/01-extract_transform_load-emissions.R)
- Load FAOSTAT CSV from `source/Emissions_Totals_E_All_Data_NOFLAG.csv`.
- Filter by countries, item, and elements; normalize country names to USA/UK and lowercased tokens; drop metadata columns.
- Map `Element` to a short gas label (`CH4`, `N2O`), then build entry names `<country>_<gas>`.
- For each row, create a numeric vector of the wide year values with names stripped of `Y`.
- Save object `emissions` to `../../tspredit/emissions.RData`.

Files in this folder
- Code: `01-extract_transform_load-emissions.R` — builds the final dataset.
- Source data: files under `source/`.
- Intermediate data: `intermediary/` (reserved; not used currently).


