# Extract core identifiers from Roche compound IDs

Extract core identifiers from Roche compound IDs

## Usage

``` r
rocheCore(str, short = FALSE)
```

## Arguments

- str:

  Character strings

- short:

  Logical, if `TRUE`, the short version of Roche identifiers
  (`RO[0-9]{4}`) is returned. Default: `FALSE`

## Value

Core identifiers if the element is a Roche compound ID, the original
element otherwise Non-character input will be converted to character
strings first.

## See also

[`isRocheCompoundID`](https://bedapub.github.io/ribiosUtils/reference/isRocheCompoundID.md)

## Examples

``` r
rocheCore(c("RO1234567-001", "RO1234567-001-000", "RO1234567", 
    "ROnoise-001", "anyOther-not-affected"))
#> [1] "RO1234567"             "RO1234567"             "RO1234567"            
#> [4] "ROnoise-001"           "anyOther-not-affected"
rocheCore(c("RO1234567-001", "RO1234567-001-000", "RO1234567",
    "ROnoise-001","anyOther-not-affected"), short=TRUE)
#> [1] "RO4567"                "RO4567"                "RO4567"               
#> [4] "ROnoise-001"           "anyOther-not-affected"
```
