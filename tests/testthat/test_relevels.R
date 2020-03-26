library(testthat)
library(ribiosUtils)

myf <- factor(rep(LETTERS[1:3], each=3), levels=LETTERS[1:3])

myf2 <- relevels(myf, refs=c("A"="B", "C"="B"))
context("relevels")
test_that("relevels works correctly with duplicated levels", {
  expect_equal(levels(myf2), c("B"))
})
