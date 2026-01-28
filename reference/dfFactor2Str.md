# Convert factor columns in a data.frame into character strings

Convert factor columns in a data.frame into character strings

## Usage

``` r
dfFactor2Str(df)
```

## Arguments

- df:

  A data.frame

## Value

A data.frame with factor columns coereced into character strings

## Examples

``` r
exampleDf <- data.frame(Teams=c("HSV", "FCB", "FCB", "HSV"), 
             Player=c("Mueller", "Mueller", "Robben", "Holtby"), 
             scores=c(3.5, 1.5, 1.5, 1.0), stringsAsFactors=TRUE)
strDf <- dfFactor2Str(exampleDf)
stopifnot(identical(strDf[,1], c("HSV", "FCB", "FCB", "HSV")))
stopifnot(identical(exampleDf[,1], factor(c("HSV", "FCB", "FCB", "HSV"))))
```
