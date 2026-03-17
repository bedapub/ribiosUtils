library(testthat)
library(ribiosUtils)

context("createRmdTemplate")

test_that("createRmdTemplate copies the skeleton file with a custom name", {
  dest <- file.path(tempdir(), "test_skeleton.Rmd")
  on.exit(unlink(dest))
  result <- createRmdTemplate(dest)
  expect_true(file.exists(dest))
  expect_equal(result, dest)
})

test_that("createRmdTemplate uses default filename when none given", {
  old_wd <- setwd(tempdir())
  on.exit(setwd(old_wd))
  result <- createRmdTemplate()
  on.exit(unlink(result), add = TRUE)
  expect_true(file.exists(result))
  expect_true(grepl("^Report_.*-report\\.Rmd$", basename(result)))
})

test_that("createRmdTemplate refuses to overwrite by default", {
  dest <- file.path(tempdir(), "test_no_overwrite.Rmd")
  on.exit(unlink(dest))
  createRmdTemplate(dest)
  expect_error(createRmdTemplate(dest), "already exists")
})

test_that("createRmdTemplate overwrites when overwrite=TRUE", {
  dest <- file.path(tempdir(), "test_overwrite.Rmd")
  on.exit(unlink(dest))
  createRmdTemplate(dest)
  expect_message(createRmdTemplate(dest, overwrite = TRUE), "Skeleton file copied")
  expect_true(file.exists(dest))
})
