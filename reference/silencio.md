# Keep silent by suppressing warnings and messages

The function is used to keep the command silent by suppressing warnings
and messages

## Usage

``` r
silencio(...)
```

## Arguments

- ...:

  Any function call

## Value

The same as the function call

## See also

[`suppressWarnings`](https://rdrr.io/r/base/warning.html),
[`suppressMessages`](https://rdrr.io/r/base/message.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
wsqrt <- function(x) {warning("Beep");message("Calculating square");return(x^2)}
silencio(wsqrt(3))
#> [1] 9
```
