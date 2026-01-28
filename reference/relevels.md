# Relevel a factor by a named or unnamed vector.

This function wraps
[`relevelsByNamedVec`](https://bedapub.github.io/ribiosUtils/reference/relevelsByNamedVec.md)
for named vector and
[`relevelsByNotNamedVec`](https://bedapub.github.io/ribiosUtils/reference/relevelsByNotNamedVec.md)
for not named vectors

## Usage

``` r
relevels(
  x,
  refs,
  missingLevels = c("pass", "warning", "error"),
  unrecognisedLevels = c("warning", "pass", "error")
)
```

## Arguments

- x:

  A factor or a character string vector that will be cast into factor

- refs:

  A named vector or unnamed vector.

- missingLevels:

  Actions taken in case existing levels are missing: 'pass', 'warning',
  or 'error'.

- unrecognisedLevels:

  Actions taken in case unrecognised levels are found: 'pass',
  'warning', or 'error'.

## Value

A vector of factor

## See also

[`relevelsByNamedVec`](https://bedapub.github.io/ribiosUtils/reference/relevelsByNamedVec.md)
and
[`relevelsByNotNamedVec`](https://bedapub.github.io/ribiosUtils/reference/relevelsByNotNamedVec.md)

## Examples

``` r
oldFactor <- factor(c("A", "B", "A", "C", "B"), levels=LETTERS[1:3])
refLevels <- c("B", "C", "A")
refDict <- c("A"="a", "B"="b", "C"="c")
newFactor <- relevels(oldFactor, refLevels)
stopifnot(identical(newFactor, factor(c("A", "B", "A", "C", "B"), levels=c("B", "C", "A"))))
newFactor2 <-  relevels(oldFactor, refDict)
stopifnot(identical(newFactor2, factor(c("a", "b", "a", "c", "b"), levels=c("a", "b", "c"))))
```
