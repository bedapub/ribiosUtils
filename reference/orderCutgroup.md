# Reorder the groups by their group size

Reorder the groups by their group size

## Usage

``` r
orderCutgroup(groups, decreasing = TRUE)
```

## Arguments

- groups:

  Named vectors of integers as group indices

- decreasing:

  Logical, should the first group be the largest?

  The function permutes a vector of names integers so that the names
  matching the same integer match to the same or another integer, while
  assuring that the permuted group matching the first integer (or the
  last integer if `decreasing` is set to `FALSE`) is the largest group
  by count.
