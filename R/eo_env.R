#' extracts the environmental data from the logs
#' @param logs as provided by \link[readosense:eo_import_logs]{eo_import_logs}
#' @return a dataframe with the datetime, air temperature (celsius), and
#' pressure (atm) for all chambers
#' @importFrom dplyr mutate select
#' @importFrom rlang .data
#' @export
#' @examples
#' path <- system.file("extdata/ex_logs", package = "readosense")
#' eo_import_logs(path) |>
#' eo_env()


eo_env <- function(logs) {

  chamber_temp_pres <- logs |>
    mutate(
      # need to ask the exact conversion factor, for now this one makes sense
      air_temp =
        1 / (
          0.0000000876656 * log((5.0 / (.data$temperaturev / 2150))) - 2150
        )^3
        + 0.000234126
        * log((5.0 / (.data$temperaturev / 2150) - 2150) + 0.001129138),
      pressure = .data$pressure / 101.325 # need atm for fluxible
    ) |>
    select("datetime", "air_temp", "pressure")

  chamber_temp_pres
}
