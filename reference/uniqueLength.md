# Length of unique elements in a vector

Length of unique elements in a vector

## Usage

``` r
uniqueLength(x, incomparables = FALSE)
```

## Arguments

- x:

  A vector

- incomparables:

  See [`unique`](https://rdrr.io/r/base/unique.html)

## Value

An integer indicating the number of unique elements in the input vector

## See also

`unique`

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
test.vec1 <- c("HSV", "FCB", "BVB", "HSV", "BVB")
uniqueLength(test.vec1)
#> [1] 3

test.vec2 <- c(1L, 2L, 3L, 5L, 3L, 4L, 2L, 1L, 5L)
ulen(test.vec2)
#> [1] 5
```
