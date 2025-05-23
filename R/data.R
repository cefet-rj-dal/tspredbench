#' @name bioenergy
#' @title FAOSTAT Bioenergy Database
#' @description
#' Bioenergy data from FAOSTAT.
#' Data Type:	Bioenergy consumption and production. Category:	Environment. Creation Date	2024.
#' @docType data
#' @usage data(bioenergy)
#' @format A list of time series.
#' @keywords datasets
#' @references
#' FAO 2024. FAOSTAT Bioenergy, FAO, Rome, Italy.  ; United Nations Statistics Division (UNSD), 2011; International Recommendations for Energy Statistics (IRES).
#' @source \href{http://www.fao.org/faostat/en/#data/BE}{FAOSTAT Bioenergy Database}
#' @import daltoolbox
#' @examples
#' data(bioenergy)
#' serie <- bioenergy[[1]]
#' ts.plot(serie)
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

#' @name gdp
#' @title Gross Domestic Product and Agriculture Value Added (2013–2022)
#' @description
#' Summary of global and regional trends in GDP and agriculture value.
#' Data Type:macroeconomic indicators. Category:	Economy. Creation Date	2024.
#'     See \href{https://github.com/cefet-rj-dal/event_datasets}{cefet-rj-dal/event_datasets}
#'     for detailed guidance on using this package and the other datasets available in it.
#'     Labels available? Yes
#'
#'
#' @docType data
#' @usage data(gdp)
#' @format list of time series.
#' @keywords datasets
#'
#' @references
#' FAO. 2024. Gross domestic product and agriculture value added 2013–2022 – Global and regional trends.
#' FAOSTAT Analytical Briefs, No. 85. Rome. \href{https://doi.org/10.4060/cd0763en}{https://doi.org/10.4060/cd0763en}
#'
#' @source \href{http://www.fao.org/faostat/en/#data/MK}{FAOSTAT Macro Indicators Database}
#'
#' @examples
#' data(gdp)
#' serie <- gdp[[1]]
"gdp"

#' @name pesticides
#' @title Pesticides Use Statistics (1990–2022)
#' @description
#' Statistics on the use of major pesticide groups and relevant chemical families.
#' Data Type: pesticides use. Category:	Environments. Creation Date	2024.
#'     See \href{https://github.com/cefet-rj-dal/event_datasets}{cefet-rj-dal/event_datasets}
#'     for detailed guidance on using this package and the other datasets available in it.
#'     Labels available? Yes
#'
#' @docType data
#' @usage data(pesticides)
#' @format A list of time series.
#' @keywords datasets
#'
#' @references
#' FAO. 2024. FAOSTAT: Pesticides Use. RP_e_README_Domain_Information_2024.
#' \href{http://www.fao.org/faostat/en/#data/RP}{FAOSTAT Pesticides Use Database}
#'
#' @source \href{http://www.fao.org/faostat/en/#data/RP}{http://www.fao.org/faostat/en/#data/RP}
#'
#' @examples
#' data(pesticides)
#' serie <- pesticides[[1]]
"pesticides"

