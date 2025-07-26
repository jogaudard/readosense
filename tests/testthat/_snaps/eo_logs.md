# logs work

    Code
      str(eo_logs(eo_import_logs(test_path("test_logs/"))), digits.d = 4, width = 100,
      strict.width = "cut")
    Condition
      Warning:
      Use of .data in tidyselect expressions was deprecated in tidyselect 1.2.0.
      i Please use `"epochtime"` instead of `.data$epochtime`
    Output
      tibble [113 x 4] (S3: tbl_df/tbl/data.frame)
       $ measurement_id: int [1:113] 1 2 3 4 5 6 7 8 9 10 ...
       $ port          : num [1:113] 1 2 3 4 7 8 9 2 7 9 ...
       $ closing       : POSIXct[1:113], format: "2024-12-09 21:44:41" "2024-12-09 21:48:48" "2024-12-0"..
       $ opening       : POSIXct[1:113], format: "2024-12-09 21:55:58" "2024-12-09 22:00:05" "2024-12-0"..

