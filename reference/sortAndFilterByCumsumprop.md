# Sort a numeric vector and filter by a threshold of cumsumprop

Sort a numeric vector and filter by a threshold of cumsumprop

## Usage

``` r
sortAndFilterByCumsumprop(x, thr = 0.9)
```

## Arguments

- x:

  Numeric vector, usually named

- thr:

  Threshold, default 0.9, meaning that items whose proportion of
  cumulative sum just above 0.9 are kept.

## Value

Another numeric vector, likely shorter than x, items whose `cumsumprop`
is equal or lower than `thr`. The rest items are summed into one new
item, with the name `rest`

This function can be useful to extract from a long numeric vector the
largest items that dominate the sum of the vector

## Examples

``` r
x <- c("A"=1,"B"=2,"C"=3,"D"=4,"E"=400,"F"=500)
sortAndFilterByCumsumprop(x, thr=0.99) ## F and E should be returned
#>    F    E    D rest 
#>  500  400    4    6 
```
