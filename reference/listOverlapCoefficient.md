# Pairwise overlap coefficient of lists

Pairwise overlap coefficient of lists

## Usage

``` r
listOverlapCoefficient(x, y = NULL, checkUniqueNonNA = TRUE)
```

## Arguments

- x:

  A list of vectors that are interpreted as sets of elements

- y:

  A list of vectors that are interpreted as sets of elements. In case of
  `NULL`, pairwise overlap coefficient of lists in `x` is returned.

- checkUniqueNonNA:

  Logical, should vectors in the list be first cleaned up so that NA
  values are removed and the elements are made unique? Default is set as
  `TRUE`; if the user is confident that the vectors are indeed valid
  sets, this option can be set as `FALSE` to speed up the code

## Value

A matrix of column-wise pairwise overlap coefficients.

## Examples

``` r
set.seed(1887)
testSets1 <- sapply(rbinom(10, size=26, prob=0.3), 
  function(x) sample(LETTERS, x, replace=FALSE))
names(testSets1) <- sprintf("List%d", seq(along=testSets1))
testSets1Poe <- listOverlapCoefficient(testSets1)
testSets1PoeNoCheck <- listOverlapCoefficient(testSets1, checkUniqueNonNA=FALSE)
stopifnot(identical(testSets1Poe, testSets1PoeNoCheck))

testSets2 <- sapply(rbinom(15, size=26, prob=0.3),
  function(x) sample(LETTERS, x, replace=FALSE))
names(testSets2) <- sprintf("AnotherList%d", seq(along=testSets2))
testSets12Poe <- listOverlapCoefficient(testSets1, testSets2)
```
