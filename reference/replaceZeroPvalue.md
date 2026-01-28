# Replace p-values of zero

Replace p-values of zero

## Usage

``` r
replaceZeroPvalue(p, factor = 1)
```

## Arguments

- p:

  A numeric vector, containing p-values. Zero values will be replaced by
  a small, non-zero value.

- factor:

  A numeric vector, the minimal p-value will be multiplied by it. Useful
  for `pQnormScore`, because there the p-value needs to be divided by
  two, therefore a factor of two makes sense.

## Value

A numeric vector of the same length as the input vector, with zeros
replaced by the minimal absolute double value defined by the machine
multiplied by the factor.

## Note

Values under the minimal positive double value are considered zero and
replaced.

## Examples

``` r
ps <- seq(0,1,0.1)
replaceZeroPvalue(ps)
#>  [1] 2.225074e-308  1.000000e-01  2.000000e-01  3.000000e-01  4.000000e-01
#>  [6]  5.000000e-01  6.000000e-01  7.000000e-01  8.000000e-01  9.000000e-01
#> [11]  1.000000e+00
replaceZeroPvalue(ps, factor=2)
#>  [1] 4.450148e-308  1.000000e-01  2.000000e-01  3.000000e-01  4.000000e-01
#>  [6]  5.000000e-01  6.000000e-01  7.000000e-01  8.000000e-01  9.000000e-01
#> [11]  1.000000e+00
```
