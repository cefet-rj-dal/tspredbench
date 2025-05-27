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
#' @docType data
#' @usage data(climate)
#' @format A list of time series.
#' @keywords datasets
#' @references
#' FAO, 2024. FAOSTAT Land, Inputs and Sustainability; Climate Change Indicators;
#' Temperature change on land.
#' GISTEMP Team, 2024: GISS Surface Temperature Analysis. NASA Goddard Institute for Space Studies.
#' Hansen, J. et al., 1981–2019: Multiple foundational studies on global temperature analysis.
#' @source \href{https://data.giss.nasa.gov/gistemp/}{NASA-GISS GISTEMP}
#' @import daltoolbox
#' @examples
#' data(climate)
#' serie <- climate[[1]]
#' ts.plot(serie)
"climate"

#' @name emissions
#' @title FAOSTAT Emissions Totals
#' @description
#' National and global estimates of greenhouse gas (GHG) emissions.
#' Data Type:	Greenhouse gas emissions. Category:	Environment. Creation Date	2023.
#' @docType data
#' @usage data(emissions)
#' @format A list of time series.
#' @keywords datasets
#' @references
#' FAO, 2023. FAOSTAT Climate Change: Agrifood systems emissions, Emissions Totals.
#' IPCC Guidelines and Reports: 1996, 2000, 2006, 2014, 2019.
#' PRIMAP-hist dataset v2.4.2: Gütschow et al., 2023.
#' @source
#' \href{https://www.fao.org/faostat/en/#data/GT}{FAOSTAT Emissions Totals}.
#' @import daltoolbox
#' @examples
#' data(emissions)
#' serie <- emissions[[1]]
#' ts.plot(serie)
"emissions"

#' @name fertilizers
#' @title FAOSTAT Fertilizers by Nutrient
#' @description
#' Statistics on agricultural use, production, and trade of chemical and mineral fertilizers.
#' Data Type:	Fertilizers use, production and trade. Category:	Environment. Creation Date	2024.
#' @docType data
#' @usage data(fertilizers)
#' @format A list of time series.
#' @keywords datasets
#' @references
#' FAO, 2024. FAOSTAT: Fertilizers by Nutrient.
#' FAO & UNSD (2017). System of Environmental-Economic Accounting for Agriculture, Forestry and Fisheries (SEEA AFF).
#' UNSD (2017). Framework for the Development of Environment Statistics (FDES).
#' @source \href{https://www.fao.org/faostat/en/#data/RFN}{FAOSTAT Fertilizers by Nutrient}.
#' @import daltoolbox
#' @examples
#' data(fertilizers)
#' serie <- fertilizers[[1]]
#' ts.plot(serie)
"fertilizers"

#' @name gdp
#' @title Gross Domestic Product and Agriculture Value Added (2013–2022)
#' @description
#' Summary of global and regional trends in GDP and agriculture value.
#' Data Type: macroeconomic indicators. Category:	Economy. Creation Date	2024.
#' @docType data
#' @usage data(gdp)
#' @format list of time series.
#' @keywords datasets
#' @references
#' FAO. 2024. Gross domestic product and agriculture value added 2013–2022 – Global and regional trends.
#' FAOSTAT Analytical Briefs, No. 85. Rome. \href{https://doi.org/10.4060/cd0763en}{https://doi.org/10.4060/cd0763en}
#' @source \href{http://www.fao.org/faostat/en/#data/MK}{FAOSTAT Macro Indicators Database}
#' @import daltoolbox
#' @examples
#' data(gdp)
#' serie <- gdp[[1]]
#' ts.plot(serie)
"gdp"

#' @name gecco
#' @title Gecco Challenge 2018
#' @description
#' Data collection for water quality monitoring.
#' Data Type:	Water quality. Category:	Environment. Creation Date	2018.
#' @docType data
#' @usage data(gecco)
#' @format A list of time series.
#' @keywords datasets
#' @references
#' Genetic and Evolutionary Computation Conference (Gecco), Association for Computing Machinery (ACM)
#' @source \href{https://www.spotseven.de/gecco/gecco-challenge}{Gecco Challenge 2018}
#' @import daltoolbox
#' @examples
#' data(gecco)
#' serie <- gecco[[1]]
#' ts.plot(serie)
"gecco"

#' @name M1
#' @title M1 Competition Time Series
#' @description
#' Time series data from the first Makridakis forecasting competition (M1), held in 1982.  
#' Data Type: Forecasting benchmark dataset. Category: Forecasting. Creation Date: 1982.
#' @docType data
#' @usage data(M1)
#' @format A list of time series.
#' @keywords datasets
#' @references
#' Makridakis et al. (1982). The accuracy of extrapolation (time series) methods: Results of a forecasting competition. Journal of Forecasting, 1(2), 111–153.
#' @source \href{https://onlinelibrary.wiley.com/doi/10.1002/for.3980010202}{The accuracy of extrapolation (time series) methods: Results of a forecasting competition}
#' @import daltoolbox
#' @examples
#' data(M1)
#' serie <- M1[[1]]
#' ts.plot(serie)
"M1"

#' @name M3
#' @title M3 Competition Time Series
#' @description
#' Time series data from the third Makridakis forecasting competition (M3), held in 2000.  
#' Data Type: Forecasting benchmark dataset. Category: Forecasting. Creation Date: 2000.
#' @docType data
#' @usage data(M3)
#' @format A list of time series.
#' @keywords datasets
#' @references
#' Makridakis and Hibon (2000). The M3-Competition: Results, conclusions and implications. International Journal of Forecasting, 16(4), 451–476.
#' @source \href{https://www.sciencedirect.com/science/article/abs/pii/S0169207000000571?via%3Dihub}{The M3-Competition: results, conclusions and implications}
#' @import daltoolbox
#' @examples
#' data(M3)
#' serie <- M3[[1]]
#' ts.plot(serie)
"M3"

#' @name M4
#' @title M4 Competition Time Series
#' @description
#' Time series data from the fourth Makridakis forecasting competition (M4), held in 2018.  
#' Data Type: Forecasting benchmark dataset. Category: Forecasting. Creation Date: 2018.
#' @docType data
#' @usage data(M4)
#' @format A list of time series.
#' @keywords datasets
#' @references
#' Makridakis et al. (2020). The M4 Competition: Results, findings, conclusion and way forward. International Journal of Forecasting, 36(1), 54–74.
#' @source \href{https://github.com/Mcompetitions/M4-methods}{M4 Competition - GitHub}
#' @import daltoolbox
#' @examples
#' data(M4)
#' serie <- M4[[1]]
#' ts.plot(serie)
"M4"

#' @name pesticides
#' @title Pesticides Use Statistics (1990–2022)
#' @description
#' Statistics on the use of major pesticide groups and relevant chemical families.
#' Data Type: pesticides use. Category:	Environments. Creation Date	2024.
#' @docType data
#' @usage data(pesticides)
#' @format A list of time series.
#' @keywords datasets
#' @references
#' FAO. 2024. FAOSTAT: Pesticides Use. RP_e_README_Domain_Information_2024.
#' \href{http://www.fao.org/faostat/en/#data/RP}{FAOSTAT Pesticides Use Database}
#' @source \href{http://www.fao.org/faostat/en/#data/RP}{http://www.fao.org/faostat/en/#data/RP}
#' @import daltoolbox
#' @examples
#' data(pesticides)
#' serie <- pesticides[[1]]
#' ts.plot(serie)
"pesticides"