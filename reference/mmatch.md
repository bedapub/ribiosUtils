# Multiple matching

Multiple matching between two vectors. Different from R-native `match`
function, where only one match is returned even if there are multiple
matches, `mmatch` returns all of them.

## Usage

``` r
mmatch(x, table, nomatch = NA_integer_)
```

## Arguments

- x:

  vector or `NULL`: the values to be matched.

- table:

  vector or `NULL`: the values to be matched against.

- nomatch:

  the value to be returned in case when no match is found.

## Value

A list of the same length as the input `x` vector. Each list item
contains the matching indices in ascending order (similar to `match`).

## Details

Multiple matches can be useful in many cases, and there is no native R
function for this purpose. User can write their own functions combining
`lapplying` with `match` or `%in%`, our experience however shows that
such non-vectorized function can be extremely slow, especially when the
`x` or `table` vector gets longer.

`mmatch` delegates the multiple-matching task to a C-level function,
which is optimized for speed. Internal benchmarking shows improvement of
hundred fold, namely using `mmatching` costs about 1/100 of the time
used by R-implementation.

## See also

`match`

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>, C-code was adapted
from the program written by Roland Schmucki.

## Examples

``` r
vec1 <- c("HSV", "BVB", "FCB", "HSV", "BRE", "HSV", NA, "BVB")
vec2 <- c("FCB", "FCN", "FCB", "HSV", "BVB", "HSV", "FCK", NA, "BRE", "BRE")

mmatch(vec1, vec2)
#> $HSV
#> [1] 4 6
#> 
#> $BVB
#> [1] 5
#> 
#> $FCB
#> [1] 1 3
#> 
#> $HSV
#> [1] 4 6
#> 
#> $BRE
#> [1]  9 10
#> 
#> $HSV
#> [1] 4 6
#> 
#> $<NA>
#> [1] 8
#> 
#> $BVB
#> [1] 5
#> 

## compare to match
match(vec1, vec2)
#> [1] 4 5 1 4 9 4 8 5
```
