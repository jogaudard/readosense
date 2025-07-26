# import logs work

    Code
      str(eo_env(eo_import_logs(test_path("test_logs/"))), digits.d = 4, width = 100,
      strict.width = "cut")
    Output
      tibble [22,555 x 3] (S3: tbl_df/tbl/data.frame)
       $ datetime: POSIXct[1:22555], format: "2024-12-09 21:49:41" "2024-12-09 21:49:42" "2024-12-09 21"..
       $ air_temp: num [1:22555] 9.418 9.426 9.396 9.405 9.397 ...
       $ pressure: num [1:22555] 1.013 1.013 1.013 1.013 1.013 ...

