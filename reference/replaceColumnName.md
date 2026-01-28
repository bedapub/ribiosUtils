# Replace column names in data.frame

Replace column names in data.frame

## Usage

``` r
replaceColumnName(data.frame, old.names, new.names)
```

## Arguments

- data.frame:

  A data.frame

- old.names:

  Old column names to be replaced

- new.names:

  New column names

## Value

Data.frame with column names updated

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
clubs <- data.frame(Points=c(21,23,28,24), Name=c("BVB", "FCB", "HSV",
"FCK"), games=c(12,11,11,12))
replaceColumnName(clubs, c("Points", "games"), c("Punkte", "Spiele"))
#>   Punkte Name Spiele
#> 1     21  BVB     12
#> 2     23  FCB     11
#> 3     28  HSV     11
#> 4     24  FCK     12
```
