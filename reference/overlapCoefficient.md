# Overlap coefficient, also known as Szymkiewicz-Simpson coefficient

Overlap coefficient, also known as Szymkiewicz-Simpson coefficient

## Usage

``` r
overlapCoefficient(x, y, checkUniqueNonNA = FALSE)

overlapDistance(x, y, checkUniqueNonNA = FALSE)
```

## Arguments

- x:

  A vector

- y:

  A vector

- checkUniqueNonNA:

  Logical, if `TRUE`, `x` and `y` are made unique and non-NA

## Value

The overlap coefficient

## See also

[`jaccardIndex`](https://bedapub.github.io/ribiosUtils/reference/jaccardIndex.md)

`overlapCofficient` calculates the overlap coefficient, and
`overlapDistance` is defined by 1-`overlapCoefficient`.

## Examples

``` r
myX <- 1:6
myY <- 4:9
overlapCoefficient(myX, myY)
#> [1] 0.5

myY2 <- 4:10
overlapCoefficient(myX, myY2)
#> [1] 0.5
## compare the result with Jaccard Index
jaccardIndex(myX, myY2)
#> [1] 0.3

## overlapDistance
overlapDistance(myX, myY2)
#> [1] 0.5
```
