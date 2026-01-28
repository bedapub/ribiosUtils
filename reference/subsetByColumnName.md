# Subset a data.frame by column name, allowing differences in cases

The function calls
[`assertColumnName`](https://bedapub.github.io/ribiosUtils/reference/assertColumnName.md)
internally to match the column names.

## Usage

``` r
subsetByColumnName(data.frame, reqCols, ignore.case = FALSE)
```

## Arguments

- data.frame:

  A data.frame object

- reqCols:

  required columns

- ignore.case:

  logical, whether the case is considered

## Value

If all required column names are present, the data.frame object will be
subset to include only these columns and the result data.frame is
returned. Otherwise an error message is printed.

## Examples

``` r
myTestDf <- data.frame(HBV=1:3, VFB=0:2, BVB=4:6, FCB=2:4)
myFavTeams <- c("HBV", "BVB")
subsetByColumnName(myTestDf, myFavTeams)
#>   HBV BVB
#> 1   1   4
#> 2   2   5
#> 3   3   6
myFavTeamsCase <- c("hbv", "bVb")
subsetByColumnName(myTestDf, myFavTeamsCase, ignore.case=TRUE)
#>   hbv bVb
#> 1   1   4
#> 2   2   5
#> 3   3   6
```
