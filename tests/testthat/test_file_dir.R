test_that("createDir creates nested directories", {
  base_dir <- file.path(tempdir(), "test_createDir")
  nested_dir <- file.path(base_dir, "level1", "level2")

  # Clean up if exists
  if (dir.exists(base_dir)) unlink(base_dir, recursive = TRUE)

  # Should create nested directories
  result <- createDir(nested_dir)
  expect_equal(result, nested_dir)
  expect_true(dir.exists(nested_dir))

  # Clean up
  unlink(base_dir, recursive = TRUE)
})

test_that("overwriteDir creates nested directories with overwrite action", {
  base_dir <- file.path(tempdir(), "test_overwriteDir")
  nested_dir <- file.path(base_dir, "level1", "level2")

  # Clean up if exists
  if (dir.exists(base_dir)) unlink(base_dir, recursive = TRUE)

  # Should create nested directories with overwrite action
  result <- overwriteDir(nested_dir, action = "overwrite")
  expect_true(result)
  expect_true(dir.exists(nested_dir))

  # Clean up
  unlink(base_dir, recursive = TRUE)
})

test_that("overwriteDir creates nested directories with append action", {
  base_dir <- file.path(tempdir(), "test_overwriteDir_append")
  nested_dir <- file.path(base_dir, "level1", "level2")

  # Clean up if exists
  if (dir.exists(base_dir)) unlink(base_dir, recursive = TRUE)

  # Should create nested directories with append action
  result <- overwriteDir(nested_dir, action = "append")
  expect_true(result)
  expect_true(dir.exists(nested_dir))

  # Clean up
  unlink(base_dir, recursive = TRUE)
})
