# Print a decimal number in procent format

Print a decimal number in procent format

## Usage

``` r
percentage(x, fmt = "1.1")
```

## Arguments

- x:

  a decimal number, usually between -1 and 1

- fmt:

  format string, '1.1' means a digit before and after the decimal point
  will be printed

## Value

Character string

## Examples

``` r
percentage(c(0,0.1,0.25,1))
#> [1] "0.0%"   "10.0%"  "25.0%"  "100.0%"
percentage(c(0,0.1,0.25,1), fmt="1.4")
#> [1] "0.0000%"   "10.0000%"  "25.0000%"  "100.0000%"
percentage(c(0,-0.1,0.25,-1), fmt="+1.1")
#> [1] "+0.0%"   "-10.0%"  "+25.0%"  "-100.0%"

```
