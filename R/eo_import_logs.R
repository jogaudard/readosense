#' imports log files from Eosense chambers
#' @param path folder in which the log files are located
#' @param colnames column names as defined in Eosense documentation
#' @param nb_ports number of ports
#' @param open status numbers indicating chamber is open
#' @param closed status numbers indicating chamber is closed
#' @return a dataframe with all the information from the logs and measurement id
#' @importFrom purrr map_dfr
#' @importFrom readr read_log
#' @importFrom tidyr pivot_longer
#' @importFrom dplyr arrange mutate case_when consecutive_id filter
#' @importFrom lubridate as_datetime
#' @export
#' @examples
#' path <- system.file("extdata/ex_log", package = "readosense")
#' eo_import_logs(path)

eo_import_logs <- function(path,
                           closed = c(1:3),
                           open = 0,
                           fully_closed = 1,
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
    pivot_longer(!c(.data$epochtime), names_to = c(".value", "variable"), names_sep = "_") |>
    filter(
        .data$port %in% seq_along(1:nb_ports) # we filter out all the rows with port -1
    ) |>
    arrange(.data$epochtime) |> # just to be sure
    mutate( # without grouping
        chamber = case_when(
            .data$chamberstatus %in% closed ~ "open",
            .data$chamberstatus == open ~ "closed"
        ),
        change_id = consecutive_id(.data$port, .data$chamberstatus), #detecting if same port but new measurement
        datetime = as_datetime(.data$epochtime) # we work in datetime
    ) |>
    filter(
        .data$chamberstatus == fully_closed
    ) |>
    mutate(
        measurement_id = consecutive_id(.data$change_id) # just getting rid of the missing id after filter
        )
    
    chamber_log_all
                   }
