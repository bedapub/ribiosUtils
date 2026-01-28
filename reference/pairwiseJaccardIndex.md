# Calculate pairwise Jaccard Indices between each pair of items in a list

Calculate pairwise Jaccard Indices between each pair of items in a list

## Usage

``` r
pairwiseJaccardIndex(list)

pairwiseJaccardDistance(list)
```

## Arguments

- list:

  A list

## Value

A symmetric matrix of dimension `mxm`, where `m` is the length of the
list

`pairwiseJaccardDistance` is defined as `1-pairwiseJaccardIndex`.

## Examples

``` r
myList <- list(first=LETTERS[3:5], second=LETTERS[1:3], third=LETTERS[1:5], fourth=LETTERS[6:10])
pairwiseJaccardIndex(myList)
#>        first second third fourth
#> first    1.0    0.2   0.6      0
#> second   0.2    1.0   0.6      0
#> third    0.6    0.6   1.0      0
#> fourth   0.0    0.0   0.0      1

poormanPJI <- function(list) {
  sapply(list, function(x) sapply(list, function(y) jaccardIndex(x,y)))
}
stopifnot(identical(pairwiseJaccardIndex(myList), poormanPJI(myList)))
```
