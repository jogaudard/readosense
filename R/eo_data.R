#' imports data files from Eosense chambers
#' @param path location of the data files
#' @param date_col column with the date
#' @param time_col column with the time
#' @return a dataframe with conitnuous measurement with timestamps
#' @importFrom purrr map
#' @importFrom readr read_table
#' @importFrom dplyr mutate
#' @importFrom lubridate as_datetime
#' @export
#' @examples
#' path <- system.file("extdata/ex_data", package = "readosense")
#' eo_data(path)

eo_data <- function(path,
                    date_col,
                    time_col) {

  data_read <- list.files(
    path,
    full.names = TRUE
  ) |>
    map(
      read_table,
      .progress = TRUE
    )

  data <- data_read |>
    mutate(
      f_datetime = as_datetime(paste({{date_col}}, {{time_col}}))
    )
  data
}
