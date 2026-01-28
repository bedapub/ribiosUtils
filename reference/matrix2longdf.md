# Transform a matrix into a long-format data.frame

The function converts a matrix into a long-format, three-column
data.frame, containing row, columna nd value. Such ‘long’ data.frames
can be useful in data visualization and modelling.

## Usage

``` r
matrix2longdf(
  mat,
  row.names,
  col.names,
  longdf.colnames = c("row", "column", "value")
)
```

## Arguments

- mat:

  A matrix

- row.names:

  Character, row names to appear in the `data.frame`. If missing, the
  `rownames` of the matrix will be used. If set to `NULL`, or if the
  matrix `rownames` are `NULL`, a integer index vector starting from 1
  will be used.

- col.names:

  Charater, column names to appear in the `data.frame`. The rule of
  handling missing or NULL parameters is the same as `row.names`
  described above.

- longdf.colnames:

  Character, column names of the output long data frame

## Value

A `data.frame` object with three columns: `row`, `column` and `value`.
If the input matrix is of dimesion `MxN`, the returning `data.frame` is
of the dimension `MNx3`.

## Details

The function converts a matrix into a three-column, ‘long’ format
data.frame containing row names, column names, and values of the matrix.

## Note

The length of `row.names` and `col.names` should be as the same as the
matrix dimension. Otherwise the function raises warnings.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
test.mat <- matrix(1:12, ncol=4, nrow=3, dimnames=list(LETTERS[1:3],
LETTERS[1:4]))
print(test.mat)
#>   A B C  D
#> A 1 4 7 10
#> B 2 5 8 11
#> C 3 6 9 12
print(matrix2longdf(test.mat))
#>    row column value
#> 1    A      A     1
#> 2    B      A     2
#> 3    C      A     3
#> 4    A      B     4
#> 5    B      B     5
#> 6    C      B     6
#> 7    A      C     7
#> 8    B      C     8
#> 9    C      C     9
#> 10   A      D    10
#> 11   B      D    11
#> 12   C      D    12
print(matrix2longdf(test.mat, longdf.colnames=c("From", "To", "Time")))
#>    From To Time
#> 1     A  A    1
#> 2     B  A    2
#> 3     C  A    3
#> 4     A  B    4
#> 5     B  B    5
#> 6     C  B    6
#> 7     A  C    7
#> 8     B  C    8
#> 9     C  C    9
#> 10    A  D   10
#> 11    B  D   11
#> 12    C  D   12
```
