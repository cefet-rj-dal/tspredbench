library(dplyr)
library(stringr)

# 01-extract_transform_load-bioenergy.R
# Purpose: Build Bioenergy dataset for selected countries (consumption/production)
# Input: Environment_Bioenergy_E_All_Data_NOFLAG.csv (FAO)
# Output: ../../tspredit/bioenergy.RData (object: bioenergy, a named list per country/element)

build_dataset <- function() {
  raw <- read.csv("source/Environment_Bioenergy_E_All_Data_NOFLAG.csv", header = TRUE, sep = ',')

  # Countries: USA, China, Germany, Japan, India, UK, France, Brazil, Italy, Canada
  country_codes <- c(231, 351, 79, 110, 100, 229, 68, 21, 106, 33)

  filtered <- raw %>%
    filter(Item.Code == 6527) %>%
    filter(Area.Code %in% country_codes) %>%
    arrange(match(Area.Code, country_codes))

  filtered$Area.Code <- NULL
  filtered$Area.Code..M49. <- NULL
  filtered$Item.Code <- NULL
  filtered$Item <- NULL
  filtered$Element.Code <- NULL
  filtered$Unit <- NULL

  filtered$Area[filtered$Area == "United States of America"] <- "USA"
  filtered$Area[filtered$Area == "United Kingdom of Great Britain and Northern Ireland"] <- "UK"

  filtered <- filtered %>%
    mutate(
      Element = case_when(
        str_detect(Element, "Energy consumption") ~ "bio_consumption",
        str_detect(Element, "Energy production") ~ "bio_production",
        TRUE ~ Element
      ),
      Area = tolower(sprintf("%s_%s", str_replace_all(Area, " ", ""), Element))
    )

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

bioenergy <- build_dataset()
data_dir <- "../../tspredit"
if (!dir.exists(data_dir))
  dir.create(data_dir, recursive = TRUE)
save(bioenergy, file = file.path(data_dir, "bioenergy.RData"))


