#' extracts the environmental data from the logs
#' 
#' 


# We make a separate df for temp and pressure so we keep the 4 seconds reads
chamber_temp_pres <- chamber_log_all |>
    mutate(
        air_temp = temperaturev * 15, # need to ask the exact conversion factor, for now this one makes sense
        pressure = pressure / 101.325 # need atm for fluxible
    ) |>
    select(datetime, air_temp, pressure)

