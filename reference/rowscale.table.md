# Scale a table by row

Scaling a table by row can be slightly slower due to a transposing step.

## Usage

``` r
# S3 method for class 'table'
rowscale(x, center = TRUE, scale = TRUE)
```

## Arguments

- x:

  An matrix

- center:

  Logical, passed to `scale`. to `TRUE`

- scale:

  Logical, passed to `scale`. `TRUE`

## Value

A table with each row scaled.

## See also

[`scale`](https://rdrr.io/r/base/scale.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
letterDf <- data.frame(from=c("A", "A", "B", "C"), to=c("A", "B", "C", "A"))
tbl <- table(letterDf$from, letterDf$to)
tblRowscale <- rowscale(tbl)

print(tbl)
#>    
#>     A B C
#>   A 1 1 0
#>   B 0 0 1
#>   C 1 0 0
print(tblRowscale)
#>    
#>              A          B          C
#>   A  0.5773503  0.5773503 -1.1547005
#>   B -0.5773503 -0.5773503  1.1547005
#>   C  1.1547005 -0.5773503 -0.5773503
rowMeans(tblRowscale)
#>            A            B            C 
#> 7.401487e-17 7.401487e-17 7.401487e-17 
apply(tblRowscale, 1L, sd)
#> A B C 
#> 1 1 1 

rowscale(tbl, center=FALSE, scale=FALSE) ## equal to mat
#>    
#>     A B C
#>   A 1 1 0
#>   B 0 0 1
#>   C 1 0 0
rowscale(tbl, center=TRUE, scale=FALSE)
#>    
#>              A          B          C
#>   A  0.3333333  0.3333333 -0.6666667
#>   B -0.3333333 -0.3333333  0.6666667
#>   C  0.6666667 -0.3333333 -0.3333333
rowscale(tbl, center=FALSE, scale=TRUE)
#>    
#>            A        B        C
#>   A 1.000000 1.000000 0.000000
#>   B 0.000000 0.000000 1.414214
#>   C 1.414214 0.000000 0.000000
```
