library(dplyr)
library(stringr)

# 01-extract_transform_load-pesticides.R
# Purpose: Build pesticides use dataset for selected countries
# Input: Inputs_Pesticides_Use_E_All_Data_NOFLAG.csv (FAO)
# Output: ../../tspredit/pesticides.RData (object: pesticides, a named list per country)

build_dataset <- function() {
  raw <- read.csv("source/Inputs_Pesticides_Use_E_All_Data_NOFLAG.csv", header = TRUE, sep = ',')

  # Countries: India, Japan, Canada, USA, China, Germany, UK, France, Brazil, Italy
  country_codes <- c(100, 110, 33, 231, 351, 79, 110, 229, 68, 21, 106)

  filtered <- raw %>%
    filter(Item.Code == 1357) %>%
    filter(Element.Code == 5157) %>%
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

  filtered$Area <- paste(str_replace_all(tolower(filtered$Area), " ", "-"), "_pesticides", sep = "")

  series_list <- list()
  for (i in 1:nrow(filtered)) {
    x <- as.vector(t(filtered[i, 2:ncol(filtered)]))
    names(x) <- str_replace(colnames(filtered)[2:ncol(filtered)], "Y", "")
    series_list[[i]] <- x
  }
  names(series_list) <- filtered$Area

  return(series_list)
}

pesticides <- build_dataset()
data_dir <- "../../tspredit"
if (!dir.exists(data_dir))
  dir.create(data_dir, recursive = TRUE)
save(pesticides, file = file.path(data_dir, "pesticides.RData"))


