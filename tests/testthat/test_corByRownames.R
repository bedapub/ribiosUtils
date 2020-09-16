library(ribiosUtils)
library(testthat)

context("Testing corWithRownames")

set.seed(1887)
myMat1 <- matrix(rnorm(24), nrow=6, byrow=TRUE,
  dimnames=list(sprintf("R%d", 1:6), sprintf("C%d", 1:4)))
myMat2 <- matrix(rnorm(35), nrow=7, byrow=TRUE,
   dimnames=list(sprintf("R%d", 7:1), sprintf("C%d", 1:5)))
cor12 <- corByRownames(myMat1, myMat2)

commonRownames <- sprintf("R%d", 1:6)

test_that("corWithRownames works as expected", {
  expect_identical(commonRownames, attr(cor12, "commonRownames"))
  expect_equivalent(cor12,
                    cor(myMat1[commonRownames,],
                        myMat2[commonRownames,]))
})
