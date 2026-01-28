# Multiple identical

Testing whether multiple objects are identical

## Usage

``` r
midentical(
  ...,
  num.eq = TRUE,
  single.NA = TRUE,
  attrib.as.set = TRUE,
  ignore.bytecode = TRUE,
  ignore.environment = FALSE,
  ignore.srcref = TRUE,
  extptr.as.ref = FALSE
)
```

## Arguments

- ...:

  Objects to be tested, or a list of them

- num.eq, single.NA, attrib.as.set, ignore.bytecode, :

  See [`identical`](https://rdrr.io/r/base/identical.html)

- ignore.environment, ignore.srcref:

  See [`identical`](https://rdrr.io/r/base/identical.html)

- extptr.as.ref:

  See [`identical`](https://rdrr.io/r/base/identical.html), new
  parameter since R-4.2

## Value

A logical value, `TRUE` if all objects are identical

## Details

`midentical` extends `identical` to test multiple objects instead of
only two.

## See also

`identical`

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
set1 <- "HSV"
set2 <- set3 <- set4 <- c("HSV", "FCB")

midentical(set1, set2)
#> [1] FALSE
midentical(list(set1, set2))
#> [1] FALSE

midentical(set2, set3, set4)
#> [1] TRUE
midentical(list(set2, set3, set4))
#> [1] TRUE

## other options passed to identical
midentical(0, -0, +0, num.eq=FALSE)
#> [1] FALSE
midentical(0, -0, +0, num.eq=TRUE)
#> [1] TRUE
```
