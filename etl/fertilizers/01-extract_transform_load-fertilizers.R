library(dplyr)
library(stringr)

# 01-extract_transform_load-fertilizers.R
# Purpose: Build fertilizer nutrients dataset for selected countries (N, P2O5, K2O)
# Input: Inputs_FertilizersNutrient_E_All_Data_NOFLAG.csv (FAO)
# Output: ../../tspredit/fertilizers.RData (object: fertilizers, a named list per country-nutrient)

build_dataset <- function() {
  raw <- read.csv("source/Inputs_FertilizersNutrient_E_All_Data_NOFLAG.csv", header = TRUE, sep = ',')

  # Countries: USA, China, Germany, Japan, India, UK, France, Brazil, Italy, Canada
  country_codes <- c(231, 351, 79, 110, 100, 229, 68, 21, 106, 33)

  filtered <- raw %>%
    filter(Element.Code == 5159) %>%
    filter(Area.Code %in% country_codes) %>%
    arrange(match(Area.Code, country_codes))

  filtered$Area.Code <- NULL
  filtered$Area.Code..M49. <- NULL
  filtered$Item.Code <- NULL
  filtered$Element.Code <- NULL
  filtered$Element <- NULL
  filtered$Unit <- NULL

  filtered$Area[filtered$Area == "United States of America"] <- "USA"
  filtered$Area[filtered$Area == "United Kingdom of Great Britain and Northern Ireland"] <- "UK"

  filtered <- filtered %>%
    mutate(
      Item = case_when(
        str_detect(Item, "Nutrient nitrogen N \\(total\\)") ~ "N",
        str_detect(Item, "Nutrient phosphate P2O5 \\(total\\)") ~ "P2O5",
        str_detect(Item, "Nutrient potash K2O \\(total\\)") ~ "K2O",
        TRUE ~ str_replace_all(Item, "Nutrient potash | \\(total\\)", "")
      ),
      Area = tolower(sprintf("%s_%s", str_replace_all(Area, " ", ""), Item))
    )

  filtered$Item <- NULL

  series_list <- list()
  for (i in 1:nrow(filtered)) {
    x <- as.vector(t(filtered[i, 2:ncol(filtered)]))
    names(x) <- str_replace(colnames(filtered)[2:ncol(filtered)], "Y", "")
    series_list[[i]] <- x
  }
  names(series_list) <- filtered$Area

  return(series_list)
}

fertilizers <- build_dataset()
data_dir <- "../../tspredit"
if (!dir.exists(data_dir))
  dir.create(data_dir, recursive = TRUE)
save(fertilizers, file = file.path(data_dir, "fertilizers.RData"))


