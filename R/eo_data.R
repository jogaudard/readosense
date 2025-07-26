#' imports data files from Eosense chambers
#' @param path location of the data files
#' @return a dataframe with conitnuous measurement with timestamps
#' @importFrom purrr map
#' @importFrom readr read_table
#' @importFrom dplyr mutate bind_rows select
#' @importFrom lubridate as_datetime
#' @export
#' @examples
#' path <- system.file("extdata/ex_data", package = "readosense")
#' eo_data(path)

eo_data <- function(path) {


  data_read <- list.files(
    path,
    full.names = TRUE
  ) |>
    map(
      read_table,
      show_col_types = FALSE,
      .progress = TRUE
    ) |>
    suppressWarnings() |>
    bind_rows() |>
    select(!"X39")
  # the extra whitespace at the end of the line is read as an NA column

  data <- data_read |>
    mutate(
      f_datetime = as_datetime(.data$EPOCH_TIME)
    )
  data
}
