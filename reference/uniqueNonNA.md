# Make a vector free of NA and unique

Make a vector free of NA and unique

## Usage

``` r
uniqueNonNA(x)
```

## Arguments

- x:

  A vector

## Value

A unique vector without NA

## Examples

``` r
testVec <- c(3,4,5,NA,3,5)
uniqueNonNA(testVec)
#> [1] 3 4 5
```
