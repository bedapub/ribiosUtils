# Functions for command-line Rscript debugging

These functions are used to debug command-line executable Rscripts in R
sessions

## Usage

``` r
setDebug()
```

## Value

`setDebug` and `unsetDebug` returns an invisible value indicating
whether the variable setting (unsetting) was successful.

`isDebugging` and `isIntDebugging` returns logical values.

## Details

`setDebug` sets the environmental variable `RIBIOS_SCRIPT_DEBUG` as
`TRUE`. `unsetDebug` unsets the variable. `isDebugging` checks whether
the variable is set or not. `isIntDebugging` tests whether the scripts
runs interactively or runs in the debugging mode. The last one can be
useful when debugging Rscript in a R session.

A programmer wishing to debug a Rscript can explicitly set (or unset)
the `RIBIOS_SCRIPT_DEBUG` variable in order to activate (inactivate)
certain trunks of codes. This can be automated via `isDebugging`, or
probably more conveniently, by `isIntDebugging`: if the script runs in
an interactive mode, or the debugging flag is set, the function returns
`TRUE`.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
unsetDebug()
print(isDebugging())
#> [1] FALSE
setDebug()
print(isDebugging())
#> [1] TRUE
unsetDebug()
print(isDebugging())
#> [1] FALSE
print(isIntDebugging())
#> [1] FALSE
```
