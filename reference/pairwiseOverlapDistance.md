# Calculate pairwise overlap coefficients between each pair of items in a list

Calculate pairwise overlap coefficients between each pair of items in a
list

## Usage

``` r
pairwiseOverlapDistance(list)

pairwiseOverlapCoefficient(list)
```

## Arguments

- list:

  A list

## Value

A symmetric matrix of dimension `mxm`, where `m` is the length of the
list

`pairwiseOverlapDistance` is defined the pairwise overlap distance.

## Examples

``` r
myList <- list(first=LETTERS[3:5], second=LETTERS[1:3], third=LETTERS[1:5], fourth=LETTERS[6:10])
pairwiseOverlapCoefficient(myList)
#>            first    second third fourth
#> first  1.0000000 0.3333333     1      0
#> second 0.3333333 1.0000000     1      0
#> third  1.0000000 1.0000000     1      0
#> fourth 0.0000000 0.0000000     0      1
pairwiseOverlapDistance(myList)
#>            first    second third fourth
#> first  0.0000000 0.6666667     0      1
#> second 0.6666667 0.0000000     0      1
#> third  0.0000000 0.0000000     0      1
#> fourth 1.0000000 1.0000000     1      0

poormanPOC <- function(list) {
  sapply(list, function(x) sapply(list, function(y) overlapCoefficient(x,y)))
}
stopifnot(identical(pairwiseOverlapCoefficient(myList), poormanPOC(myList)))
```
