# Reverse rank order

Reverse rank order

## Usage

``` r
rrank(x, ...)

# Default S3 method
rrank(x, ...)
```

## Arguments

- x:

  A numeric, complex, character or logical vector

- ...:

  Passed to [`rank`](https://rdrr.io/r/base/rank.html)

## Value

A vector of numbers of the same length as the input, giving reverse rank
orders.

The function returns the reverse rank order, i.e. in the descending
order

## See also

[`rank`](https://rdrr.io/r/base/rank.html)

## Examples

``` r
testVec <- c(3,6,4,5)
rank(testVec)
#> [1] 1 4 2 3
rrank(testVec)
#> [1] 4 1 3 2
```
