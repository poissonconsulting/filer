context("write")

test_that("write", {
  objects <- list(mtcars = datasets::mtcars, chickwts = datasets::chickwts)  
  dir <- tempdir()
  
  expect_identical(write_files(named_list(), dir), character(0))
  write_files(objects, dir)
})

