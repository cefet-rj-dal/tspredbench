% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{m1}
\alias{m1}
\title{M1 Competition Time Series}
\format{
A list of dataframes containing time series.
}
\source{
\href{https://onlinelibrary.wiley.com/doi/10.1002/for.3980010202}{The accuracy of extrapolation (time series) methods: Results of a forecasting competition}
}
\usage{
data(m1)
}
\description{
Time series data from the first Makridakis forecasting competition (M1), held in 1982.
Data Type: Forecasting benchmark dataset. Category: Forecasting. Creation Date: 1982.
}
\examples{
data(m1)
serie <- m1[[1]]
ts.plot(serie)
}
\references{
Makridakis et al. (1982). The accuracy of extrapolation (time series) methods: Results of a forecasting competition. Journal of Forecasting, 1(2), 111–153.
}
\keyword{datasets}
