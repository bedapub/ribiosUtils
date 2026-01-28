# KEEP ROWS WITH THE MAXIMUM STATISTIC

A common task in expression analysis is to collapse multiple features
that are mapped to the same gene by some statistic. This function does
this job by keeping the matrix row (normally features) with the higheest
statistic specified by the user.

## Usage

``` r
keepMaxStatRow(
  matrix,
  keys,
  keepNArows = TRUE,
  stat = function(x) mean(x, na.rm = TRUE),
  levels = c("rownames", "attribute", "discard"),
  ...
)
```

## Arguments

- matrix:

  A numeric matrix

- keys:

  A vector of character giving the keys the rows are mapped to. A common
  scenario is that each row represents one probeset, while the vector
  keys give the genes that the probesets are mapped to. Thus keys can be
  redundant, namely multiple probesets can map to the same gene.

- keepNArows:

  Logical, whether rows with `NA` as their keys should be kept (`TRUE`)
  or should be discarded (`FALSE`)

- stat:

  The function to calculate the univariate statistic. By default the
  `NA`-robust mean is used.

- levels:

  How should the information of the levels of keys, e.g. unique keys, be
  kept. `dicard` will discard this information, `rownames` will make the
  unique keys (potentially with `NA`s) as row names of the output
  matrix, and `attribute` will append an attribute named `levels` to the
  output matrix.

- ...:

  Other parameters passed to the `stat` function

## Value

A numeric matrix with rows mapped to unique keys, selected by the
maximum statistics. See examples below

## Details

`isMaxStatRow` returns a logical vector, with rows with maximal
statistics each key as `TRUE` and otherwise as `FALSE`.
`keepMaxStatRowInd` returns the integer indices of such rows. Finally
`keepMaxStatRow` returns the resulting matrices.

For use see examples

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
myFun1 <- function(x) mean(x, na.rm=TRUE)
myFun2 <- function(x) sd(x, na.rm=TRUE)
mat1 <- matrix(c(1,3,4,-5,
                 0,1,2,3,
                 7,9,5,3,
                 0,1,4,3), ncol=4, byrow=TRUE)
keys1 <- c("A", "B", "A", "B")

isMaxStatRow(mat1, keys1, stat=myFun1)
#> [1] FALSE FALSE  TRUE  TRUE
isMaxStatRow(mat1, keys1, stat=myFun2)
#> [1]  TRUE FALSE FALSE  TRUE

keepMaxStatRowInd(mat1, keys1, stat=myFun1)
#> [1] 3 4
keepMaxStatRowInd(mat1, keys1, stat=myFun2)
#> [1] 1 4

keepMaxStatRow(mat1, keys1, stat=myFun1)
#>   [,1] [,2] [,3] [,4]
#> A    7    9    5    3
#> B    0    1    4    3
keepMaxStatRow(mat1, keys1, stat="myFun2")
#> Error in get(stat, envir = parent.frame()): object 'myFun2' not found
keepMaxStatRow(mat1, keys1, stat="myFun2", levels="discard")
#> Error in get(stat, envir = parent.frame()): object 'myFun2' not found
keepMaxStatRow(mat1, keys1, stat="myFun2", levels="attribute")
#> Error in get(stat, envir = parent.frame()): object 'myFun2' not found

mat2 <- matrix(c(1,3,4,5,
                 0,1,2,3,
                 7,9,5,3,
                 0,1,4,3,
                 4,0,-1,3.1,
                 9,4,-3,2,
                 8,9,1,2,
                 0.1,0.2,0.5,NA,
                 NA, 4, 3,NA), ncol=4, byrow=TRUE,
               dimnames=list(LETTERS[1:9], NULL))
keys2 <- c("A", "B", "A", "B", NA, NA, "C", "A", "D")

isMaxStatRow(mat2, keys2, keepNArows=FALSE, stat=myFun1)
#> [1] FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE  TRUE
keepMaxStatRowInd(mat2, keys2, keepNArows=FALSE, stat=myFun1)
#> [1] 3 4 7 9

keepMaxStatRow(mat2, keys2, keepNArows=FALSE, stat=myFun1)
#>   [,1] [,2] [,3] [,4]
#> A    7    9    5    3
#> B    0    1    4    3
#> C    8    9    1    2
#> D   NA    4    3   NA
keepMaxStatRow(mat2, keys2, keepNArows=TRUE, stat=myFun1)
#>      [,1] [,2] [,3] [,4]
#> A       7    9    5  3.0
#> B       0    1    4  3.0
#> <NA>    4    0   -1  3.1
#> <NA>    9    4   -3  2.0
#> C       8    9    1  2.0
#> D      NA    4    3   NA
keepMaxStatRow(mat2, keys2, keepNArows=TRUE, stat=myFun1, levels="discard")
#>   [,1] [,2] [,3] [,4]
#> C    7    9    5  3.0
#> D    0    1    4  3.0
#> E    4    0   -1  3.1
#> F    9    4   -3  2.0
#> G    8    9    1  2.0
#> I   NA    4    3   NA
keepMaxStatRow(mat2, keys2, keepNArows=TRUE, stat=myFun1, levels="attribute")
#>   [,1] [,2] [,3] [,4]
#> C    7    9    5  3.0
#> D    0    1    4  3.0
#> E    4    0   -1  3.1
#> F    9    4   -3  2.0
#> G    8    9    1  2.0
#> I   NA    4    3   NA
#> attr(,"levels")
#> [1] "A" "B" NA  NA  "C" "D"
```
