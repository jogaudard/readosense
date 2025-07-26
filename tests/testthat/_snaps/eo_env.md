# import logs work

    Code
      str(eo_env(eo_import_logs(test_path("test_logs/"))), digits.d = 4, width = 100,
      strict.width = "cut")
    Output
      tibble [3,728 x 3] (S3: tbl_df/tbl/data.frame)
       $ datetime: POSIXct[1:3728], format: "2024-12-12 17:13:00" "2024-12-12 17:13:04" "2024-12-12 17:"..
       $ air_temp: num [1:3728] 6.963 6.963 6.951 6.947 6.936 ...
       $ pressure: num [1:3728] 1.024 1.024 1.024 1.024 1.024 ...

