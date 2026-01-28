# Remove columns

Remove columns from a data.frame object

## Usage

``` r
removeColumns(data.frame, columns, drop = FALSE)
```

## Arguments

- data.frame:

  data.frame

- columns:

  names of columns to be removed

- drop:

  Logical, whether the matrix should be dropped to vector if only one
  column is left

## Value

data.frame with specified columns removed

## Details

The function is equivalent to the subsetting operation with brackets. It
provides a tidy programming interface to manupulate data.frames.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
clubs <- data.frame(Points=c(21,23,28,24), Name=c("BVB", "FCB", "HSV",
"FCK"), games=c(12,11,11,12))
removeColumns(clubs,c("Name"))
#>   Points games
#> 1     21    12
#> 2     23    11
#> 3     28    11
#> 4     24    12
```
