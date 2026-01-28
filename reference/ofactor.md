# Ordered factor

Build a factor using the order of input character strings

## Usage

``` r
ofactor(x, ...)
```

## Arguments

- x:

  A vector of character strings

- ...:

  Other parameters passed to `factor`

## Value

Factor with levels in the same order of the input strings.

## See also

`factor`

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
testStrings <- c("A", "C", "B", "B", "C")
(testFac <- factor(testStrings))
#> [1] A C B B C
#> Levels: A B C
(testOfac <- ofactor(testStrings))
#> [1] A C B B C
#> Levels: A C B

stopifnot(identical(levels(testOfac), c("A", "C", "B")))
```
