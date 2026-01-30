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
#> # A tibble: 28,864 × 39
#>    DATE       TIME     FRAC_DAYS_SINCE_JAN1 FRAC_HRS_SINCE_JAN1 JULIAN_DAYS
#>    <date>     <time>                  <dbl>               <dbl>       <dbl>
#>  1 2024-12-12 08:56:26                 346.               8313.        347.
#>  2 2024-12-12 08:56:28                 346.               8313.        347.
#>  3 2024-12-12 08:56:29                 346.               8313.        347.
#>  4 2024-12-12 08:56:29                 346.               8313.        347.
#>  5 2024-12-12 08:56:31                 346.               8313.        347.
#>  6 2024-12-12 08:56:31                 346.               8313.        347.
#>  7 2024-12-12 08:56:33                 346.               8313.        347.
#>  8 2024-12-12 08:56:33                 346.               8313.        347.
#>  9 2024-12-12 08:56:35                 346.               8313.        347.
#> 10 2024-12-12 08:56:36                 346.               8313.        347.
#> # ℹ 28,854 more rows
#> # ℹ 34 more variables: EPOCH_TIME <dbl>, ALARM_STATUS <dbl>, INST_STATUS <dbl>,
#> #   CavityPressure <dbl>, CavityTemp <dbl>, DasTemp <dbl>, EtalonTemp <dbl>,
#> #   WarmBoxTemp <dbl>, species <dbl>, MPVPosition <dbl>, OutletValve <dbl>,
#> #   solenoid_valves <dbl>, N2O <dbl>, N2O_30s <dbl>, N2O_1min <dbl>,
#> #   N2O_5min <dbl>, N2O_dry <dbl>, N2O_dry30s <dbl>, N2O_dry1min <dbl>,
#> #   N2O_dry5min <dbl>, CO2 <dbl>, CO2_dry <dbl>, CH4 <dbl>, CH4_dry <dbl>, …
```
