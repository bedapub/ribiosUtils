# Test whether two matrices have the same numerica values given certain accuracy

Test whether two matrices have the same numerica values given certain
accuracy

## Usage

``` r
identicalMatrixValue(x, y, epsilon = 1e-12)
```

## Arguments

- x:

  a matrix

- y:

  another matrix

- epsilon:

  accuracy threshold: absolute differences below this threshold is
  ignored

## Value

Logical

## Examples

``` r
set.seed(1887); x <- matrix(rnorm(1000), nrow=10)
set.seed(1887); y <- matrix(rnorm(1000), nrow=10)
set.seed(1882); z <- matrix(rnorm(1000), nrow=10)
stopifnot(identicalMatrixValue(x,y))
stopifnot(!identicalMatrixValue(x,y+1E-5))
stopifnot(!identicalMatrixValue(x,y-1E-5))
stopifnot(!identicalMatrixValue(x,z))
```
