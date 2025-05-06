options(scipen=999)

library(dplyr)
library(stringr)

carrega <- function() {
  dataset <- read.table("Environment_Emissions_by_Sector_E_All_Data_NOFLAG.csv", header=TRUE, sep=",")
  y <- dataset |> dplyr::filter((Element == "CO2 emissions") | (Element == "N2O emissions") | (Element == "CH4 emissions")) |>
    dplyr::filter((Item == "Total emissions with agricultural land use")) |> 
    dplyr::filter(Area.Code < 5000) |> 
    dplyr::filter((Area != "China, mainland") & (Area != "China, Taiwan Province of"))
  
  
  z <- y |> dplyr::select(Area, Item, Element, Y2017) |> group_by(Area) |> summarise(emission = sum(Y2017, na.rm=TRUE))
  z <- z[order(z$emission, decreasing = TRUE), ]
  z <- head(z, 10)
  countries <- z$Area
  
  z <- y |> dplyr::filter(Area %in% countries)
  
  z$Area[z$Area == "Iran (Islamic Republic of)"] <- "Iran"
  z$Area[z$Area == "Russian Federation"] <- "Russia"
  z$Area[z$Area == "United States of America"] <- "USA"
  
  
  
  z$Area <- tolower(sprintf("%s_%s", str_replace_all(z$Area, " ", ""), str_replace(z$Element, " emissions", "")))
  z$Area.Code <- NULL
  z$Item.Code <- NULL
  z$Element.Code <- NULL
  z$Item <- NULL
  z$Element <- NULL
  z$Unit <- NULL
  
  
  dataset <- list()
  for (i in 1:nrow(z)) {
    x <- as.vector(t(z[i, 2:ncol(z)]))
    names(x) <- str_replace(colnames(z)[2:ncol(z)], "Y", "")
    dataset[[i]] <- x
  }
  
  names(dataset) <- z$Area
  return(dataset)  
}

dataset <- carrega()
