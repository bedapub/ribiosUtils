# Check dimensionality of both design and contrast matrix

Check dimensionality of both design and contrast matrix

## Usage

``` r
assertDesignContrast(nsample, design, contrast)
```

## Arguments

- nsample:

  Integer, number of samples

- design:

  Design matrix

- contrast:

  Contrast matrix

## Value

Side effect is used: the function stops if there are errors in the
dimensionalities

## See also

[`assertDesign`](https://bedapub.github.io/ribiosUtils/reference/assertDesign.md),
[`assertContrast`](https://bedapub.github.io/ribiosUtils/reference/assertContrast.md)

## Examples

``` r
nsample <- 4
design <- matrix(1:20, ncol=5)
contrast <- matrix(c(-1,1,0,0,0, 0,1,0,-1,0), nrow=5)
assertDesignContrast(nsample, design, contrast)
```
