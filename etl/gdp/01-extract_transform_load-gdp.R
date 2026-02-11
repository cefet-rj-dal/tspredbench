library(dplyr)
library(stringr)

# 01-extract_transform_load-gdp.R
# Purpose: Build GDP dataset for selected countries
# Input: Macro-Statistics_Key_Indicators_E_All_Data_NOFLAG.csv (FAO)
# Output: ../../tspredit/gdp.RData (object: gdp, a named list per country)

build_dataset <- function() {
  raw <- read.csv("source/Macro-Statistics_Key_Indicators_E_All_Data_NOFLAG.csv", header = TRUE, sep = ',')

  # Countries: USA, China, Germany, Japan, India, UK, France, Brazil, Italy, Canada
  country_codes <- c(231, 351, 79, 110, 100, 229, 68, 21, 106, 33)

  filtered <- raw %>%
    filter(Item.Code == 22008) %>%
    filter(Element.Code == 6110) %>%
    filter(Area.Code %in% country_codes) %>%
    arrange(match(Area.Code, country_codes))

  filtered$Area.Code <- NULL
  filtered$Area.Code..M49. <- NULL
  filtered$Item.Code <- NULL
  filtered$Item <- NULL
  filtered$Element.Code <- NULL
  filtered$Element <- NULL
  filtered$Unit <- NULL

  filtered$Area[filtered$Area == "United States of America"] <- "USA"
  filtered$Area[filtered$Area == "United Kingdom of Great Britain and Northern Ireland"] <- "UK"
  filtered$Area <- paste(str_replace_all(tolower(filtered$Area), " ", "-"), "_gdp", sep = "")

  series_list <- list()
  for (i in 1:nrow(filtered)) {
    x <- as.vector(t(filtered[i, 2:ncol(filtered)]))
    names(x) <- str_replace(colnames(filtered)[2:ncol(filtered)], "Y", "")
    series_list[[i]] <- x
  }
  names(series_list) <- filtered$Area

  return(series_list)
}

gdp <- build_dataset()
data_dir <- "../../tspredit"
if (!dir.exists(data_dir))
  dir.create(data_dir, recursive = TRUE)
save(gdp, file = file.path(data_dir, "gdp.RData"))


