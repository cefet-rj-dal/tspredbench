library(dplyr)
library(stringr)

# 01-extract_transform_load-climate.R
# Purpose: Build annual mean temperature change dataset for selected countries
# Input: Environment_Temperature_change_E_All_Data_NOFLAG.csv (FAO)
# Output: ../../tspredit/climate.RData (object: climate, a named list per country)

build_dataset <- function() {
  raw <- read.csv(
    "source/Environment_Temperature_change_E_All_Data_NOFLAG.csv",
    header = TRUE, sep = ',', fileEncoding = "ISO-8859-1"
  )

  # Countries: USA, China, Germany, Japan, India, UK, France, Brazil, Italy, Canada
  country_codes <- c(231, 351, 79, 110, 100, 229, 68, 21, 106, 33)

  filtered <- raw %>%
    filter(Months.Code == 7020) %>%  # Annual
    filter(Element.Code == 7271) %>% # Temperature change
    filter(Area.Code %in% country_codes) %>%
    arrange(match(Area.Code, country_codes))

  filtered$Area.Code <- NULL
  filtered$Area.Code..M49. <- NULL
  filtered$Months.Code <- NULL
  filtered$Months <- NULL
  filtered$Element.Code <- NULL
  filtered$Element <- NULL
  filtered$Unit <- NULL

  filtered$Area[filtered$Area == "United States of America"] <- "USA"
  filtered$Area[filtered$Area == "United Kingdom of Great Britain and Northern Ireland"] <- "UK"
  filtered$Area <- paste(str_replace_all(tolower(filtered$Area), " ", "-"), "_climate", sep = "")

  series_list <- list()
  for (i in 1:nrow(filtered)) {
    x <- as.vector(t(filtered[i, 2:ncol(filtered)]))
    names(x) <- str_replace(colnames(filtered)[2:ncol(filtered)], "Y", "")
    series_list[[i]] <- x
  }
  names(series_list) <- filtered$Area

  return(series_list)
}

climate <- build_dataset()
data_dir <- "../../tspredit"
if (!dir.exists(data_dir))
  dir.create(data_dir, recursive = TRUE)
save(climate, file = file.path(data_dir, "climate.RData"))


