# Shorten strings to strings with a fix width of characters

Shorten strings to strings with a fix width of characters

## Usage

``` r
fixWidthStr(str, nchar = 8, align = c("left", "right"))
```

## Arguments

- str:

  A vector of strings

- nchar:

  The fixed with

- align:

  Character, how to align Strings with more or fewer characters than
  `nchar` are either shortened or filled (with spaces)

## Value

A vector of strings with fixed widths

## Note

`NA` will be converted to characters and the same fixed width will be
applied. The behavior is different from
[`shortenStr`](https://bedapub.github.io/ribiosUtils/reference/shortenStr.md),
where `NA` is kept as it is.

## See also

[`shortenStr`](https://bedapub.github.io/ribiosUtils/reference/shortenStr.md)

## Examples

``` r
inputStrs <- c("abc", "abcd", "abcde", "abcdefg", "NA", NA) 
outputStrs <- fixWidthStr(inputStrs, nchar=4)
stopifnot(all(nchar(outputStrs)==4))
```
