
<!-- README.md is generated from README.Rmd. Please edit that file -->

# A Benchmark Time Series Dataset Collection for Prediction Models powered by DAL

<!-- badges: start -->

![GitHub Repo stars](https://github.com/cefet-rj-dal/tspredbench)
<!-- badges: end -->

The `tspredbench`, developed by the Data Analytics Lab (DAL), is a
curated repository of time series datasets designed to support the
development, testing, and benchmarking of prediction models.  
The package gathers datasets from diverse domains—such as bioenergy,
climate, economy, and international competitions (M1–M4)—into a unified
and structured format, promoting reproducibility and comparative
evaluation of forecasting methods. While the datasets can be accessed
through raw files, it is recommended to use them via this R package,
following the usage guidelines provided below.

------------------------------------------------------------------------

## Dataset Description

Full dataset description is available at:
<https://github.com/cefet-rj-dal/tspredbench/wiki>

------------------------------------------------------------------------

## Examples

Usage: <https://github.com/cefet-rj-dal/tspredbench/tree/main/examples/>

The examples are organized according to available datasets.

``` r
library(tspredbench)
```

------------------------------------------------------------------------

## Installation

You can install the published version of tspredbench package from GitHub
<https://github.com/cefet-rj-dal/tspredbench> with:

``` r
timeout <- options()$timeout
options(timeout=1200)
devtools::install_github("cefet-rj-dal/tspredbench", upgrade="never")
options(timeout=timeout)
```

## Bugs and new features request

<https://github.com/cefet-rj-dal/tspredbench/issues>
