# Cumulative Jaccard Index

Cumulative Jaccard Index

## Usage

``` r
cumJaccardIndex(list)

cumJaccardDistance(list)
```

## Arguments

- list:

  A list of characters or integers

## Value

The cumulative Jaccard Index, a vector of values between 0 and 1, of the
same length as the input list

The cumulative Jaccard Index is calculated by calculating the Jaccard
Index of element `i` and the union of elements between `1` and `i-1`.
The cumulative Jaccard Index of the first element is set as 0.0.

The cumulative Jaccard distance is defined in almost the same way, with
the only difference the distance is returned. The value of the first
element is 1.0.

## Note

An advantage of using cumulative overlap coefficient over cumulative
Jaccard Index is that it is monotonic: the value is garanteed to
decrease from 1 to 0, whereas the cumulative Jaccard Index may not be
monotic.

## See also

[`cumOverlapCoefficient`](https://bedapub.github.io/ribiosUtils/reference/cumOverlapCoefficient.md)

## Examples

``` r
myList <- list(first=LETTERS[1:5], second=LETTERS[6:10], third=LETTERS[8:12], fourth=LETTERS[1:12])
cumJaccardIndex(myList)
#> [1] 0.00 0.00 0.25 1.00
cumJaccardDistance(myList)
#> [1] 1.00 1.00 0.75 0.00
```
