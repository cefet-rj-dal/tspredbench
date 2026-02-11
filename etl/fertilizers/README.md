ETL: Fertilizer Nutrients (N, P2O5, K2O)

- Source: FAOSTAT Fertilizers by Nutrient (RFN) — https://www.fao.org/faostat/en/#data/RFN
- Inputs: `source/Inputs_FertilizersNutrient_E_All_Data_NOFLAG.csv` (raw), plus reference files in `source/`.
- Output: `../../tspredit/fertilizers.RData` (object `fertilizers`)

Structure of final data
- Object: `fertilizers` — named list where each entry corresponds to a country-nutrient pair.
- Entry name format: `<country>_<nutrient>` in lowercase (e.g., `usa_n`, `france_p2o5`, `brazil_k2o`).
- Entry value: numeric vector of yearly values; vector names are year labels.

Origin fields and filters
- Columns include: Area Code, Area Code (M49), Area, Item Code, Item, Element Code, Element, Unit, Yxxxx.
- Filters applied:
  - Countries (M49 codes): 231 USA, 351 China, 79 Germany, 110 Japan, 100 India, 229 UK, 68 France, 21 Brazil, 106 Italy, 33 Canada.
  - `Element.Code == 5159` (Nutrients total).
  - `Item` mapped to short nutrient labels: N, P2O5, K2O.

ETL process (etl/fertilizers/01-extract_transform_load-fertilizers.R)
- Load FAOSTAT CSV from `source/Inputs_FertilizersNutrient_E_All_Data_NOFLAG.csv`.
- Filter by countries and element code; normalize country names (USA/UK) and lowercased tokens; drop metadata columns.
- Map nutrient names to short codes; build entry names `<country>_<nutrient>`.
- For each row, create a numeric vector of year values with names stripped of `Y`.
- Save object `fertilizers` to `../../tspredit/fertilizers.RData`.

Files in this folder
- Code: `01-extract_transform_load-fertilizers.R` — builds the final dataset.
- Source data: files under `source/`.
- Intermediate data: `intermediary/` (reserved; not used currently).


