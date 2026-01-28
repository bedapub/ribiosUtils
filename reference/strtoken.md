# Tokenize strings by character

Tokenize strings by character in a similar way as the `strsplit`
function in the `base` package. The function can return a matrix of
tokenized items when `index` is missing. If `index` is given, tokenized
items in the selected position(s) are returned. See examples.

## Usage

``` r
strtoken(x, split, index, ...)
```

## Arguments

- x:

  A vector of character strings; non-character vectors are cast into
  characters.

- split:

  A character to split the strings.

- index:

  Numeric vector indicating which fields should be returned; if missing
  or set to `NULL`, a matrix containing all fields are returned.

- ...:

  Other parameters passed to
  [`strsplit`](https://rdrr.io/r/base/strsplit.html)

## Value

A matrix if `index` is missing, `NULL`, or contains more than one
integer indices; otherwise a character vector.

## References

The main body of the function is modified from the `strsplit2` function
in the `limma` package.

## See also

[`strsplit`](https://rdrr.io/r/base/strsplit.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
myStr <- c("HSV\t1887", "FCB\t1900", "FCK\t1948")
strsplit(myStr, "\t")
#> [[1]]
#> [1] "HSV"  "1887"
#> 
#> [[2]]
#> [1] "FCB"  "1900"
#> 
#> [[3]]
#> [1] "FCK"  "1948"
#> 

strtoken(myStr, "\t")
#>      [,1]  [,2]  
#> [1,] "HSV" "1887"
#> [2,] "FCB" "1900"
#> [3,] "FCK" "1948"
strtoken(myStr, "\t", index=1L)
#> [1] "HSV" "FCB" "FCK"
strtoken(myStr, "\t", index=2L)
#> [1] "1887" "1900" "1948"

myFac <- factor(myStr)
strtoken(myFac, "\t")
#>      [,1]  [,2]  
#> [1,] "HSV" "1887"
#> [2,] "FCB" "1900"
#> [3,] "FCK" "1948"
strtoken(myFac, "\t", index=1L)
#> [1] "HSV" "FCB" "FCK"
```
