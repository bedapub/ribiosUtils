# Replace NA with FALSE

Replace `NA` in a vector with `FALSE`

## Usage

``` r
na.false(x)
```

## Arguments

- x:

  A logical vector or matrix

## Value

Logical vector or matrix with NAs replaced by FALSE

## See also

myX \<- c("HSV", "FCK", "FCN", NA, "BVB") res \<- myX == "HSV"
na.false(res)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>
