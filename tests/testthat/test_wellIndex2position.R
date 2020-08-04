library(ribiosUtils)
library(testthat)

test_that("wellIndex2position works for 96-well plates", {
  res96 <- wellIndex2position(1:96, format="96")
  expect_identical(res96$WellIndex, 1:96)
  expect_identical(res96$Row, rep(LETTERS[1:8], each=12))
  expect_identical(res96$Column, rep(1:12, 8))
})

test_that("wellIndex2position works for 384-well plates", {
  res384 <- wellIndex2position(1:384, format="384")
  expect_identical(res384$WellIndex, 1:384)
  expect_identical(res384$Row, rep(LETTERS[1:16], each=24))
  expect_identical(res384$Column, rep(1:24, 16))
})

test_that("wellIndex2position works for NA and out-of-range indices", {
  res96NA <- wellIndex2position(c(0,3,15,25,97,NA), format="96")
  expect_identical(res96NA$Row, c(NA, "A", "B", "C", NA, NA))
  expect_identical(res96NA$Column, c(NA, 3L, 3L, 1L, NA, NA))
  
  res384NA <- wellIndex2position(c(123, 96, NA, -1, 53, 533), format="384")
  expect_identical(res384NA$Row, c("F", "D", NA, NA, "C", NA))
  expect_identical(res384NA$Column, c(3L, 24L, NA, NA, 5L, NA))
})
