ETL: Bioenergy

- Source: FAOSTAT Bioenergy (BE) — https://www.fao.org/faostat/en/#data/BE
- Inputs: `source/Environment_Bioenergy_E_All_Data_NOFLAG.csv` (raw), plus reference files in `source/`.
- Output: `../../tspredit/bioenergy.RData` (object `bioenergy`)

Structure of final data
- Object: `bioenergy` — named list where each entry corresponds to a country-element pair.
- Entry name format: `<country>_<bio_consumption|bio_production>` in lowercase (e.g., `usa_bio_consumption`).
- Entry value: numeric vector of yearly values; vector names are year labels (e.g., `1990`, `1991`, ...).

Origin fields and filters
- Columns include: Area Code, Area Code (M49), Area, Item Code, Item, Element Code, Element, Unit, Y1990–Y2022.
- Filters applied:
  - Countries (M49 codes): 231 USA, 351 China, 79 Germany, 110 Japan, 100 India, 229 UK, 68 France, 21 Brazil, 106 Italy, 33 Canada.
  - `Item.Code == 6527` (Total Bioenergy).
  - `Element.Code %in% {5851 (Energy consumption), 5852 (Energy production)}`.

ETL process (etl/bioenergy/01-extract_transform_load-bioenergy.R)
- Load FAOSTAT CSV from `source/Environment_Bioenergy_E_All_Data_NOFLAG.csv`.
- Filter by country codes and by Item/Element codes above; sort by the country code order listed.
- Normalize country names: "United States of America" → "USA"; "United Kingdom of Great Britain and Northern Ireland" → "UK".
- Map `Element` to `bio_consumption` or `bio_production`; build entry names as `<country>_<element>` in lowercase; drop metadata columns.
- For each row, create a numeric vector of the wide year values with names stripped of the `Y` prefix.
- Save object `bioenergy` to `../../tspredit/bioenergy.RData`.

Files in this folder
- Code: `01-extract_transform_load-bioenergy.R` — builds the final dataset.
- Source data: files under `source/`.
- Intermediate data: `intermediary/` (reserved; not used currently).


