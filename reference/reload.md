# Reload a package

Reload a package by first detaching and loading the library.

## Usage

``` r
reload(pkg)
```

## Arguments

- pkg:

  Character string, name of the package

## Value

Side effect is used.

## Note

So far only character is accepted

## See also

[`detach`](https://rdrr.io/r/base/detach.html) and
[`library`](https://rdrr.io/r/base/library.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
## the example should not run because it will reload the package
if (FALSE) { # \dontrun{
  reload(ribiosUtils)
} # }
```
