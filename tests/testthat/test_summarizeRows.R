test_that("summarizeRows computes row means correctly by factor", {
  my_matrix <- matrix(1:36, nrow = 6)
  my_factor <- factor(c("A", "B", "A", "C", "B", "B"))

  result <- summarizeRows(matrix = my_matrix, factor = my_factor, fun = mean)
  expected <- matrix(
    c(2, 8, 14, 20, 26, 32,
      13/3, 31/3, 49/3, 67/3, 85/3, 103/3,
      4, 10, 16, 22, 28, 34),
    nrow = 3, byrow = TRUE,
    dimnames = list(c("A", "B", "C"), NULL)
  )

  expect_identical(result, expected)
})

test_that("summarizeRows computes row products correctly by factor", {
  my_matrix <- matrix(1:36, nrow = 6)
  my_factor <- factor(c("A", "B", "A", "C", "B", "B"))

  result <- summarizeRows(matrix = my_matrix, factor = my_factor, fun = prod)
  expected <- matrix(
    c(3, 63, 195, 399, 675, 1023,
      60, 1056, 4284, 11040, 22620, 40320,
      4, 10, 16, 22, 28, 34),
    nrow = 3, byrow = TRUE,
    dimnames = list(c("A", "B", "C"), NULL)
  )

  expect_identical(result, expected)
})

test_that("summarizeColumns computes column means correctly by factor", {
  my_matrix <- matrix(1:36, nrow = 6)
  my_factor <- factor(c("A", "B", "A", "C", "B", "B"))

  result <- summarizeColumns(matrix = my_matrix, factor = my_factor, fun = mean)
  expected <- matrix(
    as.numeric(c(7:12, 21:26, 19:24)),
    ncol = 3, byrow = FALSE,
    dimnames = list(NULL, c("A", "B", "C"))
  )

  expect_identical(result, expected)
})

test_that("summarizeColumns computes column products correctly by factor", {
  my_matrix <- matrix(1:36, nrow = 6)
  my_factor <- factor(c("A", "B", "A", "C", "B", "B"))

  result <- summarizeColumns(matrix = my_matrix, factor = my_factor, fun = prod)
  expected <- matrix(
    c(13, 28, 45, 64, 85, 108,
      5425, 6656, 8019, 9520, 11165, 12960,
      19, 20, 21, 22, 23, 24),
    ncol = 3, byrow = FALSE,
    dimnames = list(NULL, c("A", "B", "C"))
  )

  expect_identical(result, expected)
})

test_that("summarizeRows handles NA values in factor", {
  my_matrix <- matrix(1:36, nrow = 6)
  my_na_factor <- factor(c("A", "B", "A", "C", NA, "B"))

  result_mean <- summarizeRows(matrix = my_matrix, factor = my_na_factor, fun = mean)
  expected_mean <- matrix(
    c(2, 8, 14, 20, 26, 32,
      4, 10, 16, 22, 28, 34,
      4, 10, 16, 22, 28, 34),
    nrow = 3, byrow = TRUE,
    dimnames = list(c("A", "B", "C"), NULL)
  )
  expect_identical(result_mean, expected_mean)

  result_prod <- summarizeRows(matrix = my_matrix, factor = my_na_factor, fun = prod)
  expected_prod <- matrix(
    c(3, 63, 195, 399, 675, 1023,
      12, 96, 252, 480, 780, 1152,
      4, 10, 16, 22, 28, 34),
    nrow = 3, byrow = TRUE,
    dimnames = list(c("A", "B", "C"), NULL)
  )
  expect_identical(result_prod, expected_prod)
})

test_that("summarizeColumns handles NA values in factor", {
  my_matrix <- matrix(1:36, nrow = 6)
  my_na_factor <- factor(c("A", "B", "A", "C", NA, "B"))

  result_mean <- summarizeColumns(matrix = my_matrix, factor = my_na_factor, fun = mean)
  expected_mean <- matrix(
    as.numeric(c(7:12, 19:24, 19:24)),
    ncol = 3, byrow = FALSE,
    dimnames = list(NULL, c("A", "B", "C"))
  )
  expect_identical(result_mean, expected_mean)

  result_prod <- summarizeColumns(matrix = my_matrix, factor = my_na_factor, fun = prod)
  expected_prod <- matrix(
    c(13, 28, 45, 64, 85, 108,
      217, 256, 297, 340, 385, 432,
      19, 20, 21, 22, 23, 24),
    ncol = 3, byrow = FALSE,
    dimnames = list(NULL, c("A", "B", "C"))
  )
  expect_identical(result_prod, expected_prod)
})
