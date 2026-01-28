# Sort data.frame rows by values in specified columns

Sort rows of an `data.frame` by values in specified columns.

## Usage

``` r
sortByCol(
  data.frame,
  columns,
  na.last = TRUE,
  decreasing = TRUE,
  orderAsAttr = FALSE
)
```

## Arguments

- data.frame:

  A `data.frame` object

- columns:

  Column name(s) which sould be ordered

- na.last:

  Logical, whether NA should be sorted as last

- decreasing:

  Logical, whether the sorting should be in the decreasing order

- orderAsAttr:

  Logical, whether the order index vectors should be returned in the
  attribute “order” of the sorted `data.frame`

## Value

Sorted `data.frame`

## Details

Columns can be specified by integer indices, logical vectors or
character names.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
sample.df <- data.frame(teams=c("HSV", "BVB", "FCB", "FCN"),pts=c(18,17,17,9), number=c(7,7,6,6))
sortByCol(sample.df, 1L)
#>   teams pts number
#> 1   HSV  18      7
#> 4   FCN   9      6
#> 3   FCB  17      6
#> 2   BVB  17      7
sortByCol(sample.df, 1L, decreasing=FALSE)
#>   teams pts number
#> 2   BVB  17      7
#> 3   FCB  17      6
#> 4   FCN   9      6
#> 1   HSV  18      7

sortByCol(sample.df, c(3L, 1L))
#>   teams pts number
#> 1   HSV  18      7
#> 2   BVB  17      7
#> 4   FCN   9      6
#> 3   FCB  17      6
sortByCol(sample.df, c(3L, 1L), decreasing=FALSE)
#>   teams pts number
#> 3   FCB  17      6
#> 4   FCN   9      6
#> 2   BVB  17      7
#> 1   HSV  18      7
sortByCol(sample.df, c(3L, 2L))
#>   teams pts number
#> 1   HSV  18      7
#> 2   BVB  17      7
#> 3   FCB  17      6
#> 4   FCN   9      6

sortByCol(sample.df, c(TRUE, FALSE, TRUE))
#>   teams pts number
#> 1   HSV  18      7
#> 4   FCN   9      6
#> 3   FCB  17      6
#> 2   BVB  17      7

sortByCol(sample.df, c("teams", "pts"))
#>   teams pts number
#> 1   HSV  18      7
#> 4   FCN   9      6
#> 3   FCB  17      6
#> 2   BVB  17      7
sortByCol(sample.df, c("pts", "number", "teams"))
#>   teams pts number
#> 1   HSV  18      7
#> 2   BVB  17      7
#> 3   FCB  17      6
#> 4   FCN   9      6
sortByCol(sample.df, c("pts", "teams", "number"))
#>   teams pts number
#> 1   HSV  18      7
#> 3   FCB  17      6
#> 2   BVB  17      7
#> 4   FCN   9      6
```
