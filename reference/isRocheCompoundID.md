# Tell whether a character string is a Roche compound ID

Tell whether a character string is a Roche compound ID

## Usage

``` r
isRocheCompoundID(str)
```

## Arguments

- str:

  Character string(s)

## Value

A logical vector of the same length as `str`, indicating whether each
element is a Roche compound ID or not.

## Note

Short versions (RO\[1-9\]{2,7}) are supported.

## Examples

``` r
isRocheCompoundID(c("RO1234567", "RO-1234567", 
                   "RO1234567-000", "RO1234567-000-000",
                   "ROnoise-000-000"))
#> [1]  TRUE  TRUE  TRUE  TRUE FALSE
```
