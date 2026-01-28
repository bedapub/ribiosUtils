# Convert a long-format data frame into matrix

Input data.frame must contain at least three columns: one contains row
names (specified by `row.col`), one contains column names
(`column.col`), and one contains values in matrix cells (`value.col`).
The output is a 2D matrix.

## Usage

``` r
longdf2matrix(
  df,
  row.col = 1L,
  column.col = 2L,
  value.col = 3L,
  missingValue = NULL
)
```

## Arguments

- df:

  Long-format data frame

- row.col:

  Character or integer, which column of the input data.frame contains
  row names?

- column.col:

  Character or integer, which column contains column names?

- value.col:

  Character or integer, which column contains matrix values?

- missingValue:

  Values assigned in case of missing data

## Value

A 2D matrix equivalent to the long-format data frame

## See also

`matrix2longdf`

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
test.df <- data.frame(H=c("HSV", "BVB", "HSV", "BVB"),
A=c("FCB", "S04", "S04", "FCB"),
score=c(3, 1, 1, 0))
longdf2matrix(test.df, row.col=1L, column.col=2L, value.col=3L)
#>     FCB S04
#> HSV   3   1
#> BVB   0   1

data(Indometh)
longdf2matrix(Indometh, row.col="time", column.col="Subject",value.col="conc")
#>         1    2    3    4    5    6
#> 0.25 1.50 2.03 2.72 1.85 2.05 2.31
#> 0.5  0.94 1.63 1.49 1.39 1.04 1.44
#> 0.75 0.78 0.71 1.16 1.02 0.81 1.03
#> 1    0.48 0.70 0.80 0.89 0.39 0.84
#> 1.25 0.37 0.64 0.80 0.59 0.30 0.64
#> 2    0.19 0.36 0.39 0.40 0.23 0.42
#> 3    0.12 0.32 0.22 0.16 0.13 0.24
#> 4    0.11 0.20 0.12 0.11 0.11 0.17
#> 5    0.08 0.25 0.11 0.10 0.08 0.13
#> 6    0.07 0.12 0.08 0.07 0.10 0.10
#> 8    0.05 0.08 0.08 0.07 0.06 0.09
longdf2matrix(Indometh, row.col="Subject", column.col="time", value.col="conc")
#>   0.25  0.5 0.75    1 1.25    2    3    4    5    6    8
#> 1 1.50 0.94 0.78 0.48 0.37 0.19 0.12 0.11 0.08 0.07 0.05
#> 2 2.03 1.63 0.71 0.70 0.64 0.36 0.32 0.20 0.25 0.12 0.08
#> 3 2.72 1.49 1.16 0.80 0.80 0.39 0.22 0.12 0.11 0.08 0.08
#> 4 1.85 1.39 1.02 0.89 0.59 0.40 0.16 0.11 0.10 0.07 0.07
#> 5 2.05 1.04 0.81 0.39 0.30 0.23 0.13 0.11 0.08 0.10 0.06
#> 6 2.31 1.44 1.03 0.84 0.64 0.42 0.24 0.17 0.13 0.10 0.09
```
