options(scipen=999)

library(dplyr)
library(stringr)

carrega <- function() {
  landUse <- read.csv("Inputs_LandUse_E_All_Data_NOFLAG.csv", header=TRUE, sep=',')
  landUse <- landUse |> filter(Area.Code < 5000) |> filter(Item.Code == 6620) |> select (Area, Item, Unit, Y2020)
  
  pesticides <- read.csv("Inputs_Pesticides_Use_E_All_Data_NOFLAG.csv", header=TRUE, sep=',')
  pesticides <- pesticides |> filter(Area.Code < 5000) |> filter(Item.Code == 1357) |> filter(Area.Code != 41)
  i <- order(pesticides$Y2020, decreasing = TRUE)
  pesticides <- pesticides[i,]
  pesticides <- head(pesticides, 10)
  pesticides$Area <- str_replace_all(tolower(pesticides$Area), " ", "_")
  pesticides$Area.Code <- NULL
  pesticides$Area.Code..M49. <- NULL
  pesticides$Item.Code <- NULL
  pesticides$Item <- NULL
  pesticides$Element.Code <- NULL
  pesticides$Element <- NULL
  pesticides$Unit <- NULL
  
  dataset <- list()
  for (i in 1:nrow(pesticides)) {
    x <- as.vector(t(pesticides[i, 2:ncol(pesticides)]))
    names(x) <- str_replace(colnames(pesticides)[2:ncol(pesticides)], "Y", "")
    dataset[[i]] <- x
  }
  names(dataset) <- pesticides$Area  
  return(dataset)
}

dataset <- carrega()
