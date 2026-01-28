# Translate BiOmics-Pathology pstore path to URL

Translate BiOmics-Pathology pstore path to URL

## Usage

``` r
biomicsPstorePath2URL(path)
```

## Arguments

- path:

  Unix path

## Value

Character string of biomics pstore path The URL is only visible inside
Roche

## Examples

``` r
biomicsPstorePath2URL("/pstore/data/biomics/")
#> [1] "http://bioinfo.bas.roche.com:8080/biomics/"
```
