# Shorten strings to a given number of characters

Shorten strings to a given number of characters

## Usage

``` r
shortenStr(str, nchar = 8)
```

## Arguments

- str:

  A vector of strings

- nchar:

  The maximal number of characters to keep

## Value

A vector of strings of the same length as the input, with each string
shortened to the desired length

Strings with more characters than `nchar` will be shortened.

## Note

`NA` will be kept as they are

## Examples

``` r
inputStrs <- c("abc", "abcd", "abcde", NA)
shortenStr(inputStrs, nchar=4)
#> [1] "abc"     "abcd"    "abcd..." NA       
## expected outcome: abc, abcd, abcd..., NA
```
