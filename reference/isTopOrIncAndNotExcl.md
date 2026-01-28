# Logical vector of being top or included and not excluded

Logical vector of being top or included and not excluded

## Usage

``` r
isTopOrIncAndNotExcl(x, top = 1, incFunc, excFunc, decreasing = TRUE)
```

## Arguments

- x:

  An atomic vector that can be sorted by `sort`, for instance integers
  and character strings.

- top:

  Integer, number of top elements that we want to consider.

- incFunc:

  Function, applied to `x` to return a logical vector of the same
  length, indicating whether the values should be included even if it
  does not belong to the top elements.

- excFunc:

  Function, applied to `x` to return a logical vector of the same
  length, indicating whether the values should be excluded even if it
  does belong to the top elements.

- decreasing:

  Logical, passed to `sort`. The default value is set to `TRUE`, which
  means that the highest values are considered the top elements. If set
  to `FALSE`, the lowest values are considered the top elements.

## Value

A logical vector of the same length as the input `x`, indicating whether
each element is being either top or included, and not excluded. The
function can be used to keep top elements of a vector while considering
both inclusion and exclusion criteria.

## Examples

``` r
myVal <- c(2, 4, 8, 7, 1)
isTopOrIncAndNotExcl(myVal, top=1)
#> [1] FALSE FALSE  TRUE FALSE FALSE
isTopOrIncAndNotExcl(myVal, top=3)
#> [1] FALSE  TRUE  TRUE  TRUE FALSE
isTopOrIncAndNotExcl(myVal, top=3, incFunc=function(x) x>=2)
#> [1]  TRUE  TRUE  TRUE  TRUE FALSE
isTopOrIncAndNotExcl(myVal, top=3, excFunc=function(x) x%%2==1)
#> [1] FALSE  TRUE  TRUE FALSE FALSE
isTopOrIncAndNotExcl(myVal, top=3, incFunc=function(x) x>=2, excFunc=function(x) x%%2==1)
#> [1]  TRUE  TRUE  TRUE FALSE FALSE
myVal2 <- c("a", "A", "a", "A", "A")
isTopOrIncAndNotExcl(myVal2, 2)
#> [1]  TRUE FALSE  TRUE FALSE FALSE
isTopOrIncAndNotExcl(myVal2, 2, incFunc=function(x) x=="A")
#> [1] TRUE TRUE TRUE TRUE TRUE
isTopOrIncAndNotExcl(myVal2, 4)
#> [1]  TRUE  TRUE  TRUE  TRUE FALSE
isTopOrIncAndNotExcl(myVal2, 4, excFunc=function(x) x=="a")
#> [1] FALSE  TRUE FALSE  TRUE FALSE
# \donttest{
## the function returns all TRUEs if top is larger than the length of the vector
isTopOrIncAndNotExcl(myVal, top=9)
#> [1] TRUE TRUE TRUE TRUE TRUE
# }
```
