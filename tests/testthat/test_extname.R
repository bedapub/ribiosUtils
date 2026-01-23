test_that("extname extracts file extensions correctly", {
  expect_identical(extname("mybook.pdf"), "pdf")
  expect_identical(extname("sequence.in.fasta"), "fasta")
  expect_identical(
    extname(c("/path/mybook.pdf", "test.doc")),
    c("pdf", "doc")
  )
})

test_that("extname returns NA for files without extension", {
  expect_identical(extname("README"), NA)
})

test_that("extname handles paths with spaces", {
  expect_identical(extname("/path/my\\ home/Holiday Plan.txt"), "txt")
})
