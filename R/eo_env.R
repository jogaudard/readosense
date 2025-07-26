#' extracts the environmental data from the logs
#' @param logs as provided by \link[readosense:eo_import_log]{eo_import_log}
#' @return a dataframe with the datetime, air temperature (celsius), and
#' pressure (atm) for all chambers
#' @importFrom dplyr mutate select
#' @export
#' @examples
#' path <- system.file("extdata/ex_log", package = "readosense")
#' eo_import_logs(path) |>
#' eo_env()


eo_env <- function(logs) {

  chamber_temp_pres <- logs |>
    mutate(
      # need to ask the exact conversion factor, for now this one makes sense
      air_temp = .data$temperaturev * 15,
      pressure = .data$pressure / 101.325 # need atm for fluxible
    ) |>
    select("datetime", "air_temp", "pressure")

  chamber_temp_pres
}
