# Summarizing rows/columns by a factor

Apply a function to summarize rows/columns that assigned to the same
level by a factor vector.

## Usage

``` r
summarizeRows(matrix, factor, fun = mean, ...)
```

## Arguments

- matrix:

  A numeric matrix

- factor:

  A vector of factors, either of the length of `nrow(matrix)` (for
  `summarizeRows`), or the length of `ncol(matrix)` (for
  `summarizeColumns`).

- fun:

  A function or a name for a function, the summarizing function applied
  to rows/columns sharing the same level

- ...:

  Further parameters passed to the function

## Value

A matrix, the dimension will be determined by the number of levels of
the factor vector.

## Details

`NA` levels are neglected, and corresponding rows/columns will not
contribute to the summarized matrix.

`summarizeCols` is synonymous to `summarizeColumns`

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
my.matrix <- matrix(1:25, nrow=5)
print(my.matrix)
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    6   11   16   21
#> [2,]    2    7   12   17   22
#> [3,]    3    8   13   18   23
#> [4,]    4    9   14   19   24
#> [5,]    5   10   15   20   25

my.factor <- factor(c("A", "B", "A", "C", "B"))
summarizeRows(matrix=my.matrix, factor=my.factor, fun=mean)
#>   [,1] [,2] [,3] [,4] [,5]
#> A  2.0  7.0 12.0 17.0 22.0
#> B  3.5  8.5 13.5 18.5 23.5
#> C  4.0  9.0 14.0 19.0 24.0
summarizeRows(matrix=my.matrix, factor=my.factor, fun=prod)
#>   [,1] [,2] [,3] [,4] [,5]
#> A    3   48  143  288  483
#> B   10   70  180  340  550
#> C    4    9   14   19   24
summarizeColumns(matrix=my.matrix, factor=my.factor, fun=mean)
#>       A    B  C
#> [1,]  6 13.5 16
#> [2,]  7 14.5 17
#> [3,]  8 15.5 18
#> [4,]  9 16.5 19
#> [5,] 10 17.5 20
summarizeColumns(matrix=my.matrix, factor=my.factor, fun=prod)
#>       A   B  C
#> [1,] 11 126 16
#> [2,] 24 154 17
#> [3,] 39 184 18
#> [4,] 56 216 19
#> [5,] 75 250 20

## NA values in factor
my.na.factor <- factor(c("A", "B", "A", "C", NA))
summarizeRows(matrix=my.matrix, factor=my.na.factor, fun=mean)
#>   [,1] [,2] [,3] [,4] [,5]
#> A    2    7   12   17   22
#> B    2    7   12   17   22
#> C    4    9   14   19   24
summarizeRows(matrix=my.matrix, factor=my.na.factor, fun=prod)
#>   [,1] [,2] [,3] [,4] [,5]
#> A    3   48  143  288  483
#> B    2    7   12   17   22
#> C    4    9   14   19   24
summarizeColumns(matrix=my.matrix, factor=my.na.factor, fun=mean)
#>       A  B  C
#> [1,]  6  6 16
#> [2,]  7  7 17
#> [3,]  8  8 18
#> [4,]  9  9 19
#> [5,] 10 10 20
summarizeColumns(matrix=my.matrix, factor=my.na.factor, fun=prod)
#>       A  B  C
#> [1,] 11  6 16
#> [2,] 24  7 17
#> [3,] 39  8 18
#> [4,] 56  9 19
#> [5,] 75 10 20
```
