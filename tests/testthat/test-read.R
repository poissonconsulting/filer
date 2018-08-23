context("read")

test_that("read", {
  dir <- system.file("extdata", package = "filer")
  expect_identical(read_files(dir, .pattern = ".xls"), named_list()) 
  expect_identical(read_files(.dir = paste0(dir, "1")), named_list()) 
  expect_identical(names(read_files(dir)), 
                   c("chickwts.rds", "mtcars.rds", "trees.rds"))
  expect_identical(names(read_files(dir, .recursive = TRUE)), 
                   c("chickwts.rds", "mtcars.rds", "sub/chickwts.rds", "trees.rds"))
  expect_identical(read_files(dir)[[1]], head(datasets::chickwts))
  expect_equivalent(read_files(dir, .pattern = ".csv", .fun = utils::read.csv)[[1]], 
               head(datasets::chickwts))
  expect_warning(read_files(dir, .pattern = ".csv", .silent = TRUE), 
                "1 file failed to read: chickwts.csv")
})
  
