test_that("mmatch returns all matching indices in ascending order", {
  result <- mmatch(
    c("A", "B", "C", "T", "B", "S", "Z", NA, "C"),
    c("A", "B", "C", "D", "A", "D", "B", "C", "C", "A")
  )

  expected <- structure(
    list(
      c(1L, 5L, 10L),
      c(2L, 7L),
      c(3L, 8L, 9L),
      NA_integer_,
      c(2L, 7L),
      NA_integer_,
      NA_integer_,
      NA_integer_,
      c(3L, 8L, 9L)
    ),
    names = c("A", "B", "C", "T", "B", "S", "Z", NA, "C")
  )

  expect_identical(result, expected)
})

test_that("mmatch uses nomatch value for unmatched elements", {
  result <- mmatch(
    c("A", "B", "C", "T", "B", "S", "Z", NA, "C"),
    c("A", "B", "C", "D", "A", "D", "B", "C", "C", "A"),
    nomatch = 0L
  )

  expected <- structure(
    list(
      c(1L, 5L, 10L),
      c(2L, 7L),
      c(3L, 8L, 9L),
      0L,
      c(2L, 7L),
      0L,
      0L,
      0L,
      c(3L, 8L, 9L)
    ),
    names = c("A", "B", "C", "T", "B", "S", "Z", NA, "C")
  )

  expect_identical(result, expected)
})

test_that("mmatch preserves names from source vector", {
  namedSources <- c(a = "txt", b = "csv", c = "pdf")
  result <- mmatch(namedSources, c("csv", "pdf", "pdf", "txt", NA))

  expected <- list(txt = 4L, csv = 1L, pdf = 2:3)

  expect_identical(result, expected)
})
