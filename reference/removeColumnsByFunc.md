# Remove rows or column by function

Remove rows or column by function

## Usage

``` r
removeColumnsByFunc(matrix, removeFunc)

removeRowsByFunc(matrix, removeFunc)
```

## Arguments

- matrix:

  A matrix

- removeFunc:

  A function which should return boolean results

## Value

A matrix with rows or columns whose return value of `removeFunc` is
`TRUE`

## Examples

``` r
myMat <- matrix(c(1, 3 ,5, 4, 5, 6, 7, 9, 11), byrow=FALSE, nrow=3)
removeColumnsByFunc(myMat, removeFunc=function(x) any(x %% 2 == 0))
#>      [,1] [,2]
#> [1,]    1    7
#> [2,]    3    9
#> [3,]    5   11
removeRowsByFunc(myMat, removeFunc=function(x) any(x %% 2 == 0))
#>      [,1] [,2] [,3]
#> [1,]    3    5    9
```
