context("utils")

test_that("punctuate", {
  expect_identical(punctuate(1:2), "'1' or '2'")
  expect_identical(punctuate(1), "'1'")
  expect_identical(punctuate(character(0)), "''")
  expect_identical(punctuate(1:3, "and"), "'1', '2' and '3'")
})

test_that("door", {
  expect_identical(plural("door"), "door")
  expect_identical(plural("door", 2), "doors")
})
