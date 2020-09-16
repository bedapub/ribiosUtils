library(ribiosUtils)
library(testthat)

context("Testing removeRowsWithNA and removeColumnsWithNA")

myMat <- matrix(c(1:9, NA, 10:17), nrow=6, byrow=TRUE,
 dimnames=list(sprintf("R%d", 1:6), sprintf("C%d", 1:3)))
myMatWoNARows <- myMat[c(1:3,5:6),]
myMatWoNACols <- myMat[,2:3]
 
test_that("removeRowsWithNA works as expected", {
  expect_identical(removeRowsWithNA(myMat), myMatWoNARows)
})

test_that("removeColumnsWithNA works as expected", {
  expect_identical(removeColumnsWithNA(myMat), myMatWoNACols)
})
