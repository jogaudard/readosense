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
#> # A tibble: 18 × 4
#>    measurement_id  port closing             opening            
#>             <int> <dbl> <dttm>              <dttm>             
#>  1              1     1 2024-12-12 17:08:00 2024-12-12 17:32:08
#>  2              2     2 2024-12-12 17:33:58 2024-12-12 17:58:10
#>  3              3     7 2024-12-12 18:00:08 2024-12-12 18:24:15
#>  4              4     9 2024-12-12 18:26:00 2024-12-12 18:50:17
#>  5              5    11 2024-12-12 18:52:11 2024-12-12 19:16:23
#>  6              6    12 2024-12-12 19:18:12 2024-12-12 19:42:25
#>  7              7     4 2024-12-12 19:44:11 2024-12-12 20:08:24
#>  8              8     3 2024-12-12 20:10:13 2024-12-12 20:34:30
#>  9              9     8 2024-12-12 20:36:19 2024-12-12 21:00:31
#> 10             10    10 2024-12-12 21:02:15 2024-12-12 21:26:35
#> 11             11     1 2024-12-12 21:28:08 2024-12-12 21:52:21
#> 12             12     2 2024-12-12 21:54:09 2024-12-12 22:09:08
#> 13             13     1 2024-12-12 22:07:49 2024-12-12 22:32:02
#> 14             14     2 2024-12-12 22:33:50 2024-12-12 22:58:06
#> 15             15     7 2024-12-12 22:59:59 2024-12-12 23:24:12
#> 16             16     9 2024-12-12 23:25:54 2024-12-12 23:50:14
#> 17             17    11 2024-12-12 23:52:05 2024-12-13 00:16:18
#> 18             18    12 2024-12-13 00:18:07 2024-12-13 00:42:20
```
