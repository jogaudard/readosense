
<!-- README.md is generated from README.Rmd. Please edit that file -->

# readosense

<!-- badges: start -->

[![R-CMD-check](https://github.com/jogaudard/readosense/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jogaudard/readosense/actions/workflows/R-CMD-check.yaml)
[![LifeCycle](https://img.shields.io/badge/lifecycle-experimental-orange)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The readosense R package provides an easy way to import raw files from
[Eosense](https://eosense.com/) ecosystem gas flux chambers as R objects
that can be used with the
[Fluxible](https://plant-functional-trait-course.github.io/fluxible/)
package.

## Installation

You can install the development version of readosense from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("jogaudard/readosense")
```

## Workflow

### Importing the log files

``` r
library(readosense)

# this step is not needed if you know where your data are
path_logs <- system.file("extdata/ex_logs", package = "readosense")

logs <- eo_import_logs(path_logs)

chamber_log <- eo_logs(logs)

env_variables <- eo_env(logs)
```

Doing so, the function `eo_import_logs` is run only once, which is
faster.

### Importing the data files

``` r

# this step is not needed if you know where your data are
path_data <- system.file("extdata/ex_data", package = "readosense")

data <- eo_data(path_data)


# it is more practical to join the environmental data here

library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

data <- data |>
  left_join(env_variables, by = join_by(f_datetime == datetime))
```

### Using fluxible

The first step of the fluxible workflow would then look like this:

``` r
library(fluxible)

conc <- flux_match(
  raw_conc = data,
  field_record = chamber_log,
  f_datetime = f_datetime,
  start_col = closing,
  end_col = opening,
  fixed_length = FALSE
)
```
