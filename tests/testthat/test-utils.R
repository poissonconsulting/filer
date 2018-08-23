context("utils")

test_that("file_names", {
  expect_identical(file_names(n = 0), character(0))
  expect_identical(file_names(), "file1.rds")
  expect_identical(file_names(file = "data", ext = ".csv"), "data1..csv")
  expect_identical(file_names(n = 10)[9], "file09.rds")
  expect_identical(length(file_names(n = 101)), 101L)
  expect_identical(file_names(n = 101)[1], "file001.rds")
})
