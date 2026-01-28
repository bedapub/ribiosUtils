# Check dimensionality of design matrix

Check dimensionality of design matrix

## Usage

``` r
assertDesign(nsample, design)
```

## Arguments

- nsample:

  Integer, number of samples

- design:

  Design matrix

## Value

Side effect is used: the function stops if sample size does not equal
ncol(matrix)

## Examples

``` r
nsample <- 4
design <- matrix(1:20, ncol=5)
assertDesign(nsample, design)
```
