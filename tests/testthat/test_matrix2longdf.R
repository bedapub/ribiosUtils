test_that("matrix2longdf converts matrix to long data frame correctly", {
  mat1 <- matrix(1:12, nrow = 4L, ncol = 3L,
                 dimnames = list(c("A", "B", "C", "D"), c("HSV", "FCB", "BVB")))
  mat1_longdf <- matrix2longdf(mat1)

  expect_identical(
    as.character(mat1_longdf$row),
    rep(LETTERS[1:4], 3L)
  )
  expect_identical(
    as.character(mat1_longdf$column),
    rep(c("HSV", "FCB", "BVB"), each = 4L)
  )
  expect_identical(mat1_longdf$value, 1:12)
})

test_that("matrix2longdf works with custom row and column names", {
  set.seed(1887)
  mat2 <- matrix(as.character(rnorm(100)), nrow = 10, ncol = 10)

  # No custom names
  longdf1 <- matrix2longdf(mat2)
  expect_equal(nrow(longdf1), 100)


  # Custom row and column names
  longdf2 <- matrix2longdf(mat2, row.names = LETTERS[1:10], col.names = letters[1:10])
  expect_identical(unique(longdf2$row), LETTERS[1:10])
  expect_identical(unique(longdf2$column), letters[1:10])

  # Only custom row names
  longdf3 <- matrix2longdf(mat2, row.names = LETTERS[1:10])
  expect_identical(unique(longdf3$row), LETTERS[1:10])

  # Only custom column names
  longdf4 <- matrix2longdf(mat2, col.names = letters[1:10])
  expect_identical(unique(longdf4$column), letters[1:10])
})

test_that("matrix2longdf warns on inconsistent name lengths", {
  set.seed(1887)
  mat2 <- matrix(as.character(rnorm(100)), nrow = 10, ncol = 10)

  expect_warning(
    matrix2longdf(mat2, col.names = letters[1:5]),
    regexp = NULL
  )
})
