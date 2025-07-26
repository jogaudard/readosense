#' extracts the environmental data from the logs
#' @param logs as provided by \link[readosense:eo_import_log]{eo_import_log}
#' @return a dataframe with the datetime, air temperature (celsius), and
#' pressure (atm) for all chambers
#' @importFrom dplyr mutate select
#' @export
#' @examples 


eo_env <- function(logs) {

chamber_temp_pres <- chamber_log_all |>
    mutate(
        air_temp = temperaturev * 15, # need to ask the exact conversion factor, for now this one makes sense
        pressure = pressure / 101.325 # need atm for fluxible
    ) |>
    select(datetime, air_temp, pressure)
}
