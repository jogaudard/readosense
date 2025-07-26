#' extracts the measurements metadata from the logs
#' @param logs as provided by \link[readosense:eo_import_log]{eo_import_log}
#' @param buffer around the full closure of the chamber in seconds
#' @importFrom dplyr select distinct mutate
#' @export
#' @examples 

eo_log <- function(logs,
                   time_buffer = 300) {
    
chamber_log <- logs |>
    mutate(
        .by = c(measurement_id),
        closing = min(datetime) - time_buffer, # can be recut in flux_fitting, but so we see better
        opening = max(datetime) + time_buffer
    ) |>
    select(measurement_id, port, closing, opening) |>
    distinct()


chamber_log
                   }
