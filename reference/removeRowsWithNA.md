# Remove rows in a matrix that contains one or more NAs

Remove rows in a matrix that contains one or more NAs

## Usage

``` r
removeRowsWithNA(mat)
```

## Arguments

- mat:

  A matrix

## Value

A matrix, with rows containing one or more NAs removed

## Examples

``` r
myMat <- matrix(c(1:9, NA, 10:17), nrow=6, byrow=TRUE,
  dimnames=list(sprintf("R%d", 1:6), sprintf("C%d", 1:3)))
removeRowsWithNA(myMat)
#>    C1 C2 C3
#> R1  1  2  3
#> R2  4  5  6
#> R3  7  8  9
#> R5 12 13 14
#> R6 15 16 17
```
