# Print head and tail elements of a vector

This function prints head and tail elements of a vector for
visualization purposes. See examples for its usage.

## Usage

``` r
headtail(vec, head = 2, tail = 1, collapse = ", ")
```

## Arguments

- vec:

  A vector of native types (e.g. character strings)

- head:

  Integer, number of head elements to be printed

- tail:

  Integer, number of tail elements to be printed

- collapse:

  Character string, used to collapse elements

## Value

A character string representing the vector

## Details

Head and tail elements are concatenated with ellipsis, if there are any
elements that are not shown in the vector.

## See also

[`head`](https://rdrr.io/r/utils/head.html),
[`tail`](https://rdrr.io/r/utils/head.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
testVec1 <- LETTERS[1:10]
headtail(testVec1)
#> [1] "A, B, ..., J"
headtail(testVec1, head=3, tail=3)
#> [1] "A, B, C, ..., H, I, J"
headtail(testVec1, head=3, tail=3, collapse="|")
#> [1] "A|B|C|...|H|I|J"

testVec2 <- letters[1:3]
headtail(testVec2, head=1, tail=1)
#> [1] "a, ..., c"
headtail(testVec2, head=2, tail=1)
#> [1] "a, b, c"
```
