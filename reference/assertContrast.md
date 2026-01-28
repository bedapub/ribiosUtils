# Check dimensionality of contrast matrix

Check dimensionality of contrast matrix

## Usage

``` r
assertContrast(design, contrast)
```

## Arguments

- design:

  Design matrix

- contrast:

  Contrast matrix

## Value

Side effect is used: the function stops if the ncol(design) does not
equal nrow(contrast)

## Examples

``` r
design <- matrix(1:20, ncol=5)
contrast <- matrix(c(-1,1,0,0,0, 0,1,0,-1,0), nrow=5)
assertContrast(design, contrast)
```
