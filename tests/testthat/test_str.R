library(ribiosUtils)
library(testthat)

expect_identical(ribiosUtils:::shortenStr("ETV"), "ETV")
expect_identical(ribiosUtils:::shortenStr("abcdefgh"), "abcdefgh")
expect_identical(ribiosUtils:::shortenStr("abcdefghijkl"), "abcdefgh...")

expect_identical(ribiosUtils:::fixWidthStr("ETV"), "ETV     ")
expect_identical(ribiosUtils:::fixWidthStr("abcdefgh"), "abcdefgh")
expect_identical(ribiosUtils:::fixWidthStr("abcdefghijkl"),
                 "abcde...")

context("Test firstUp")

testthat::test_that("firstUp works", {
  expect_identical(firstUp("a"), "A")
  expect_identical(firstUp(c("a", "basta", "Cis")), c("A", "Basta", "Cis"))
  expect_identical(firstUp(strsplit('many many years ago', ' ')[[1]]),
		   c("Many", "Many", "Years", "Ago"))
})

context("Test lastChar")

testthat::test_that("lastChar works", {
  expect_identical(lastChar("a"), "a")
  expect_identical(lastChar(c("a", "basta", "Cis")), c("a", "a", "s"))
  expect_identical(lastChar(strsplit('many many years ago', ' ')[[1]]),
		   c("y", "y", "s", "o"))
})
