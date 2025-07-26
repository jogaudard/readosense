#' extracts the measurements metadata from the logs
    
chamber_log <- chamber_log_all |>
    mutate(
        .by = c(measurement_id),
        closing = min(datetime) - time_buffer, # can be recut in flux_fitting, but so we see better
        opening = max(datetime) + time_buffer
    ) |>
    select(measurement_id, port, closing, opening) |>
    distinct()



                   }
