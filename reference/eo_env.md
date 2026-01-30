# extracts the environmental data from the logs

extracts the environmental data from the logs

## Usage

``` r
eo_env(logs)
```

## Arguments

- logs:

  as provided by
  [eo_import_logs](https://jogaudard.github.io/readosense/reference/eo_import_logs.md)

## Value

a dataframe with the datetime, air temperature (celsius), and pressure
(atm) for all chambers

## Examples

``` r
path <- system.file("extdata/ex_logs", package = "readosense")
eo_import_logs(path) |>
eo_env()
#> # A tibble: 3,728 × 3
#>    datetime            air_temp pressure
#>    <dttm>                 <dbl>    <dbl>
#>  1 2024-12-12 17:13:00  0.00233     1.02
#>  2 2024-12-12 17:13:04  0.00233     1.02
#>  3 2024-12-12 17:13:08  0.00233     1.02
#>  4 2024-12-12 17:13:12  0.00233     1.02
#>  5 2024-12-12 17:13:16  0.00233     1.02
#>  6 2024-12-12 17:13:20  0.00233     1.02
#>  7 2024-12-12 17:13:24  0.00233     1.02
#>  8 2024-12-12 17:13:28  0.00233     1.02
#>  9 2024-12-12 17:13:32  0.00233     1.02
#> 10 2024-12-12 17:13:36  0.00233     1.02
#> # ℹ 3,718 more rows
```
