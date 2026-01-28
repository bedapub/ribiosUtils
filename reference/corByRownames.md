# Calculate correlation coefficients using common rows of the two matrices

Calculate correlation coefficients using common rows of the two matrices

## Usage

``` r
corByRownames(mat1, mat2, ...)
```

## Arguments

- mat1:

  A numeric matrix

- mat2:

  Another numeric matrix

- ...:

  Passed `cor` At least two rows of both matrices must share the same
  names, otherwise the function will report an error.

## Value

A matrix of the dimension \\m \times n\\, where `m` and `n` are number
of columns in `mat1` and `mat2`, respectively. The matrix has an
attribute, `commonRownames`, giving the common rownames shared by the
two matrices.

## Examples

``` r
myMat1 <- matrix(rnorm(24), nrow=6, byrow=TRUE,
  dimnames=list(sprintf("R%d", 1:6), sprintf("C%d", 1:4)))
myMat2 <- matrix(rnorm(35), nrow=7, byrow=TRUE,
  dimnames=list(sprintf("R%d", 7:1), sprintf("C%d", 1:5)))
corByRownames(myMat1, myMat2)
#>            C1         C2          C3         C4          C5
#> C1 -0.0902017  0.8089499  0.10073400 -0.1530758 -0.10920425
#> C2  0.4339425 -0.7000653  0.05422141  0.1034744 -0.15564676
#> C3 -0.7476710  0.0423632 -0.78364795 -0.7201135  0.23363722
#> C4 -0.3707695 -0.3332199 -0.35659969 -0.4044449  0.04971213
#> attr(,"commonRownames")
#> [1] "R1" "R2" "R3" "R4" "R5" "R6"
```
