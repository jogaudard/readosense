# logs work

    Code
      str(eo_logs(eo_import_logs(test_path("test_logs/"))), digits.d = 4, width = 100,
      strict.width = "cut")
    Output
      tibble [18 x 4] (S3: tbl_df/tbl/data.frame)
       $ measurement_id: int [1:18] 1 2 3 4 5 6 7 8 9 10 ...
       $ port          : num [1:18] 1 2 7 9 11 12 4 3 8 10 ...
       $ closing       : POSIXct[1:18], format: "2024-12-12 17:08:00" "2024-12-12 17:33:58" "2024-12-12"..
       $ opening       : POSIXct[1:18], format: "2024-12-12 17:32:08" "2024-12-12 17:58:10" "2024-12-12"..

