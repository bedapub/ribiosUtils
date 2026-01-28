# Set boundaries for numeric values, or perform a 0-1 normalization.

The basic concepts of these functions are borrowed from the `bound`
function in the `Qt` framework.

## Usage

``` r
bound(x, low, high)

boundNorm(x, low = min(x, na.rm = TRUE), high = max(x, na.rm = TRUE))
```

## Arguments

- x:

  A numeric vector or matrix

- low:

  New lower boundary

- high:

  New higher boundary

## Value

A numeric vector or matrix, the same type as input.

## Details

`bound` sets the values smaller than `low`, or larger than `high`, to
the value of `low` and `high` respectively.If no such values exist, the
vector or matrix is returned unchanged.

`boundNorm` performs a 0-1 normalization. Input vector or matrix is
transformed linearly onto the region defined between `low` and `high`,
which has the unit length (1).

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
myVec <- c(2,4,3,-1,9,5,3,4)
bound(myVec, 0, 8)
#> [1] 2 4 3 0 8 5 3 4
boundNorm(myVec)
#> [1] 0.3 0.5 0.4 0.0 1.0 0.6 0.4 0.5
## boundNorm returns negative values if input values lie out of the
## given region between low and high
boundNorm(myVec, 0, 8)
#> [1]  0.250  0.500  0.375 -0.125  1.125  0.625  0.375  0.500

myMat <- matrix(myVec, nrow=2)
myMat
#>      [,1] [,2] [,3] [,4]
#> [1,]    2    3    9    3
#> [2,]    4   -1    5    4
bound(myMat, 0, 8)
#>      [,1] [,2] [,3] [,4]
#> [1,]    2    3    8    3
#> [2,]    4    0    5    4
boundNorm(myMat)
#>      [,1] [,2] [,3] [,4]
#> [1,]  0.3  0.4  1.0  0.4
#> [2,]  0.5  0.0  0.6  0.5
boundNorm(myMat, 0, 8)
#>      [,1]   [,2]  [,3]  [,4]
#> [1,] 0.25  0.375 1.125 0.375
#> [2,] 0.50 -0.125 0.625 0.500
```
