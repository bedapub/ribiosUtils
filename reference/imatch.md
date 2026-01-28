# Case-insensitive match and pmatch

Case-insensitive `match` and `pmatch` functions, especially useful in
parsing user inputs, e.g. from command line.

## Usage

``` r
imatch(x, table, ...)
```

## Arguments

- x:

  String vector

- table:

  A vector to be matched

- ...:

  Other parameters passed to `match` or `pmatch`

## Value

`imatch` and `ipmatch` returns matching indices, or `NA` (by default) if
the match failed.

`matchv`, `imatchv` and `ipmatchv` returns the matching element in
`table`, or `NA` if the match failed. Note that when cases are different
in `x` and `table`, the one in `table` will be returned. This is
especially useful for cases where user's input has different cases as
the internal options.

## Details

`imatch` and `ipmatch` works similar as `match` and `pmatch`, except
that they are case-insensitive.

`matchv`, `imatchv` and `ipmatchv` are shot-cuts to get the matched
value (therefore the ‘v’) if the match succeeded, or `NA` if not.
`match(x, table)` is equivalent to `table[match(x, table)]`. See
examples.

## See also

[`match`](https://rdrr.io/r/base/match.html) and
[`pmatch`](https://rdrr.io/r/base/pmatch.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
user.input <- c("hsv", "BvB")
user.input2 <- c("HS", "BV")
internal.options <- c("HSV", "FCB", "BVB", "FCN")

match(user.input, internal.options)
#> [1] NA NA
imatch(user.input, internal.options)
#> [1] 1 3
ipmatch(user.input, internal.options)
#> [1] 1 3
ipmatch(user.input2, internal.options)
#> [1] 1 3

matchv(user.input, internal.options)
#> [1] NA NA
matchv(tolower(user.input), tolower(internal.options))
#> [1] "hsv" "bvb"
imatchv(user.input, internal.options)
#> [1] "HSV" "BVB"
ipmatchv(user.input, internal.options)
#> [1] "HSV" "BVB"
ipmatchv(user.input2, internal.options)
#> [1] "HSV" "BVB"
```
