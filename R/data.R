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

#' @name m1
#' @title M1 Forecasting Competition Time Series (Quarterly)
#' @description
#' 
#' This dataset contains 203 quarterly time series used in the M1 forecasting competition.
#' The series span multiple domains, including macroeconomics, microeconomics, industry, and demographics.
#' Each series is labeled and begins at a specific timestamp, with varying lengths.
#' Some series contain synthetic date placeholders (e.g., 00-01) due to missing original values.
#'
#' Key features:
#' - Frequency: Quarterly
#' - Number of series: 203
#' - Domains: Macro 1, Macro 2, Micro 1, Micro 2, Micro 3, Industry, Demographic
#' - Each time series is labeled (e.g., T1, T2, ...)
#' - Data used in time series forecasting benchmarks
#'
#' Notes:
#' - For three series (T36, T37, T42), the year/month were partially missing and filled with '00-01'.
#' - Series are not of equal length.
#'
#' @docType data
#' @usage data(m1)
#' @format A list of time series
#' @keywords datasets time-series forecasting
#'
#' @references 
#' Makridakis, S. et al. (1982). The accuracy of extrapolation (time series) methods:
#' Results of a forecasting competition. *Journal of Forecasting*, 1(2), 111–153.
#'
#' @source \href{https://www.spotseven.de/gecco/gecco-challenge}{Gecco Challenge 2018}
#'
#' @examples
#' data(m1)
#' head(m1[[1]])
#' ts.plot(m1[[1]]$values)
"m1"

#' @name m3
#' @title M3 Forecasting Competition Time Series (Quarterly)
#' @description 
#' This dataset contains 756 quarterly time series used in the M3 forecasting competition.
#' The series belong to five domains: demographic, micro, macro, industry, and finance.
#' Each series includes a start timestamp and a sequence of numeric values, typically representing economic or industrial indicators.
#'
#' Key features:
#' - Frequency: Quarterly
#' - Number of series: 756
#' - Domains: Demographic, Micro, Macro, Industry, Finance
#' - Each time series is labeled (e.g., T1, T2, ...)
#' - Data used in time series forecasting benchmarks
#'
#' Notes:
#' - The time series start in various years and quarters.
#' - Series vary in length and are not necessarily of equal size.
#'
#' @docType data
#' @usage data(m3)
#' @format A list or data.frame containing:
#' \describe{
#'   \item{series_name}{Name of the time series (e.g., T1, T2, ...)}
#'   \item{start_timestamp}{Starting date of the series (format: yyyy-mm-dd)}
#'   \item{values}{A numeric vector of observations}
#' }
#' @keywords datasets time-series forecasting
#'
#' @references 
#' Makridakis, S. and Hibon, M. (2000). The M3-Competition: Results, Conclusions and Implications. 
#' *International Journal of Forecasting*, 16(4), 451–476.
#'
#' @source \href{https://forecasters.org/resources/time-series-data/m3-competition/}{M3 Forecasting Competition}
#'
#' @examples
#' data(m3)
#' head(m3[[1]])
#' ts.plot(m3[[1]]$values)
"m3"

#' @name m4
#' @title M4 Forecasting Competition Dataset
#' @description 
#' O conjunto de dados da competição M4 contém 100.000 séries temporais reais, abrangendo seis frequências: anual, trimestral, mensal, semanal, diária e horária. As séries são categorizadas em seis domínios: Micro, Indústria, Macro, Finanças, Demografia e Outros. Cada série inclui um identificador único, frequência, data de início, horizonte de previsão e valores históricos.
#'
#' Características principais:
#' - Frequências: Anual, Trimestral, Mensal, Semanal, Diária, Horária
#' - Domínios: Micro, Indústria, Macro, Finanças, Demografia, Outros
#' - Total de séries: 100.000
#' - Horizonte de previsão varia conforme a frequência da série
#'
#' @docType data
#' @usage data(m4)
#' @format Um data.frame com as seguintes colunas:
#' \describe{
#'   \item{M4id}{Identificador único da série}
#'   \item{Frequency}{Frequência da série (e.g., "Yearly", "Quarterly")}
#'   \item{StartingDate}{Data de início da série}
#'   \item{Horizon}{Número de períodos a serem previstos}
#'   \item{Domain}{Domínio da série (e.g., "Macro", "Finance")}
#'   \item{Values}{Vetor numérico com os valores históricos da série}
#' }
#' @keywords datasets time-series forecasting
#'
#' @references 
#' Makridakis, S., Spiliotis, E., & Assimakopoulos, V. (2020). The M4 Competition: 100,000 time series and 61 forecasting methods. *International Journal of Forecasting*, 36(1), 54–74.
#'
#' @source \href{https://github.com/Mcompetitions/M4-methods}{Repositório M4-methods no GitHub}
#'
#' @examples
#' data(m4)
#' head(m4)
#' plot(ts(m4$Values[[1]], frequency = 12))
"m4"

