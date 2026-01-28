# Checks existing directory

Checks whether given character strings point to valid directories

## Usage

``` r
isDir(...)

checkDir(...)

assertDir(...)
```

## Arguments

- ...:

  One or more character strings giving directory names to be tested

## Value

`isDir` returns logical vector.

`assertDir` returns an invisible `TRUE` if directories exist, otherwise
halts and prints error messages.

## Details

`isDir` tests whether the given string represent a valid, existing
directory. `assertDir` performs a logical test, and stops the program if
the given string does not point to a given directory.

`checkDir` is synonymous to `isDir`

## See also

[`file.info`](https://rdrr.io/r/base/file.info.html),
[`checkFile`](https://bedapub.github.io/ribiosUtils/reference/checkFile.md)
and
[`assertFile`](https://bedapub.github.io/ribiosUtils/reference/checkFile.md)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
dir1 <- tempdir()
dir2 <- tempdir()

isDir(dir1, dir2)
#> [1] TRUE TRUE
assertDir(dir1, dir2)
```
