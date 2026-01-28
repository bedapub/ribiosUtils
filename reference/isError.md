# Tell whether an object is an error

Determines whether an object is of class `try-error`

## Usage

``` r
isError(x)
```

## Arguments

- x:

  Any object, potentially produced within a `try-error` structure.

## Value

Logical value, `TRUE` if `x` inherits the `try-error` class.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
if(exists("nonExistObj")) rm(nonExistsObj)
myObj <- try(nonExistObj/5, silent=TRUE)
isError(myObj)
#> [1] TRUE
```
