# Compare two vectors by set operations

Basic set operations are used to compare two vectors

## Usage

``` r
compTwoVecs(vec1, vec2)
```

## Arguments

- vec1:

  A vector of atomic types, e.g. integers, characters, etc.

- vec2:

  A vector of the same type as `vec1`

## Value

A vector of six integer elements

- vec1.setdiff :

  Number of unique items only in `vec1` but not in `vec2`

- intersect :

  Number of items in both `vec1` and `vec2`

- vec2.setdiff :

  Number of unique items only in `vec2` but not in `vec1`

- vec1.ulen:

  Number of unique items in `vec1`

- vec2.ulen:

  Number of unique items in `vec2`

- union:

  Number of unique items in `vec1` and `vec2`

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
year1 <- c("HSV", "FCB", "BVB", "S04", "FCN")
year2 <- c("HSV", "FCK", "S04")
compTwoVecs(year1, year2)
#> vec1.setdiff    intersect vec2.setdiff    vec1.ulen    vec2.ulen        union 
#>            3            2            1            5            3            6 
```
