# Trim leading and tailing spaces from string

The function trims leading and/or tailing spaces from string(s), using C
function implemented in the BIOS library.

## Usage

``` r
trim(x, left = " \n\r\t", right = " \n\r\t")
```

## Arguments

- x:

  A character string, or a vector of strings

- left:

  Characters that are trimmed from the left side.

- right:

  Characters that are trimmed from the right side

## Value

Trimmed string(s)

## Details

`left` and `right` can be set to NULL. In such cases no trimming will be
performed.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
myStrings <- c("This is a fine day\n",
               " Hallo Professor!",
               "  NUR DER HSV  ")
trim(myStrings)
#> [1] "This is a fine day" "Hallo Professor!"   "NUR DER HSV"       
```
