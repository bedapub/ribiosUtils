# Count tokens by splitting strings

Count tokens by splitting strings

## Usage

``` r
countTokens(str, split = "\t", ...)
```

## Arguments

- str:

  A character string vector

- split:

  Character used to split the strings

- ...:

  Other parameters passed to the `strsplit` function

## Value

Integer vector: count of tokens in the strings

## See also

[`strsplit`](https://rdrr.io/r/base/strsplit.html) to split strings, or
a convenient wrapper
[`strtoken`](https://bedapub.github.io/ribiosUtils/reference/strtoken.md)
in this package.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
myStrings <- c("HSV\t1887\tFavorite", "FCB\t1900", "FCK\t1948")
countTokens(myStrings)
#> [1] 3 2 2

## the function deals with factors as well
countTokens(factor(myStrings))
#> [1] 3 2 2
```
