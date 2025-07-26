debug(eo_import_logs)

eo_import_logs("inst/extdata/ex_logs")

seq_nb_ports <- seq_along(1:nb_ports)

paste(colnames, seq_nb_ports)

rep(seq_nb_ports, each = length(colnames))
