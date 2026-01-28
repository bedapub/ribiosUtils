# Create a directory if it does not exist, and then make sure the creation was successful.

The function is particularly useful for scripting.

## Usage

``` r
createDir(dir, showWarnings = FALSE, recursive = TRUE, mode = "0777")
```

## Arguments

- dir:

  Directory name

- showWarnings:

  Passed to [dir.create](https://rdrr.io/r/base/files2.html)

- recursive:

  Passed to [dir.create](https://rdrr.io/r/base/files2.html)

- mode:

  Passed to [dir.create](https://rdrr.io/r/base/files2.html)

## Value

Directory name (invisible)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
tempdir <- tempdir()
createDir(tempdir)
```
