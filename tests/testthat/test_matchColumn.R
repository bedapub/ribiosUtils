# Helper function to compare matchColumnIndex results with multi=TRUE (order-agnostic)
expect_matchColumnIndex_equal <- function(result, expected) {
  expect_equal(names(result), names(expected))
  expect_equal(length(result), length(expected))
  for (i in seq_along(result)) {
    expect_equal(sort(result[[i]]), sort(expected[[i]]),
                 info = paste("Element", i, ":", names(result)[i]))
  }
}

test_that("matchColumnIndex returns correct indices with multi=FALSE", {
  df <- data.frame(
    Team = c("HSV", "BVB", "HSC", "FCB", "HSV", NA),
    Pkt = c(25, 23, 12, 18, 21, NA),
    row.names = c("C", "B", "A", "F", "E", "N")
  )
  teams <- c("HSV", "BVB", "BRE", NA, "HSV")

  result <- matchColumnIndex(teams, df, 1L, multi = FALSE)
  expect_identical(result, c(1L, 2L, NA, 6L, 1L))
})

test_that("matchColumnIndex returns correct indices with multi=TRUE", {
  df <- data.frame(
    Team = c("HSV", "BVB", "HSC", "FCB", "HSV", NA),
    Pkt = c(25, 23, 12, 18, 21, NA),
    row.names = c("C", "B", "A", "F", "E", "N")
  )
  teams <- c("HSV", "BVB", "BRE", NA, "HSV")

  result <- matchColumnIndex(teams, df, 1L, multi = TRUE)
  expected <- structure(
    list(c(1L, 5L), 2L, NA_integer_, 6L, c(1L, 5L)),
    names = c("HSV", "BVB", "BRE", NA, "HSV")
  )
  expect_matchColumnIndex_equal(result, expected)
})

test_that("matchColumnIndex matches by row names when column=0", {
  df <- data.frame(
    Team = c("HSV", "BVB", "HSC", "FCB", "HSV", NA),
    Pkt = c(25, 23, 12, 18, 21, NA),
    row.names = c("C", "B", "A", "F", "E", "N")
  )
  ind <- c("C", "A", "G", "F", "C", "B", "B", NA)

  result_single <- matchColumnIndex(ind, df, 0, multi = FALSE)
  expect_identical(result_single, c(1L, 3L, NA, 4L, 1L, 2L, 2L, NA))

  result_multi <- matchColumnIndex(ind, df, 0, multi = TRUE)
  expected_multi <- structure(
    list(1L, 3L, NA_integer_, 4L, 1L, 2L, 2L, NA_integer_),
    names = c("C", "A", "G", "F", "C", "B", "B", NA)
  )
  expect_matchColumnIndex_equal(result_multi, expected_multi)
})

test_that("matchColumn returns matched data frame with multi=FALSE", {
  df <- data.frame(
    Team = c("HSV", "BVB", "HSC", "FCB", "HSV", NA),
    Pkt = c(25, 23, 12, 18, 21, NA),
    row.names = c("C", "B", "A", "F", "E", "N")
  )
  teams <- c("HSV", "BVB", "BRE", NA, "HSV")

  result <- matchColumn(teams, df, 1L, multi = FALSE)
  expected <- structure(
    list(
      Team = c("HSV", "BVB", "BRE", NA, "HSV"),
      Pkt = c(25, 23, NA, NA, 25)
    ),
    row.names = c("C", "B", "NA", "N", "C.1"),
    class = "data.frame"
  )
  expect_identical(result, expected)
})

test_that("matchColumn matches by row names when column=0", {
  df <- data.frame(
    Team = c("HSV", "BVB", "HSC", "FCB", "HSV", NA),
    Pkt = c(25, 23, 12, 18, 21, NA),
    row.names = c("C", "B", "A", "F", "E", "N")
  )
  ind <- c("C", "A", "G", "F", "C", "B", "B", NA)

  result <- matchColumn(ind, df, 0, multi = FALSE)
  expected <- structure(
    list(
      Team = c("HSV", "HSC", NA, "FCB", "HSV", "BVB", "BVB", NA),
      Pkt = c(25, 12, NA, 18, 25, 23, 23, NA)
    ),
    row.names = as.integer(1:8),
    class = "data.frame"
  )
  expect_identical(result, expected)
})
