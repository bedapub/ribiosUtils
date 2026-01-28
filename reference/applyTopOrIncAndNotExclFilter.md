# Apply isTopOrIncAndNotExcl filter to a matrix

Apply isTopOrIncAndNotExcl filter to a matrix

## Usage

``` r
applyTopOrIncAndNotExclFilter(matrix, MARGIN, top = 1, falseValue = 0, ...)
```

## Arguments

- matrix:

  A matrix.

- MARGIN:

  Integer, 1 stands for row and 2 stands for column, passed to `apply`.

- top:

  Integer, how many top elements should be kept, passed to
  `isTopOrIncAndNotExcl`.

- falseValue:

  The same type as data in the matrix, used to replace values that is
  `FALSE` when judged by `isTopOrIncAndNotExcl`.

- ...:

  Further parameters passed to `isTopOrIncAndNotExcl`, including
  `incFunc`, `excFunc`, and `decreasing`. The function applies the
  filter function `isTopOrIncAndNotExcl` to each row or each column to a
  matrix, keeps the values that are `TRUE` based on the logical vector
  returned by function, and replaces the values that are `FALSE` with
  the value defined by `falseValue`.

## Value

A matrix with the same dimnames but with elements not satisfying
`isTopOrIncAndNotExcl` replaced by `falseValue`.

## Examples

``` r
myMat <- matrix(c(1,2,3,4,8,7,6,5,12,9,11,10), nrow=3, byrow=TRUE,
   dimnames=list(c("A", "B", "C"), c("Alpha", "Beta", "Gamma", "Delta")))
print(myMat)
#>   Alpha Beta Gamma Delta
#> A     1    2     3     4
#> B     8    7     6     5
#> C    12    9    11    10
applyTopOrIncAndNotExclFilter(myMat, 1, top=2, falseValue=-1)
#>   Alpha Beta Gamma Delta
#> A    -1   -1     3     4
#> B     8    7    -1    -1
#> C    12   -1    11    -1
applyTopOrIncAndNotExclFilter(myMat, 2, top=2, falseValue=-1)
#>   Alpha Beta Gamma Delta
#> A    -1   -1    -1    -1
#> B     8    7     6     5
#> C    12    9    11    10
applyTopOrIncAndNotExclFilter(myMat, 2, top=2, falseValue=-1, decreasing=FALSE)
#>   Alpha Beta Gamma Delta
#> A     1    2     3     4
#> B     8    7     6     5
#> C    -1   -1    -1    -1
applyTopOrIncAndNotExclFilter(myMat, 1, top=2, falseValue=-1, incFunc=function(x) x%%2==0)
#>   Alpha Beta Gamma Delta
#> A    -1    2     3     4
#> B     8    7     6    -1
#> C    12   -1    11    10
applyTopOrIncAndNotExclFilter(myMat, 1, top=2, falseValue=-1,
   incFunc=function(x) x%%2==0, excFunc=function(x) x<5)
#>   Alpha Beta Gamma Delta
#> A    -1   -1    -1    -1
#> B     8    7     6    -1
#> C    12   -1    11    10
```
