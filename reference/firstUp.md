# Make the first alphabet of strings uppercase

Make the first alphabet of strings uppercase

## Usage

``` r
firstUp(str)
```

## Arguments

- str:

  A vector of character strings

## Value

A vector of the same length, with the first alphabet in uppercase

## See also

[`toTitleCase`](https://rdrr.io/r/tools/toTitleCase.html)

## Examples

``` r
firstUp('test string')
#> [1] "Test string"
firstUp(strsplit('many many years ago', ' ')[[1]])
#> [1] "Many"  "Many"  "Years" "Ago"  
```
