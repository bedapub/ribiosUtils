# Invert the names and elements of a list

Invert the names and elements of a list

## Usage

``` r
invertList(inputList, simplify = FALSE)
```

## Arguments

- inputList:

  a list, other classed (e.g. named vectors) will be converted to lists

- simplify:

  Logical, if yes and if no duplicated names, return a vector

## Value

A list with values from the input becoming names and vice versa. When
`simplify=TRUE` and there are no duplicated names, a named character
vector is returned instead.

## Examples

``` r
myList <- list("A"=c("a", "alpha"), "B"=c("b", "Beta"), "C"="c")
invertList(myList)
#> $Beta
#> [1] "B"
#> 
#> $a
#> [1] "A"
#> 
#> $alpha
#> [1] "A"
#> 
#> $b
#> [1] "B"
#> 
#> $c
#> [1] "C"
#> 
invertList(myList, simplify=TRUE)
#>  Beta     a alpha     b     c 
#>   "B"   "A"   "A"   "B"   "C" 
```
