library(testthat)
library(ribiosUtils)

context("Testing equateWellLabelWidth")

test_that("equateWellLabelWidth works", {
    expect_identical(equateWellLabelWidth("A1"), "A1")
    expect_identical(equateWellLabelWidth(c("A1", "C2")),
		     c("A1", "C2"))
    expect_identical(equateWellLabelWidth(c("A1", "C2", "E12", "F8", "G11")),
		     c("A01", "C02", "E12", "F08", "G11"))
})

