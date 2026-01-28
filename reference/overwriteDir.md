# Overwrite a directory

Overwrite a directory

## Usage

``` r
overwriteDir(dir, action = c("ask", "overwrite", "append", "no"))
```

## Arguments

- dir:

  Chacater, path to a directory.

- action:

  Ask the user to input the option (`ask`), or one of the following
  options: `overwrite`, `append`, and `no`. See below for other options.

## Value

If `action` is set to `overwrite`, the directory will be deleted
recursively if it exists, a new directory with the same name will be
created, and the function returns `TRUE`. If `append` is set, the
function creates the directory if necessary and returns `TRUE`. If `no`
is set, the function does nothing and returns.

If `action` is set to `ask`, user will be prompted for actions.

If `overwrite` is set, the directory will be removed and written anew.

If `append` is set, in contrast to `overwrite`, the directory and the
files in it are not removed if they exists. In this case, files with the
same name will be overwritten. Otherwise, new directories or files will
be simply created. On the other hand, if the directory does not exist,
it will be created.

If `no` is set, no action will be taken. The funciton returns `FALSE`.

## Examples

``` r
## Helper to create a test directory with files
createTestDir <- function() {
  testdir <- file.path(tempdir(), "overwriteDir_test")
  dir.create(testdir, showWarnings = FALSE)
  writeLines("First file", file.path(testdir, "file1.txt"))
  writeLines("Second file", file.path(testdir, "file2.txt"))
  return(testdir)
}
addFileToDir <- function(testdir) {
  writeLines("New file", tempfile(tmpdir=testdir))
}

## overwrite: delete the directory and create it anew
testdir <- createTestDir()
length(dir(testdir)) ## two files should be there
#> [1] 2
overwriteDir(testdir, action="overwrite")
#> [1] TRUE
addFileToDir(testdir)
length(dir(testdir)) ## now there should be only one file
#> [1] 1

## append: keep existing files, add new ones
overwriteDir(testdir, action="append")
#> [1] TRUE
addFileToDir(testdir)
length(dir(testdir)) ## now two files
#> [1] 2

## no: no action, returns FALSE
noRes <- overwriteDir(testdir, action="no")
noRes
#> [1] FALSE

## cleanup
unlink(testdir, recursive = TRUE)

if (FALSE) { # \dontrun{
  ## ask: prompts user for action (interactive only)
  testdir <- createTestDir()
  overwriteDir(testdir, action="ask")
} # }
```
