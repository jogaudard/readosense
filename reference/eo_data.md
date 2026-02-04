# imports data files from Eosense chambers

imports data files from Eosense chambers

## Usage

``` r
eo_data(path)
```

## Arguments

- path:

  location of the data files

## Value

a dataframe with continuous measurement with timestamps

## Examples

``` r
path <- system.file("extdata/ex_data", package = "readosense")
eo_data(path)
#> # A tibble: 319 × 39
#>    f_datetime          DATE       TIME     FRAC_DAYS_SINCE_JAN1
#>    <dttm>              <date>     <time>                  <dbl>
#>  1 2024-12-12 17:08:00 2024-12-12 09:08:00                 346.
#>  2 2024-12-12 17:08:01 2024-12-12 09:08:00                 346.
#>  3 2024-12-12 17:08:02 2024-12-12 09:08:02                 346.
#>  4 2024-12-12 17:08:03 2024-12-12 09:08:02                 346.
#>  5 2024-12-12 17:08:04 2024-12-12 09:08:04                 346.
#>  6 2024-12-12 17:08:05 2024-12-12 09:08:04                 346.
#>  7 2024-12-12 17:08:06 2024-12-12 09:08:05                 346.
#>  8 2024-12-12 17:08:07 2024-12-12 09:08:07                 346.
#>  9 2024-12-12 17:08:08 2024-12-12 09:08:07                 346.
#> 10 2024-12-12 17:08:09 2024-12-12 09:08:09                 346.
#> # ℹ 309 more rows
#> # ℹ 35 more variables: FRAC_HRS_SINCE_JAN1 <dbl>, JULIAN_DAYS <dbl>,
#> #   EPOCH_TIME <dbl>, ALARM_STATUS <dbl>, INST_STATUS <dbl>,
#> #   CavityPressure <dbl>, CavityTemp <dbl>, DasTemp <dbl>, EtalonTemp <dbl>,
#> #   WarmBoxTemp <dbl>, species <dbl>, MPVPosition <dbl>, OutletValve <dbl>,
#> #   solenoid_valves <dbl>, N2O <dbl>, N2O_30s <dbl>, N2O_1min <dbl>,
#> #   N2O_5min <dbl>, N2O_dry <dbl>, N2O_dry30s <dbl>, N2O_dry1min <dbl>, …
```
