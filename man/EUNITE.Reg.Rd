% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{EUNITE.Reg}
\alias{EUNITE.Reg}
\title{EUNITE Competition – Regressors for Load Forecasting}
\format{
A data frame with 730 rows and 3 columns:
\describe{
\item{Holiday}{Binary indicator (1 = holiday, 0 = regular day).}
\item{Weekday}{Integer encoding (1 = Sunday, ..., 7 = Saturday).}
\item{split}{Split into train and test}
}
}
\source{
\href{http://www.eunite.org/knowledge/Competitions/1st_competition/1st_competition.htm}{EUNITE Competition – Electricity Load Forecasting}
}
\usage{
data(EUNITE.Reg)
}
\description{
Daily holiday and weekday indicators used as regressors in the EUNITE load forecasting competition.
Data Type: Categorical indicators. Category: Benchmark. Observations: 730 (1997–1998).
This dataset provides binary holiday flags and weekday identifiers to support the prediction of daily maximum electrical loads.
It complements the datasets \code{\link{EUNITE.Loads}} and \code{\link{EUNITE.Temp}}.
A test set with corresponding regressors for January 1999 is available.
}
\examples{
data(EUNITE.Reg)
head(EUNITE.Reg)
}
\references{
Chen, B.-J., Chang, M.-W., & Lin, C.-J. (2004). \emph{Load forecasting using support vector machines: a study on EUNITE competition 2001}. IEEE Transactions on Power Systems, 19(4), 1821‑1830.
}
\keyword{benchmark}
\keyword{datasets}
