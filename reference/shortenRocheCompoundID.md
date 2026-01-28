# Shorten Roche compounds identifiers

Shorten Roche compounds identifiers

## Usage

``` r
shortenRocheCompoundID(str)
```

## Arguments

- str:

  Character strings that contains one or more Roche core identifiers
  (`RO` followed by seven-digit numbers)

## Value

Character strings of the same length as the input, with all core
identifiers shortened

In contrast to
[`rocheCore`](https://bedapub.github.io/ribiosUtils/reference/rocheCore.md),
which only handles character strings that are valid Roche compound
identifiers, this function takes any input string and performs a `gsub`
operation to shorten Roche core numbers. Therefore, it even works when
only a substring matches the pattern of a Roche compound name.

## Examples

``` r
shortenRocheCompoundID(c("RO1234567-001", "RO1234567-001-000", 
"RO1234567", "ROnoise-001", "anyOther-not-affected", 
"RO1234567 and RO9876543 are two imaginary compounds."))
#> [1] "RO4567"                                        
#> [2] "RO4567"                                        
#> [3] "RO4567"                                        
#> [4] "ROnoise-001"                                   
#> [5] "anyOther-not-affected"                         
#> [6] "RO4567 and RO6543 are two imaginary compounds."
```
