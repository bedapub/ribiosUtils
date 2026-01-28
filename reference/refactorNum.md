# Sort numeric factor levels by values

Factor variables with numbers as levels are alphabetically ordered by
default, which requires rearrangements for various purposes, e.g.
modelling or visualizations. This function re-orders levels of numeric
factor variables numerically.

## Usage

``` r
refactorNum(x, decreasing = FALSE)
```

## Arguments

- x:

  A factor variable with numeric values as levels

- decreasing:

  Logical, should the levels sorted descendingly?

## Value

A factor variable, with sorted numeric values as levels

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
(nums <- factor(c("2","4","24","1","2","125","1","2","125")))
#> [1] 2   4   24  1   2   125 1   2   125
#> Levels: 1 125 2 24 4
(nums.new <- refactorNum(nums))
#> [1] 2   4   24  1   2   125 1   2   125
#> Levels: 1 2 4 24 125
```
