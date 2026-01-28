# Return a matrix that highlights reverse rank orders of features of interest by column

Return a matrix that highlights reverse rank orders of features of
interest by column

## Usage

``` r
rrankInd(matrix, ind, inValue = 1L, outValue = 0L, ...)
```

## Arguments

- matrix:

  A matrix

- ind:

  An integer vector or a logical vector that gives the index

- inValue:

  Value to highlight the reverse ranks indexed by `ind`, see details
  below

- outValue:

  Values assigned to other values not indexed by `ind`

- ...:

  Passed to [`rank`](https://rdrr.io/r/base/rank.html)

## Value

A matrix of the same dimension and attributes of the input matrix, each
column contains a vector of `inValue` and `outValue`. Positions that
match the reverse ranks of matrix values indexed by `ind` are assigned
the `inValue`, otherwise, the `outValue`.

The function can be used to visualize the reverse ranks of features of
interest (rows of the input matrix) in each sample (columns of the input
matrix). This is for instance useful for rank plots of features for
gene-set enrichment analysis.

Imagine that all features indexed by `ind` are the larger than all other
features in each sample, then the returned matrix will have value `1` in
the first rows (the number determined by the features indxed by `ind`),
and `0` in the rest rows.

## See also

[`rank`](https://rdrr.io/r/base/rank.html)

## Examples

``` r
testMatrix <- matrix(c(3,6,4,5,2,4,8,3,2,5,4,7), ncol=3, byrow=FALSE)
print(testMatrix)
#>      [,1] [,2] [,3]
#> [1,]    3    2    2
#> [2,]    6    4    5
#> [3,]    4    8    4
#> [4,]    5    3    7
testInd <- c(2,4)
## verify that the command below returns 1 in positions occupied by 
## the reverse ranks of the values indexed by testInd
rrankInd(testMatrix, testInd)
#>      [,1] [,2] [,3]
#> [1,]    1    0    1
#> [2,]    1    1    1
#> [3,]    0    1    0
#> [4,]    0    0    0
testIndBool <- c(FALSE, TRUE, FALSE, TRUE)
rrankInd(testMatrix, testIndBool)
#>      [,1] [,2] [,3]
#> [1,]    1    0    1
#> [2,]    1    1    1
#> [3,]    0    1    0
#> [4,]    0    0    0
```
