test_that("pwdecode decodes encoded passwords correctly", {
  encoded <- " \\001\\000\\141\\314\\033\\033\\033\\033\\033\\142\\303\\056\\166\\311\\037\\042"
  expect_identical(pwdecode(encoded), "HSV")
})

test_that("pwdecode returns plain strings unchanged", {
  expect_identical(pwdecode("abcs"), "abcs")
})
