#' @name gecco
#' @title Gecco Challenge 2018
#' @description Data collection for water quality monitoring.
#'     Data Type:	Water quality. Category:	Environment. Creation Date	2018.
#'     See \href{https://github.com/cefet-rj-dal/event_datasets}{cefet-rj-dal/event_datasets}
#'     for detailed guidance on using this package and the other datasets available in it.
#'     Labels available? Yes
#'
#' @docType data
#' @usage data(gecco)
#' @format A list of time series.
#' @keywords datasets
#'
#'#' @references Genetic and Evolutionary Computation Conference (Gecco), Association for Computing Machinery (ACM)
#'
#' @source \href{https://www.spotseven.de/gecco/gecco-challenge}{Gecco Challenge 2018}
#'
#' @examples
#' data(gecco)
#' serie <- gecco[[1]]
"gecco"

#' @name bioenergy
#' @title FAOSTAT Bioenergy Database
#' @description 
#' Bioenergy data from FAOSTAT.
#'Data Type:	Bioenergy consumption and production. Category:	Environment. Creation Date	2024.
#'     See \href{https://github.com/cefet-rj-dal/event_datasets}{cefet-rj-dal/event_datasets}
#'     for detailed guidance on using this package and the other datasets available in it.
#'     Labels available? Yes

#' @docType data
#' @usage data(bioenergy)
#' @format A list of time series.
#' @keywords datasets
#'
#' @references 
#' FAO 2024. FAOSTAT Bioenergy, FAO, Rome, Italy.  ; United Nations Statistics Division (UNSD), 2011; International Recommendations for Energy Statistics (IRES). 
#'
#' @source \href{http://www.fao.org/faostat/en/#data/BE}{FAOSTAT Bioenergy Database}
#'
#' @examples
#' data(bioenergy)
#' serie <- bioenergy[[1]]
"bioenergy"

#' @name climate
#' @title FAOSTAT Temperature Change on Land
#' @description
#' Statistics of surface temperature anomalies on land, based on NASA-GISS GISTEMP data.
#' Data Type:	Temperature Anomalies. Category:	Environment. Creation Date	2024.
#'     See \href{https://github.com/cefet-rj-dal/event_datasets}{cefet-rj-dal/event_datasets}
#'     for detailed guidance on using this package and the other datasets available in it.
#'     Labels available? Yes

#' @docType data
#' @usage data(climate)
#' @format A list of time series.
#' @keywords datasets
#'
#' @references
#' FAO, 2024. FAOSTAT Land, Inputs and Sustainability; Climate Change Indicators; 
#' Temperature change on land.
#' GISTEMP Team, 2024: GISS Surface Temperature Analysis. NASA Goddard Institute for Space Studies.
#' Hansen, J. et al., 1981–2019: Multiple foundational studies on global temperature analysis.
#'
#' @source \href{https://data.giss.nasa.gov/gistemp/}{NASA-GISS GISTEMP}
#'
#' @examples
#' data(climate)
#' serie <- climate[[1]]
"climate"

#' @name emissions
#' @title FAOSTAT Emissions Totals
#' @description
#' National and global estimates of greenhouse gas (GHG) emissions.
#' Data Type:	Greenhouse gas emissions. Category:	Environment. Creation Date	2023.
#'     See \href{https://github.com/cefet-rj-dal/event_datasets}{cefet-rj-dal/event_datasets}
#'     for detailed guidance on using this package and the other datasets available in it.
#'     Labels available? Yes
#' @docType data
#' @usage data(emissions)
#' @format A list of time series.
#' @keywords datasets
#'
#' @references
#' FAO, 2023. FAOSTAT Climate Change: Agrifood systems emissions, Emissions Totals. 
#' 
#' IPCC Guidelines and Reports: 1996, 2000, 2006, 2014, 2019.
#'
#' PRIMAP-hist dataset v2.4.2: Gütschow et al., 2023. 
#' 
#'
#' @source 
#' \href{https://www.fao.org/faostat/en/#data/GT}{FAOSTAT Emissions Totals}.
#'
#' @examples
#' data(emissions)
#' serie <- emissions[[1]]
"emissions"

#' @name fertilizers
#' @title FAOSTAT Fertilizers by Nutrient
#' @description
#' Statistics on agricultural use, production, and trade of chemical and mineral fertilizers. 
#' Data Type:	Fertilizers use, production and trade. Category:	Environment. Creation Date	2024.
#'     See \href{https://github.com/cefet-rj-dal/event_datasets}{cefet-rj-dal/event_datasets}
#'     for detailed guidance on using this package and the other datasets available in it.
#'     Labels available? Yes

#' @docType data
#' @usage data(fertilizers)
#' @format A list of time series.
#' @keywords datasets
#'
#' @references
#' FAO, 2024. FAOSTAT: Fertilizers by Nutrient. 
#'
#' FAO & UNSD (2017). System of Environmental-Economic Accounting for Agriculture, Forestry and Fisheries (SEEA AFF).  
#'
#' UNSD (2017). Framework for the Development of Environment Statistics (FDES).  
#'
#' @source \href{https://www.fao.org/faostat/en/#data/RFN}{FAOSTAT Fertilizers by Nutrient}.
#'
#' @examples
#' data(fertilizers)
#' serie <- fertilizers[[1]]
"fertilizers"
