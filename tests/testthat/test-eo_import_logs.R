test_that("import logs work", {
   expect_snapshot(
    eo_import_logs(test_path("test_log/"))
      # str(digits.d = 4, width = 100, strict.width = "cut")
  )
})


