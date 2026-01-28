# Pairwise jaccard/overlap coefficient can be calculated efficiently using matrix Pairwise overlap coefficient of binary matrix by column

Pairwise jaccard/overlap coefficient can be calculated efficiently using
matrix Pairwise overlap coefficient of binary matrix by column

## Usage

``` r
columnOverlapCoefficient(x, y = NULL)
```

## Arguments

- x:

  An integer matrix, other objects will be coereced into a matrix

- y:

  An integer matrix, other objects will be coereced into a matrix. In
  case of `NULL`, pairwise overlap coefficients by column of `x` is
  returned.

## Value

A matrix of column-wise pairwise overlap coefficients of the binary
matrix. `NaN` is reported when neither of the columns have any non-zero
element.

## Examples

``` r
set.seed(1887)
testMatrix1 <- matrix(rbinom(120, 1, 0.2), nrow=15)
columnOverlapCoefficient(testMatrix1)
#>      [,1] [,2] [,3]      [,4] [,5]      [,6]      [,7] [,8]
#> [1,]  1.0  NaN    0 0.5000000  NaN 0.0000000 0.5000000    1
#> [2,]  NaN  NaN  NaN       NaN  NaN       NaN       NaN  NaN
#> [3,]  0.0  NaN    1 0.0000000  NaN 0.0000000 0.0000000    0
#> [4,]  0.5  NaN    0 1.0000000  NaN 0.0000000 0.6666667    0
#> [5,]  NaN  NaN  NaN       NaN  NaN       NaN       NaN  NaN
#> [6,]  0.0  NaN    0 0.0000000  NaN 1.0000000 0.6666667    0
#> [7,]  0.5  NaN    0 0.6666667  NaN 0.6666667 1.0000000    0
#> [8,]  1.0  NaN    0 0.0000000  NaN 0.0000000 0.0000000    1

testMatrix2 <- matrix(rbinom(150, 1, 0.2), nrow=15)
testMatrix12Poe <- columnOverlapCoefficient(testMatrix1, 
  testMatrix2)
```
