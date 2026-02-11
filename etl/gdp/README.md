ETL: Gross Domestic Product (GDP)

- Source: FAOSTAT Macro-Statistics Key Indicators (MK) — https://www.fao.org/faostat/en/#data/MK
- Inputs: `source/Macro-Statistics_Key_Indicators_E_All_Data_NOFLAG.csv` (raw), plus reference files in `source/`.
- Output: `../../tspredit/gdp.RData` (object `gdp`)

Structure of final data
- Object: `gdp` — named list where each entry corresponds to a country.
- Entry name format: `<country>_gdp` in lowercase with hyphens (e.g., `usa_gdp`, `united-kingdom_gdp` → `uk_gdp`).
- Entry value: numeric vector of yearly values; vector names are year labels.

Origin fields and filters
- Columns include: Area Code, Area Code (M49), Area, Item Code, Item, Element Code, Element, Unit, Y1970–Y2023.
- Filters applied:
  - Countries (M49 codes): 231 USA, 351 China, 79 Germany, 110 Japan, 100 India, 229 UK, 68 France, 21 Brazil, 106 Italy, 33 Canada.
  - `Item.Code == 22008` (Gross Domestic Product).
  - `Element.Code == 6110` (Value, US$).

ETL process (etl/gdp/01-extract_transform_load-gdp.R)
- Load FAOSTAT CSV from `source/Macro-Statistics_Key_Indicators_E_All_Data_NOFLAG.csv`.
- Filter by countries, item, and element codes; normalize country names (USA/UK) and build `<country>_gdp` keys; drop metadata columns.
- For each row, create a numeric vector of year values with names stripped of `Y`.
- Save object `gdp` to `../../tspredit/gdp.RData`.

Files in this folder
- Code: `01-extract_transform_load-gdp.R` — builds the final dataset.
- Source data: files under `source/`.
- Intermediate data: `intermediary/` (reserved; not used currently).


