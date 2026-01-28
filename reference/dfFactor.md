# Get a factor vector for a data.frame

The function try to assign a factor vector for a `data.frame` object.
See details below.

## Usage

``` r
dfFactor(df, sample.group)
```

## Arguments

- df:

  A `data.frame`

- sample.group:

  A character, number or a vector of factors, from which the factor
  vector should be deciphered. See details below.

## Value

A factor vector with the same length as the `data.frame`

## Details

The function tries to get a factor vector of the same length as the
number of rows in the `data.frame`. The determination is done in the
following order: Step 1: It tries to find a column in the `data.frame`
with the name as given by `sample.group`. If found, this column is
transformed into a factor if not and returned. Step 2: It tries to
interpret the `sample.group` as an integer, as the index of the column
in the `data.frame` giving the factor. Step 3: When `sample.group`
itself is a vector of the same length as the data.frame, it is cast to
factor when it is still not and returned.

Otherwise the program stops with error.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
df <- data.frame(gender=c("M", "M", "F", "F", "M"),
age=c(12,12,14,12,14), score=c("A", "B-", "C", "B-", "A"))
dfFactor(df, "gender")
#> [1] M M F F M
#> Levels: F M
dfFactor(df, "score")
#> [1] A  B- C  B- A 
#> Levels: A B- C
dfFactor(df, 1L)
#> [1] M M F F M
#> Levels: F M
dfFactor(df, 2L)
#> [1] 12 12 14 12 14
#> Levels: 12 14
dfFactor(df, df$score)
#> [1] A  B- C  B- A 
#> Levels: A B- C
```
