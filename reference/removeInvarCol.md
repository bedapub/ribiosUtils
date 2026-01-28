# Remove invariable columns from a data frame or matrix

Columns with one unique value are invariable. The functions help to
remove such columns from a data frame (or matrix) in order to highlight
the variables.

## Usage

``` r
removeInvarCol(df)
```

## Arguments

- df:

  A data frame or matrix

## Value

`isVarCol` and `isInvarCol` return a logical vector indicating the
variable and invariable columns respectively.

`removeInvarCol` removes invariable columns.

## Details

`removeInvarCol` the data frame removing invariable column(s).

`isVarCol` and `isInvarCol` are helper functions, returning a logical
vector indicating the variable and invariable columns respectively.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
 testDf <- data.frame(a=1:4, b=7, c=LETTERS[1:4])
isVarCol(testDf)
#>     a     b     c 
#>  TRUE FALSE  TRUE 
isInvarCol(testDf)
#>     a     b     c 
#> FALSE  TRUE FALSE 
removeInvarCol(testDf)
#>   a c
#> 1 1 A
#> 2 2 B
#> 3 3 C
#> 4 4 D
```
