debug(eo_import_logs)

eo_import_logs("inst/extdata/ex_logs")

seq_nb_ports <- seq_along(1:nb_ports)

paste(colnames, seq_nb_ports)

rep(seq_nb_ports, each = length(colnames))

debug(eo_data)
eo_data("inst/extdata/ex_data")

read_table("inst/extdata/ex_data/JFAADS2294-20241211-163854-DataLog_User.dat") |> View()
