# Relevel a factor by a unnamed vector.

If names contain character strings other than the levels in the old
factor and warning is set to `TRUE`, a warning will be raised

## Usage

``` r
relevelsByNotNamedVec(
  x,
  refs,
  missingLevels = c("pass", "warning", "error"),
  unrecognisedLevels = c("warning", "pass", "error")
)
```

## Arguments

- x:

  A factor

- refs:

  A unnamed vector. The values of the vector are levels of `x`.

- missingLevels:

  Actions taken in case existing levels are missing: 'pass', 'warning',
  or 'error'.

- unrecognisedLevels:

  Actions taken in case unrecognised levels are found: 'pass',
  'warning', or 'error'.

## Value

A vector of factor

## Examples

``` r
oldFactor <- factor(c("A", "B", "A", "C", "B"), levels=LETTERS[1:3])
refLevels <- c("B", "C", "A")
newFactor <- relevelsByNotNamedVec(oldFactor, refLevels)
stopifnot(identical(newFactor, factor(c("A", "B", "A", "C", "B"), levels=c("B", "C", "A"))))
## TODO: test warning and error

```
