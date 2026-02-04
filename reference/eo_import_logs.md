# imports log files from Eosense chambers

imports log files from Eosense chambers

## Usage

``` r
eo_import_logs(
  path,
  closed = c(1:3),
  open = 0,
  fully_closed = 1,
  colnames = c("port", "valvestatus", "chamberstatus", "aux1", "aux2", "aux3", "aux4",
    "aux5", "temperaturev", "pressure"),
  nb_ports = 12
)
```

## Arguments

- path:

  folder in which the log files are located

- closed:

  status numbers indicating chamber is closed

- open:

  status numbers indicating chamber is open

- fully_closed:

  status number indicating the chamber is fully closed

- colnames:

  column names as defined in Eosense documentation

- nb_ports:

  number of ports

## Value

a dataframe with all the information from the logs and measurement id

## Examples

``` r
path <- system.file("extdata/ex_logs", package = "readosense")
eo_import_logs(path)
#> # A tibble: 352 × 15
#>     epochtime  port valvestatus chamberstatus  aux1  aux2   aux3  aux4  aux5
#>         <dbl> <dbl>       <dbl>         <dbl> <dbl> <dbl>  <dbl> <dbl> <dbl>
#>  1 1734023580     1          10             1 2426.     5 0.0259     0     0
#>  2 1734023584     1          10             1 2426.     5 0.0260     0     0
#>  3 1734023588     1          10             1 2426.     5 0.0260     0     0
#>  4 1734023592     1          10             1 2426.     5 0.0259     0     0
#>  5 1734023596     1          10             1 2426.     5 0.0264     0     0
#>  6 1734023600     1          10             1 2426.     5 0.0261     0     0
#>  7 1734023604     1          10             1 2426.     5 0.0266     0     0
#>  8 1734023608     1          10             1 2426.     5 0.0260     0     0
#>  9 1734023612     1          10             1 2426.     5 0.0262     0     0
#> 10 1734023616     1          10             1 2426.     5 0.0253     0     0
#> # ℹ 342 more rows
#> # ℹ 6 more variables: temperaturev <dbl>, pressure <dbl>, chamber <chr>,
#> #   change_id <int>, datetime <dttm>, measurement_id <int>
```
