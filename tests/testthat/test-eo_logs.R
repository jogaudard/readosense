test_that("logs work", {
  expect_snapshot(
    eo_import_logs(test_path("test_logs/")) |>
      eo_logs() |>
      str(digits.d = 4, width = 100, strict.width = "cut")
  )
})
