#' imports log file from Eosense chambers
#' @param path folder in which the log files are located
#' @param colnames column names as defined in Eosense documentation
#' @param nb_ports number of ports
#' @importFrom purrr map_dfr
#' @importFrom readr read_log


eo_log <- function(path,
                   colnames = c(
                     "port", "valvestatus", "chamberstatus",
                     "aux1", "aux2", "aux3", "aux4", "aux5",
                     "temperaturev", "pressure"
                   ),
                   nb_ports = 12) {


# building col names
log_colnames <- c(
    "epochtime",
    rep(colnames, times = nb_ports)
)

chamber_log_read <- list.files(
    path = path,
    full.names = TRUE
) |>
    map_dfr(
        read_log,
        col_names = log_colnames
    )

# repeated colnames are normal
chamber_log_all <- chamber_log_read |>
    pivot_longer(!c(epochtime), names_to = c(".value", "variable"), names_sep = "_") |>
    filter(
        port %in% c(1:12) # we filter out all the rows with port -1
    ) |>
    arrange(epochtime) |> # just to be sure
    mutate( # without grouping
        chamber = case_when(
            chamberstatus %in% c(1:3) ~ "open",
            chamberstatus == 0 ~ "closed"
        ),
        change_id = consecutive_id(port, chamberstatus), #detecting if same port but new measurement
        datetime = as_datetime(epochtime) # we work in datetime
    ) |>
    filter(
        # chamberstatus %in% c(1:3) # very conservative, we can adjust the focus window later in flux_fitting
        chamberstatus == 1
        # valvestatus == 10
    ) |>
    mutate(
        measurement_id = consecutive_id(change_id) # just getting rid of the missing id after filter
        )
    
chamber_log <- chamber_log_all |>
    mutate(
        .by = c(measurement_id),
        closing = min(datetime) - 300, # can be recut in flux_fitting, but so we see better
        opening = max(datetime) + 300
    ) |>
    select(measurement_id, port, closing, opening) |>
    distinct()

# We make a separate df for temp and pressure so we keep the 4 seconds reads
chamber_temp_pres <- chamber_log_all |>
    mutate(
        air_temp = temperaturev * 15, # need to ask the exact conversion factor, for now this one makes sense
        pressure = pressure / 101.325 # need atm for fluxible
    ) |>
    select(datetime, air_temp, pressure)

                   }
