# Sort matrix by dim names

Rearrange rows and columns of a matrix by dim names

## Usage

``` r
sortByDimnames(x, row.decreasing = FALSE, col.decreasing = FALSE)
```

## Arguments

- x:

  A matrix or data.frame

- row.decreasing:

  Logical, whether rows should be sorted decreasingly

- col.decreasing:

  Logical, whether columns should be sorted decreasingly

## Value

Resorted matrix or data frame

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
testMat <- matrix(1:16, nrow=4, dimnames=list(c("B", "D", "A", "C"), c("t", "f", "a", "g")))
sortByDimnames(testMat)
#>    a f  g t
#> A 11 7 15 3
#> B  9 5 13 1
#> C 12 8 16 4
#> D 10 6 14 2
sortByDimnames(testMat, row.decreasing=TRUE, col.decreasing=FALSE)
#>    a f  g t
#> D 10 6 14 2
#> C 12 8 16 4
#> B  9 5 13 1
#> A 11 7 15 3
```
