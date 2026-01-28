# Assert whether the required column names exist

The function calls
[`matchColumnName`](https://bedapub.github.io/ribiosUtils/reference/matchColumnName.md)
internally to match the column names.

## Usage

``` r
assertColumnName(data.frame.cols, reqCols, ignore.case = FALSE)
```

## Arguments

- data.frame.cols:

  column names of a data.frame. One can also provide a data.frame, which
  may however cause worse performance since the data.frame is copied

- reqCols:

  required columns

- ignore.case:

  logical, whether the case is considered

## Value

If all required column names are present, their indices are returned
\*invisibly\*. Otherwise an error message is printed.

## Examples

``` r
myTestDf <- data.frame(HBV=1:3, VFB=0:2, BVB=4:6, FCB=2:4)
myFavTeams <- c("HBV", "BVB")
assertColumnName(myTestDf, myFavTeams)
myFavTeamsCase <- c("hbv", "bVb")
assertColumnName(myTestDf, myFavTeamsCase, ignore.case=TRUE)
```
