# Repeat garbage-collecting until all resource is freed

stubborngc repeats collecting garbage untill no more resource can be
freed

## Usage

``` r
stubborngc(verbose = FALSE, reset = TRUE)
```

## Arguments

- verbose:

  Logical, verbose or not

- reset:

  Logical, reset or not.

## Value

Side effect is used.

## See also

[`gc`](https://rdrr.io/r/base/gc.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
stubborngc()
```
