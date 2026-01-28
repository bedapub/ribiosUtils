# Check whether file(s) exist

`checkFile` checks whether file exists, `assertFile` stops the program
if files do not exist

## Usage

``` r
checkFile(...)

assertFile(...)
```

## Arguments

- ...:

  Files to be checked

## Value

`checkFile` returns logical vector. `assertFile` returns an invisible
`TRUE` if files exist, otherwise halts and prints error messages.

## Details

`assertFile` is often used in scripts where missing a file would cause
the script fail.

## See also

[`isDir`](https://bedapub.github.io/ribiosUtils/reference/isDir.md) and
[`assertDir`](https://bedapub.github.io/ribiosUtils/reference/isDir.md)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
myDesc <- system.file("DESCRIPTION", package="ribiosUtils")
myNEWS <- system.file("NEWS", package="ribiosUtils")
checkFile(myDesc, myNEWS)
#> [1] TRUE
assertFile(myDesc, myNEWS)
```
