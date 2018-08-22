context("utils")

test_that("punctuate", {
  expect_identical(punctuate(1:2), "'1' or '2'")
  expect_identical(punctuate(1), "'1'")
  expect_identical(punctuate(character(0)), "''")
  expect_identical(punctuate(1:3, "and"), "'1', '2' and '3'")
})

test_that("plural", {
  expect_identical(plural("door"), "door")
  expect_identical(plural("door", 2), "doors")
})

test_that("file_names", {
  expect_identical(file_names(n = 0), character(0))
  expect_identical(file_names(), "file1.rds")
  expect_identical(file_names(file = "data", ext = ".csv"), "data1..csv")
  expect_identical(file_names(n = 10)[9], "file09.rds")
  expect_identical(length(file_names(n = 101)), 101L)
  expect_identical(file_names(n = 101)[1], "file001.rds")
})
