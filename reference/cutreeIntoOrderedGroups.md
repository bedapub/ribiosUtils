# Cut a tree into groups of ordered sizes

Cut a tree into groups of ordered sizes

## Usage

``` r
cutreeIntoOrderedGroups(tree, k = NULL, h = NULL, decreasing = TRUE)
```

## Arguments

- tree:

  a tree as produced by [`hclust`](https://rdrr.io/r/stats/hclust.html),
  will be passed to [`cutree`](https://rdrr.io/r/stats/cutree.html)

- k:

  an integer scalar or vector with the desired number of groups

- h:

  numeric scalar or vector with heights where the tree should be cut.

- decreasing:

  logical, should be the first group the largest?

  Cut a tree, e.g. as resulting from
  [`hclust`](https://rdrr.io/r/stats/hclust.html), into groups, with the
  groups being ordered by their size.

## Value

A named integer vector of cluster assignments, ordered by cluster size
(largest first by default). If multiple values of `k` or `h` are
provided, a matrix with one column per value.

## See also

[`cutree`](https://rdrr.io/r/stats/cutree.html)

## Examples

``` r
hc <- hclust(dist(USArrests))
hck5 <- cutreeIntoOrderedGroups(hc, k = 5)
table(hck5)
#> hck5
#>  1  2  3  4  5 
#> 14 14 10 10  2 
## compare with cutree, which does not order the groups
table(cutree(hc, k=5))
#> 
#>  1  2  3  4  5 
#> 14 14 10  2 10 

hck25 <- cutreeIntoOrderedGroups(hc, k = 2:5)
apply(hck25, 2, table)
#> $`2`
#> 
#>  1  2 
#> 34 16 
#> 
#> $`3`
#> 
#>  1  2  3 
#> 20 16 14 
#> 
#> $`4`
#> 
#>  1  2  3  4 
#> 20 14 14  2 
#> 
#> $`5`
#> 
#>  1  2  3  4  5 
#> 14 14 10 10  2 
#> 
```
