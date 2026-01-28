# Print the chosen few items of a long vector

Print the chosen few (the first and the last) items of a long vector

## Usage

``` r
chosenFew(vec, start = 3, end = 1, collapse = ",")
```

## Arguments

- vec:

  A vector of characters or other types that can be cast into characters

- start:

  Integer, how many elements at the start shall be printed

- end:

  Integer, how many elements at the end shall be printed

- collapse:

  Character used to separate elements

## Value

A character string ready to be printed

## Note

In case the vector is shorter than the sum of `start` and `end`, the
whole vector is printed.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
lvec1 <- 1:100
chosenFew(lvec1)
#> [1] "1,2,3,...,100"
chosenFew(lvec1, start=5, end=3)
#> [1] "1,2,3,4,5,...,98,99,100"

svec <- 1:8
chosenFew(svec)
#> [1] "1,2,3,...,8"
chosenFew(svec, start=5, end=4)
#> [1] "1,2,3,4,5,6,7,8"
```
