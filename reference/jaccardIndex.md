# Calculate the Jaccard Index between two vectors

Calculate the Jaccard Index between two vectors

## Usage

``` r
jaccardIndex(x, y)

jaccardDistance(x, y)
```

## Arguments

- x:

  A vector

- y:

  A vector

## Value

The Jaccard Index, a number between 0 and 1

`JaccardDistance` is defined as `1-JaccardIndex`.

## Examples

``` r
myX <- 1:6
myY <- 4:9
jaccardIndex(myX, myY)
#> [1] 0.3333333
jaccardDistance(myX, myY)
#> [1] 0.6666667

myX <- LETTERS[1:5]
myY <- LETTERS[6:10]
jaccardIndex(myX, myY)
#> [1] 0
jaccardDistance(myX, myY)
#> [1] 1
```
