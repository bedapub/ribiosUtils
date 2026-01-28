# Transform p-values to continuous scores with the absolute-log10 transformation

The function maps p values between 0 and 1 to continuous scores ranging
on `R` by the following equation: \\abs(log10(p))\*sign\\

## Usage

``` r
pAbsLog10Score(p, sign = 1, replaceZero = TRUE)
```

## Arguments

- p:

  *p*-value(s) between (0,1\]

- sign:

  Sign of the score, either positive (in case of positive numbers),
  negative (in case of negative numbers), or zero. In case a logical
  vector, `TRUE` is interpreted as positive and `FALSE` is interpreted
  as negative.

- replaceZero:

  Logical, whether to replace zero p-values with the minimal double
  value specified by the machine. Default is `TRUE`. If set to `FALSE`,
  results will contain infinite values.

## Value

A numeric vector of transformed p-values using signed -log10
transformation.

## See also

[`pQnormScore`](https://bedapub.github.io/ribiosUtils/reference/pQnormScore.md),
[`pScore`](https://bedapub.github.io/ribiosUtils/reference/pScore.md),
[`replaceZeroPvalue`](https://bedapub.github.io/ribiosUtils/reference/replaceZeroPvalue.md)

## Examples

``` r
testPvals <- c(0.001, 0.01, 0.05, 0.1, 0.5, 1)
pAbsLog10Score(testPvals)
#> [1] 3.00000 2.00000 1.30103 1.00000 0.30103 0.00000
testPvalSign <- rep(c(-1,1), 3)
pAbsLog10Score(testPvals, sign=testPvalSign)
#> [1] -3.00000  2.00000 -1.30103  1.00000 -0.30103  0.00000
testLog <- rep(c(TRUE, FALSE),3)
pAbsLog10Score(testPvals, testLog)
#> [1]  3.00000 -2.00000  1.30103 -1.00000  0.30103  0.00000
```
