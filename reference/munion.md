# Operations for multiple sets

Set operation functions in the `base` package, `union`, `intersect` and
`setdiff`, can only be applied to binary manipulations involving two
sets. Following functions, `munion`, `mintersect` and `msetdiff`, extend
their basic versions to deal with multiple sets.

## Usage

``` r
munion(...)
```

## Arguments

- ...:

  Vectors of items, or a list of them. See examples below.

## Value

A vector of set operation results. Can be an empty vector if no results
were returned.

## Details

These functions apply set manipulations (union, intersect, or
difference) in a sequential manner: the first two sets are considered
first, then the third, the fourth and so on, till all sets have been
visited.

## See also

[`union`](https://rdrr.io/r/base/sets.html),
[`intersect`](https://rdrr.io/r/base/sets.html) and
[`setdiff`](https://rdrr.io/r/base/sets.html).

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
set1 <- c("HSV", "FCB", "BVB", "FCN", "HAN")
set2 <- c("HSV", "FCB", "BVB", "HAN")
set3 <- c("HSV", "BVB", "FSV")

munion(set1, set2, set3)
#> [1] "HSV" "FCB" "BVB" "FCN" "HAN" "FSV"
mintersect(set1, set2, set3)
#> [1] "HSV" "BVB"
msetdiff(set1, set2, set3)
#> [1] "FCN"

## sets can be given in a list as well
munion(list(set1, set2, set3))
#> [1] "HSV" "FCB" "BVB" "FCN" "HAN" "FSV"
mintersect(list(set1, set2, set3))
#> [1] "HSV" "BVB"
msetdiff(list(set1, set2, set3))
#> [1] "FCN"
```
