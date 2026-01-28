# Cumulative overlap coefficient

Cumulative overlap coefficient

## Usage

``` r
cumOverlapCoefficient(list)

cumOverlapDistance(list)
```

## Arguments

- list:

  A list of characters or integers

## Value

The cumulative overlap coefficients, a vector of values between 0 and 1,
of the same length as the input list

The cumulative overlap coefficient is calculated by calculating the
overlap coefficient of element `i` and the union of elements between `1`
and `i-1`. The cumulative overlap coefficient of the first element is
set as 0.0.

The cumulative overlap distance is defined in almost the same way, with
the only difference the distance is returned. The value of the first
element is 1.0. Pratically it is calculated by
`1-cumOverlapCoefficient`.

Since the denominator of the overlap coefficient is the size of the
smaller set of the two, which is bound to be the size of element `i`,
the cumulative overlap distance can be interpreted as the proportion of
new items in each new element that are unseen in previous elements.
Similarly, the cumulative overlap coefficient can be interpreted as the
proportion of items in each new element that have been seen in previous
elements. See examples below.

## Note

An advantage of using cumulative overlap coefficient over cumulative
Jaccard Index is that it is monotonic: the value is garanteed to
decrease from 1 to 0, whereas the cumulative Jaccard Index may not be
monotic.

## Examples

``` r
myList <- list(first=LETTERS[1:5], second=LETTERS[6:10], third=LETTERS[8:12], fourth=LETTERS[1:12])
cumOverlapCoefficient(myList)
#> [1] 0.0 0.0 0.6 1.0
cumOverlapDistance(myList)
#> [1] 1.0 1.0 0.4 0.0
```
