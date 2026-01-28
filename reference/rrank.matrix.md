# Get reverse rank orders in each column

Get reverse rank orders in each column

## Usage

``` r
# S3 method for class 'matrix'
rrank(x, ...)
```

## Arguments

- x:

  A matrix

- ...:

  Passed to [`rank`](https://rdrr.io/r/base/rank.html)

## Value

A matrix of the same dimension and attributes of the input matrix, with
reverse rank orders of each column

## Examples

``` r
testMatrix <- matrix(c(3,6,4,5,2,4,8,3,2,5,4,7), ncol=3, byrow=FALSE)
rrank(testMatrix)
#>      [,1] [,2] [,3]
#> [1,]    3    2    2
#> [2,]    6    4    5
#> [3,]    4    8    4
#> [4,]    5    3    7
```
