library(ribiosUtils)
library(testthat)

context("Test cbindByRownames")

mat1 <- matrix(1:9, nrow=3, byrow=FALSE,
               dimnames=list(LETTERS[1:3], LETTERS[1:3]))
mat2 <- matrix(1:9, nrow=3, byrow=FALSE,
               dimnames=list(LETTERS[2:4], LETTERS[4:6]))
mat3 <- matrix(1:9, nrow=3, byrow=TRUE,
               dimnames=list(LETTERS[c(2,4,5)], LETTERS[7:9]))

mat123int <- matrix(as.integer(c(2,5,8,1,4,7,1,2,3)), nrow=1,
                    dimnames=list("B", LETTERS[1:9]))
mat123union <- matrix(as.integer(c(1, 4, 7, rep(NA, 6),
                                 2,5, 8, 1, 4, 7, 1, 2, 3,
                                 3, 6, 9, 2, 5, 8, rep(NA,3),
                                 rep(NA, 3), 3, 6, 9, 4, 5, 6,
                                 rep(NA, 6), 7, 8, 9)), 
                      nrow=5, ncol=9, byrow=TRUE,
                    dimnames=list(LETTERS[1:5], LETTERS[1:9]))
test_that("cbindByRownames works with elements", {
  expect_identical(cbindByRownames(mat1, mat2, mat3, type="intersect"),
                   mat123int)
  expect_identical(cbindByRownames(mat1, mat2, mat3, type="union"),
                   mat123union)
})

test_that("cbindByRownames works with a list as input", {
  expect_identical(cbindByRownames(list(mat1, mat2, mat3), type="intersect"),
                   mat123int)
  expect_identical(cbindByRownames(list(mat1, mat2, mat3), type="union"),
                   mat123union)
})

context("Test rbindByColnames")

mat4 <- matrix(1:9, nrow=3, byrow=FALSE,
               dimnames=list(LETTERS[1:3], LETTERS[1:3]))
mat5 <- matrix(1:9, nrow=3, byrow=FALSE,
               dimnames=list(LETTERS[4:6], LETTERS[2:4]))
mat6 <- matrix(1:9, nrow=3, byrow=TRUE,
               dimnames=list(LETTERS[7:9], LETTERS[c(2,4,6)]))
mat456int <- matrix(as.integer(c(4, 5, 6, 1, 2, 3, 1, 4, 7)),
                    dimnames=list(LETTERS[1:9], "B"))
mat456union <- matrix(as.integer(c(1:3, rep(NA, 6),
                                   4:6, 1:3, c(1,4,7),
                                   7:9, 4:6, rep(NA, 3),
                                   rep(NA, 3), 7:9, 2, 5, 8,
                                   rep(NA, 6), seq(3,9,3))),
                      byrow=FALSE, nrow=9, 
                      dimnames=list(LETTERS[1:9], 
                                                 LETTERS[c(1:4, 6)]))
test_that("rbindByColnames works with matrices",  {
  expect_identical(rbindByColnames(mat4, mat5, mat6, type="intersect"),
                   mat456int)
  expect_identical(rbindByColnames(mat4, mat5, mat6,  type="union"),
                   mat456union)
})
test_that("rbindByColnames works with a list",  {
  expect_identical(rbindByColnames(list(mat4, mat5, mat6), type="intersect"),
                   mat456int)
  expect_identical(rbindByColnames(list(mat4, mat5, mat6),  type="union"),
                   mat456union)
})
