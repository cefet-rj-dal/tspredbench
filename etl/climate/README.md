ETL: Climate (Temperature Change)

- Source: FAOSTAT Temperature Change (ET) — https://www.fao.org/faostat/en/#data/ET
- Inputs: `source/Environment_Temperature_change_E_All_Data_NOFLAG.csv` (raw), plus reference files in `source/`.
- Output: `../../tspredit/climate.RData` (object `climate`)

Structure of final data
- Object: `climate` — named list where each entry corresponds to a country.
- Entry name format: `<country>_climate` in lowercase with hyphens (e.g., `united-kingdom_climate` → `uk_climate`).
- Entry value: numeric vector of yearly values; vector names are year labels.

Origin fields and filters
- Columns include: Area Code, Area Code (M49), Area, Months Code, Months, Element Code, Element, Unit, Y1961–Y2023.
- Filters applied:
  - Countries (M49 codes): 231 USA, 351 China, 79 Germany, 110 Japan, 100 India, 229 UK, 68 France, 21 Brazil, 106 Italy, 33 Canada.
  - `Element.Code == 7271` (Temperature change).
  - `Months.Code == 7020` (Meteorological year / annual).

ETL process (etl/climate/01-extract_transform_load-climate.R)
- Load FAOSTAT CSV from `source/Environment_Temperature_change_E_All_Data_NOFLAG.csv`.
- Filter by country codes and Element/Months codes; sort by country code order.
- Normalize country names: USA/UK short forms; build `<country>_climate` names; drop metadata columns.
- For each row, create a numeric vector of the wide year values with names stripped of `Y`.
- Save object `climate` to `../../tspredit/climate.RData`.

Files in this folder
- Code: `01-extract_transform_load-climate.R` — builds the final dataset.
- Source data: files under `source/`.
- Intermediate data: `intermediary/` (reserved; not used currently).


