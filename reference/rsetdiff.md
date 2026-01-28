# Reverse setdiff

reverse setdiff, i.e. rsetdiff(x,y) equals setdiff(y,x)

## Usage

``` r
rsetdiff(x, y)
```

## Arguments

- x:

  a vector

- y:

  another vector

## Value

Similar to setdiff, but with elements in y but not in x

## Author

Jitao David Zhang

## Examples

``` r
testVec1 <- LETTERS[3:6]
testVec2 <- LETTERS[5:7]
rsetdiff(testVec1, testVec2)
#> [1] "G"
```
