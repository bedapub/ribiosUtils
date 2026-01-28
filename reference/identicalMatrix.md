# Test whether two matrices are identical by values and by dim names

Test whether two matrices are identical by values and by dim names

## Usage

``` r
identicalMatrix(x, y, epsilon = 1e-12)
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
set.seed(1887); x <- matrix(rnorm(1000), nrow=10, dimnames=list(LETTERS[1:10],NULL))
set.seed(1887); y <- matrix(rnorm(1000), nrow=10, dimnames=list(LETTERS[1:10],NULL))
set.seed(1887); z <- matrix(rnorm(1000), nrow=10, dimnames=list(letters[1:10],NULL))
stopifnot(identicalMatrix(x,y))
stopifnot(!identicalMatrix(x,z))
```
