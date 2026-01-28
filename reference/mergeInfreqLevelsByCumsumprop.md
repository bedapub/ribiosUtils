# Merge infrequent levels by setting the threshold of the proportion of cumulative sum over sum a.k.a. cumsumprop

Merge infrequent levels by setting the threshold of the proportion of
cumulative sum over sum a.k.a. cumsumprop

## Usage

``` r
mergeInfreqLevelsByCumsumprop(
  classes,
  thr = 0.9,
  mergedLevel = "others",
  returnFactor = TRUE
)
```

## Arguments

- classes:

  Character strings or factor.

- thr:

  Numeric, between 0 and 1, how to define frequent levels. Default: 0.9,
  namely levels which make up over 90% of all instances.

- mergedLevel:

  Character, how the merged level should be named.

- returnFactor:

  Logical, whether the value returned should be coereced into a factor.

## Value

A character string vector or a factor, of the same length as the input
`classes`, but with potentially fewer levels.

## Note

In case only one class is deemed as infrequent, its label is unchanged.

## Examples

``` r
set.seed(1887)
myVals <- sample(c(rep("A", 4), rep("B", 3), rep("C", 2), "D"))
## in the example below, since A, B, C make up of 90% of the total,
## D is infrequent. Since it is alone, it is not merged
mergeInfreqLevelsByCumsumprop(myVals, 0.9) 
#>  [1] C A D B C B A A A B
#> Levels: A B C D
mergeInfreqLevelsByCumsumprop(myVals, 0.9, returnFactor=FALSE) ## return characters
#>  [1] "C" "A" "D" "B" "C" "B" "A" "A" "A" "B"
## in the example below, since A and B make up 70% of the total, 
## and A, B, C 90%, they are all frequent and D is infrequent. 
## Following the logic above, no merging happens
mergeInfreqLevelsByCumsumprop(myVals, 0.8)
#>  [1] C A D B C B A A A B
#> Levels: A B C D
mergeInfreqLevelsByCumsumprop(myVals, 0.7) ## A and B are left, C and D are merged
#>  [1] others A      others B      others B      A      A      A      B     
#> Levels: A B others
mergeInfreqLevelsByCumsumprop(myVals, 0.5) ## A and B are left, C and D are merged
#>  [1] others A      others B      others B      A      A      A      B     
#> Levels: A B others
mergeInfreqLevelsByCumsumprop(myVals, 0.4) ## A is left
#>  [1] others A      others others others others A      A      A      others
#> Levels: A others
mergeInfreqLevelsByCumsumprop(myVals, 0.3) ## A is left
#>  [1] others A      others others others others A      A      A      others
#> Levels: A others
```
