# Prepare R for an interactive script

The function prepares R for an interactive session (e.g. in a script).
Currently it defines behaviour in case of errors: a file named
“ribios.dump” is written.

## Usage

``` r
scriptInit()
```

## Value

Side effect is used.

## See also

[`options`](https://rdrr.io/r/base/options.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
## do not run unless the script mode is needed
# \donttest{
  scriptInit()
# }
```
