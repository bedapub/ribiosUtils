# Remove columns in a matrix that contains one or more NAs

Remove columns in a matrix that contains one or more NAs

## Usage

``` r
removeColumnsWithNA(mat)
```

## Arguments

- mat:

  A matrix

## Value

A matrix, with columns containing one or more NAs removed

## Examples

``` r
myMat <- matrix(c(1:9, NA, 10:17), nrow=6, byrow=TRUE,
  dimnames=list(sprintf("R%d", 1:6), sprintf("C%d", 1:3)))
removeColumnsWithNA(myMat)
#>    C2 C3
#> R1  2  3
#> R2  5  6
#> R3  8  9
#> R4 10 11
#> R5 13 14
#> R6 16 17
```
