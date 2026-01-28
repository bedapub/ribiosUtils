# Transform p-values to continuous scores with the quantile function of the normal distribution

Quantile function, also known as the inverse of cumulative distribution
function of the normal distribution, is used to map p-values to
continuous scores raging on \\R\\. The signs of the resulting scores are
positive by default and are determined by the parameter `sign`.

## Usage

``` r
pQnormScore(p, sign = 1, replaceZero = TRUE)
```

## Arguments

- p:

  *p*-value(s) between \\(0,1\]\\

- sign:

  Signs of the scores, either positive (in case of positive numbers),
  negative (in case of negative numbers), or zero. In case of a logical
  vector, `TRUE` is interpreted as positive and `FALSE` is interpreted
  as negative.

- replaceZero:

  Logical, whether to replace zero p-values with the minimal double
  value specified by the machine. Default is `TRUE`. If set to `FALSE`,
  results will contain infinite values.

## Value

A numeric vector of transformed p-values using signed quantile normal
transformation.

## See also

[`pAbsLog10Score`](https://bedapub.github.io/ribiosUtils/reference/pAbsLog10Score.md),
[`pScore`](https://bedapub.github.io/ribiosUtils/reference/pScore.md),
[`double`](https://rdrr.io/r/base/double.html)

## Examples

``` r
testPvals <- c(0.001, 0.01, 0.05, 0.1, 0.5, 1)
pQnormScore(testPvals)
#> [1] 3.2905267 2.5758293 1.9599640 1.6448536 0.6744898 0.0000000
testPvalSign <- rep(c(-1,1), 3)
pQnormScore(testPvals, sign=testPvalSign)
#> [1] -3.2905267  2.5758293 -1.9599640  1.6448536 -0.6744898  0.0000000
testLog <- rep(c(TRUE, FALSE),3)
pQnormScore(testPvals, testLog)
#> [1]  3.2905267 -2.5758293  1.9599640 -1.6448536  0.6744898  0.0000000
```
