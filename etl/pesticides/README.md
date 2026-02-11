ETL: Pesticides Use

- Source: FAOSTAT Pesticides Use (RP) — https://www.fao.org/faostat/en/#data/RP
- Inputs: `source/Inputs_Pesticides_Use_E_All_Data_NOFLAG.csv` (raw), plus reference files in `source/`.
- Output: `../../tspredit/pesticides.RData` (object `pesticides`)

Structure of final data
- Object: `pesticides` — named list where each entry corresponds to a country.
- Entry name format: `<country>_pesticides` in lowercase with hyphens (e.g., `brazil_pesticides`).
- Entry value: numeric vector of yearly values; vector names are year labels.

Origin fields and filters
- Columns include: Area Code, Area Code (M49), Area, Item Code, Item, Element Code, Element, Unit, Yxxxx.
- Filters applied:
  - Countries (M49 codes): India, Japan, Canada, USA, China, Germany, UK, France, Brazil, Italy (see `source/Inputs_Pesticides_Use_E_All_Data_NOFLAG.csv`).
  - `Item.Code == 1357` (Pesticides, total).
  - `Element.Code == 5157`.

ETL process (etl/pesticides/01-extract_transform_load-pesticides.R)
- Load FAOSTAT CSV from `source/Inputs_Pesticides_Use_E_All_Data_NOFLAG.csv`.
- Filter by countries, item, and element codes; normalize country names (USA/UK) and build `<country>_pesticides` keys; drop metadata columns.
- For each row, create a numeric vector of year values with names stripped of `Y`.
- Save object `pesticides` to `../../tspredit/pesticides.RData`.

Files in this folder
- Code: `01-extract_transform_load-pesticides.R` — builds the final dataset.
- Source data: files under `source/`.
- Intermediate data: `intermediary/` (reserved; not used currently).


