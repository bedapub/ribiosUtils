context("pScore")

testPvals <- c(0.001, 0.01, 0.05, 0.1, 0.5, 1)
testPvalSign <- rep(c(-1,1), 3)
testPvalLogFC <- c(-2, 3, -4, 5, -1.1, 1.2)
testLogical <- rep(c(TRUE, FALSE),3)

test_that("pScore correctly wrapps pAbsLog10Score and pQnormScore", {
  expect_equal(pScore(testPvals, sign=testPvalSign, method="absLog10"),
               pAbsLog10Score(testPvals, sign=testPvalSign))
  expect_equal(pScore(testPvals, sign=testPvalSign, method="qnorm"),
               pQnormScore(testPvals, sign=testPvalSign))
})

test_that("pAbsLog10Score works as expected", {
  expect_equal(pScore(testPvals, method="absLog10"),
               abs(log10(testPvals)))
  expect_equal(pScore(testPvals, sign=testPvalSign, method="absLog10"),
               abs(log10(testPvals))*sign(testPvalSign))
  expect_equal(pScore(testPvals, sign=testPvalLogFC, method="absLog10"),
               abs(log10(testPvals))*sign(testPvalLogFC))
  expect_equal(pScore(testPvals, sign=testLogical, method="absLog10"),
               abs(log10(testPvals))*ifelse(testLogical, 1, -1))
})

## in the code we use the implementation abs(qnorm(1/2)), because 
## it is more stable for small p-values (say p<1E-16)
invGaussianCdf <- function(p) qnorm(1-p/2, lower.tail=TRUE)

test_that("pQnormScore works as expected", {
  expect_equal(pScore(testPvals, method="qnorm"),
               invGaussianCdf(testPvals))
  expect_equal(pScore(testPvals, sign=testPvalSign, method="qnorm"),
               invGaussianCdf(testPvals)*sign(testPvalSign))
  expect_equal(pScore(testPvals, sign=testPvalLogFC, method="qnorm"),
               invGaussianCdf(testPvals)*sign(testPvalLogFC))
  expect_equal(pScore(testPvals, sign=testLogical, method="qnorm"),
               invGaussianCdf(testPvals)*ifelse(testLogical, 1, -1))
})

test_that("pQnormScore works for very small values", {
  expect_equal(pScore(1E-25, method="qnorm"),
               abs(qnorm(1E-25/2)))
})

testPvalsWithZero <- c(0, testPvals, 0)
testPvalsSignWithZero <- c(1, testPvalSign, -1)
minDouble <- .Machine$double.xmin

test_that("pScore works for zero", {
  expect_equal(pScore(testPvalsWithZero, sign=testPvalsSignWithZero, method="absLog10"),
               abs(log10(c(minDouble, testPvals, minDouble)))*sign(testPvalsSignWithZero))
  expect_equal(pScore(testPvalsWithZero, sign=testPvalsSignWithZero, method="qnorm"),
               abs(qnorm(c(minDouble*2, testPvals, minDouble*2)/2))*sign(testPvalsSignWithZero))
})
