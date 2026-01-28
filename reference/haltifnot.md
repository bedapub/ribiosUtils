# Ensure the Truth of R Expressions and Print Defined Error Message if NOT

If any of the expressions in ‘...’ are not *all* *TRUE*, *stop* is
called, producing an error message defined by the *msg* parameter.

## Usage

``` r
haltifnot(..., msg = "Error undefined. Please contact the developer")
```

## Arguments

- ...:

  any number of ‘logical’ R expressions, which should evaluate to `TRUE`

- msg:

  Error message.

## Value

`NULL` if all statements in `...` are `TRUE`

## Details

The function is adapted from the `stopifnot` function, with the
difference that the error message can be defined the programmer. With
`haltifnot` error message can be more informative, which is desired for
diagnostic and user-interation purposes.

## See also

[`stop`](https://rdrr.io/r/base/stop.html),
[`warning`](https://rdrr.io/r/base/warning.html) and
[`stopifnot`](https://rdrr.io/r/base/stopifnot.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
haltifnot(1==1, all.equal(pi, 3.14159265), 1<2) ## all TRUE
m <- matrix(c(1,3,3,1), 2,2)
haltifnot(m == t(m), diag(m) == rep(1,2)) ## all TRUE

op <- options(error = expression(NULL))
# "disable stop(.)"  << Use with CARE! >>
     
haltifnot(all.equal(pi, 3.141593),  2 < 2, all(1:10 < 12), "a" < "b",
          msg="not all conditions are TRUE. Please contact the devleoper")
#> Error: not all conditions are TRUE. Please contact the devleoper
options(op)# revert to previous error handler
```
