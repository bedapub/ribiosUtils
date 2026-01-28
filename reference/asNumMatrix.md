# Convert string-valued data frame or matrix into a numeric matrix

Convert string-valued data frame or matrix into a numeric matrix

## Usage

``` r
asNumMatrix(x)
```

## Arguments

- x:

  A data.frame or matrix, most likely with string values

## Value

A numeric matrix with the same dimension

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
testDf <- data.frame(a=c("2.34", "4.55"), b=c("7.33", "9.10"))
asNumMatrix(testDf)
#>      a    b
#> 1 2.34 7.33
#> 2 4.55 9.10

testMatrix <- matrix(c("2.34", "4.55", "9E-3","-2.44", "7.33", "9.10"), nrow=2)
asNumMatrix(testMatrix)
#>      [,1]   [,2] [,3]
#> [1,] 2.34  0.009 7.33
#> [2,] 4.55 -2.440 9.10
```
