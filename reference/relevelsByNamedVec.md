# Relevel a factor by a named vector.

If names contain character strings other than the levels in the old
factor and warning is set to `TRUE`, a warning will be raised.

## Usage

``` r
relevelsByNamedVec(
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

  A named vector. The names of the vector are all or a subset of levels
  in the old factor. And the values are new levels

- missingLevels:

  Actions taken in case existing levels are missing: 'pass', 'warning',
  or 'error'.

- unrecognisedLevels:

  Actions taken in case unrecognised levels are found: 'pass',
  'warning', or 'error'.

## Value

A vector of factor

## Details

The levels of the factor are the names of the `ref` vector, and the
order of the `ref` vector matters: it is the levels of the new factor.

## Examples

``` r
oldFactor <- factor(c("A", "B", "A", "C", "B"), levels=LETTERS[1:3])
factorDict <- c("A"="a", "B"="b", "C"="c")
newFactor <- relevelsByNamedVec(oldFactor, factorDict)
stopifnot(identical(newFactor, factor(c("a", "b", "a", "c", "b"), levels=c("a", "b", "c"))))
## TODO: test warning and error
```
