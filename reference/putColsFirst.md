# Rearrange columns to put some columns to far left

This function is helpful to export tables where certain columns are
desired to be placed to the most left of the data.frame

## Usage

``` r
putColsFirst(data.frame, columns)
```

## Arguments

- data.frame:

  Data.frame

- columns:

  Character vector, names of columns which are to be put to the left

## Value

data.frame with re-arranged columns

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
clubs <- data.frame(Points=c(21,23,28,24), Name=c("BVB", "FCB", "HSV",
"FCK"), games=c(12,11,11,12))
putColsFirst(clubs, c("Name"))
#>   Name Points games
#> 1  BVB     21    12
#> 2  FCB     23    11
#> 3  HSV     28    11
#> 4  FCK     24    12
putColsFirst(clubs, c("Name", "games"))
#>   Name games Points
#> 1  BVB    12     21
#> 2  FCB    11     23
#> 3  HSV    11     28
#> 4  FCK    12     24
```
