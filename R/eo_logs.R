#' extracts the measurements metadata from the logs
#' @param logs as provided by \link[readosense:eo_import_logs]{eo_import_logs}
#' @param time_buffer around the full closure of the chamber in seconds
#' @return a dataframe with the measurement ids, port, and closing and opening
#' time
#' @importFrom dplyr select distinct mutate
#' @importFrom rlang .data
#' @export
#' @examples
#' path <- system.file("extdata/ex_logs", package = "readosense")
#' eo_import_logs(path) |>
#' eo_logs()

eo_logs <- function(logs,
                    time_buffer = 300) {

  chamber_logs <- logs |>
    mutate(
      .by = "measurement_id",
      closing = min(.data$datetime) - time_buffer,
      opening = max(.data$datetime) + time_buffer
    ) |>
    select("measurement_id", "port", "closing", "opening") |>
    distinct()


  chamber_logs
}
