# Match a given vector to column names of a data.frame or matrix

Match a given vector to column names of a data.frame or matrix

## Usage

``` r
matchColumnName(data.frame.cols, reqCols, ignore.case = FALSE)
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

A vector of integers as indices

## Examples

``` r
myTestDf <- data.frame(HBV=1:3, VFB=0:2, BVB=4:6, FCB=2:4)
myFavTeams <- c("HBV", "BVB")
matchColumnName(myTestDf, myFavTeams)
#> [1] 1 3
myFavTeamsCase <- c("hbv", "bVb")
matchColumnName(myTestDf, myFavTeamsCase, ignore.case=TRUE)
#> [1] 1 3
## NA will be returned in this case if ignore.case is set to FALSE
matchColumnName(myTestDf, myFavTeamsCase, ignore.case=FALSE)
#> [1] NA NA
```
