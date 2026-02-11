library(dplyr)
library(stringr)

# 01-extract_transform_load-emissions.R
# Purpose: Build CH4 and N2O emissions dataset (CO2 excluded to match published data)
# Input: Emissions_Totals_E_All_Data_NOFLAG.csv (FAO)
# Output: ../../tspredit/emissions.RData (object: emissions, a named list per country-gas)

build_dataset <- function() {
  raw <- read.table("source/Emissions_Totals_E_All_Data_NOFLAG.csv", header = TRUE, sep = ",")

  # Countries: USA, China, Germany, Japan, India, UK, France, Brazil, Italy, Canada
  country_codes <- c(231, 351, 79, 110, 100, 229, 68, 21, 106, 33)

  filtered <- raw %>%
    filter((Element == "Emissions (CO2)") | (Element == "Emissions (CH4)") | (Element == "Emissions (N2O)")) %>%
    filter(Item == "All sectors with LULUCF") %>%
    filter(Area.Code %in% country_codes) %>%
    arrange(match(Area.Code, country_codes))

  filtered$Area.Code <- NULL
  filtered$Area.Code..M49. <- NULL
  filtered$Item.Code <- NULL
  filtered$Item <- NULL
  filtered$Element.Code <- NULL
  filtered$Source.Code <- NULL
  filtered$Source <- NULL
  filtered$Unit <- NULL
  filtered$Y2030 <- NULL
  filtered$Y2050 <- NULL

  filtered$Area[filtered$Area == "United States of America"] <- "USA"
  filtered$Area[filtered$Area == "United Kingdom of Great Britain and Northern Ireland"] <- "UK"

  filtered <- filtered %>%
    mutate(
      Element = case_when(
        str_detect(Element, "Emissions \\(CO2\\)") ~ "CO2",
        str_detect(Element, "Emissions \\(CH4\\)") ~ "CH4",
        str_detect(Element, "Emissions \\(N2O\\)") ~ "N2O",
        TRUE ~ str_replace_all(Element, "Emissions \\(|\\)", "")
      ),
      Area = tolower(sprintf("%s_%s", str_replace_all(Area, " ", ""), Element))
    )

  # Keep CH4 and N2O to match published data set
  filtered <- filtered %>%
    filter(Element == "CH4" | Element == "N2O")
  filtered$Element <- NULL

  series_list <- list()
  for (i in 1:nrow(filtered)) {
    x <- as.vector(t(filtered[i, 2:ncol(filtered)]))
    names(x) <- str_replace(colnames(filtered)[2:ncol(filtered)], "Y", "")
    series_list[[i]] <- x
  }
  names(series_list) <- filtered$Area

  return(series_list)
}

emissions <- build_dataset()
data_dir <- "../../tspredit"
if (!dir.exists(data_dir))
  dir.create(data_dir, recursive = TRUE)
save(emissions, file = file.path(data_dir, "emissions.RData"))



