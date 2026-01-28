# Calculate pairwise distances between each pair of items in a list

Calculate pairwise distances between each pair of items in a list

## Usage

``` r
naivePairwiseDist(list, fun = jaccardIndex)
```

## Arguments

- list:

  A list

- fun:

  A function that receives two vectors (such as jaccardIndex) and
  returns a number (scale)

## Value

A symmetric matrix of dimension `mxm`, where `m` is the length of the
list

This function is inefficient compared with matrix-based methods. It is
exported just for education and for verifying results of matrix-based
methods.

## Examples

``` r
myList <- list(first=LETTERS[3:5], second=LETTERS[1:3], third=LETTERS[1:5], fourth=LETTERS[6:10])
naivePairwiseDist(myList, fun=jaccardIndex)
#>        first second third fourth
#> first    1.0    0.2   0.6      0
#> second   0.2    1.0   0.6      0
#> third    0.6    0.6   1.0      0
#> fourth   0.0    0.0   0.0      1
## despite of the name, any function that returns a number can work
naivePairwiseDist(myList, fun=jaccardDistance)
#>        first second third fourth
#> first    0.0    0.8   0.4      1
#> second   0.8    0.0   0.4      1
#> third    0.4    0.4   0.0      1
#> fourth   1.0    1.0   1.0      0
```
