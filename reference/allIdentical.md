# Testing whether several objects are all identical with each other

Given several objects, the function tests whether all of them are
identical.

## Usage

``` r
allIdentical(...)
```

## Arguments

- ...:

  Objects to be tested. Can be given as a list, or simplying appending
  names separated by commas, see example.

## Value

Logical, whether all objects are the same

## See also

[`identical`](https://rdrr.io/r/base/identical.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
test1 <- test2 <- test3 <- LETTERS[1:3]
allIdentical(test1, test2, test3)
#> [1] TRUE
allIdentical(list(test1, test2, test3))
#> [1] TRUE

num1 <- num2 <- num3 <- num4 <- sqrt(3)
allIdentical(num1, num2, num3, num4)
#> [1] TRUE
```
