# Format labels for wells in microwell plates to equal widths

Format labels for wells in microwell plates to equal widths

## Usage

``` r
equateWellLabelWidth(wells)
```

## Arguments

- wells:

  A vector of character strings indicating well positions, they may be
  of different widths, for instance A1, A10, A12

## Value

A vector of the same length, with all labels adjusted to the equal
width, with left-padding zeros added whenever it makes sense. If the
input labels are already of the same length, no change is applied.

## Examples

``` r
equateWellLabelWidth(c("A1", "C10", "D12"))
#> [1] "A01" "C10" "D12"
```
