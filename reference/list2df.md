# Transform a list of character strings into a data.frame

Transform a list of character strings into a data.frame

## Usage

``` r
list2df(list, names = NULL, col.names = c("Name", "Item"))
```

## Arguments

- list:

  A list of character strings

- names:

  Values in the 'Name' column of the result, used if the input list has
  no names

- col.names:

  Column names of the `data.frame`

## Value

A `data.frame`

## Examples

``` r
myList <- list(HSV=c("Mueller", "Papadopoulos", "Wood"), FCB=c("Lewandowski", "Robben", "Hummels"),
               BVB=c("Reus", "Goetze", "Kagawa"))
list2df(myList, col.names=c("Club", "Player"))
#>   Club       Player
#> 1  HSV      Mueller
#> 2  HSV Papadopoulos
#> 3  HSV         Wood
#> 4  FCB  Lewandowski
#> 5  FCB       Robben
#> 6  FCB      Hummels
#> 7  BVB         Reus
#> 8  BVB       Goetze
#> 9  BVB       Kagawa
```
