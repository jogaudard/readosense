# extracts the measurements metadata from the logs

extracts the measurements metadata from the logs

## Usage

``` r
eo_logs(logs, time_buffer = 300)
```

## Arguments

- logs:

  as provided by
  [eo_import_logs](https://jogaudard.github.io/readosense/reference/eo_import_logs.md)

- time_buffer:

  around the full closure of the chamber in seconds

## Value

a dataframe with the measurement ids, port, and closing and opening time

## Examples

``` r
path <- system.file("extdata/ex_logs", package = "readosense")
eo_import_logs(path) |>
eo_logs()
#> # A tibble: 2 × 4
#>   measurement_id  port closing             opening            
#>            <int> <dbl> <dttm>              <dttm>             
#> 1              1     1 2024-12-12 17:08:00 2024-12-12 17:32:08
#> 2              2     2 2024-12-12 17:33:58 2024-12-12 17:53:10
```
