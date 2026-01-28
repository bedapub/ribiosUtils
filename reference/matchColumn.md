# Match a column in data.frame to a master vector

Given a vector known as master vcector, a data.frame and one column of
the data.frame, the function `matchColumnIndex` matches the values in
the column to the master vector, and returns the indices of each value
in the column with respect to the vector. The function `matchColumn`
returns whole or subset of the data.frame, with the matching column in
the exact order of the vector.

## Usage

``` r
matchColumn(vector, data.frame, column, multi = FALSE)
```

## Arguments

- vector:

  A vector, probably of character strings.

- data.frame:

  A `data.frame` object

- column:

  The column name (character) or index (integer between 1 and the column
  number), indicating the column to be matched. Exceptionally `0` is as
  well accepted, which will match the row names of the `data.frame` to
  the given vector.

- multi:

  Logical, deciding what to do if a value in the vector is matched to
  several values in the data.frame column. If set to `TRUE`, all rows
  containing the matched value in the specified column are returned;
  otherwise, when the value is set to `FALSE`, one arbitrary row is
  returned. See details and examples below.

## Value

For `matchColumnIndex`, if `multi` is set to `FALSE`, an integer vector
of the same length as the master vector, indicating the order of the
`data.frame` rows by which the column can be re-organized into the
master vector. When `multi` is `TRUE`, the returning object is a list of
the same length as the master vector, each item containing the index
(indices) of data.frame rows which match to the master vector.

For `matchColumn`, a data.frame is always returned. In case
`multi=FALSE`, the returning data frame has the same number of rows as
the length of the input master vector, and the column which was
specified to match contains the master vector in its order. If
`multi=TRUE`, returned data frame can contain equal or more numbers of
rows than the master vector, and multiple-matched items are repeated.

## Details

See more details below.

The function is used to address the following question: how can one
order a `data.frame` by values of one of its columns, the order for
which is given in a vector (known as “master vector”).
`matchColumnIndex` and `matchColumn` provide thoroughly-tested
implementation to address this question.

For `one-to-one` cases, where both the column and the vector have no
duplicates and can be matched one-to-one, the question is
straightforward to solve with the `match` function in R. In
`one-to-many` or `many-to-many` matching cases, the parameter `multi`
determines whether multiple rows matching the same value should be
shown. If `mutli=FALSE`, then the sorted data.frame that are returned
has exactly the same row number as the input vector; otherwise, the
returned data.frame has more rows. See the examples below.

In either case, in the returned `data.frame` object by `matchColumn`,
values in the column used for matching are overwritten by the master
vector.If `multi=TRUE`, the order of values in the column is also
obeying the order of the master vector, with exceptions of repeating
values casued by mutliple matching.

The `column` parameter can be either character string or non-negative
integers. In the exceptional case, where `column=0L` (“L” indicates
integer), the row names of the `data.frame` is used for matching instead
of any of the columns.

Both functions are NA-friendly, since NAs in neither vector nor column
should break the code.

## Note

When `multi=TRUE`, the indices within each list element (for
`matchColumnIndex`) are returned in ascending order.

## See also

See [`match`](https://rdrr.io/r/base/match.html) for basic matching
operations.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
df <- data.frame(Team=c("HSV", "BVB", "HSC", "FCB", "HSV"),
                 Pkt=c(25,23,12,18,21),
                 row.names=c("C", "B", "A", "F", "E"))
teams <- c("HSV", "BVB", "BRE", NA)
ind <- c("C", "A", "G", "F", "C", "B", "B", NA)

matchColumnIndex(teams, df, 1L, multi=FALSE)
#> [1]  1  2 NA NA
matchColumnIndex(teams, df, 1L, multi=TRUE)
#> $HSV
#> [1] 1 5
#> 
#> $BVB
#> [1] 2
#> 
#> $BRE
#> [1] NA
#> 
#> $<NA>
#> [1] NA
#> 
matchColumnIndex(teams, df, "Team", multi=FALSE)
#> [1]  1  2 NA NA
matchColumnIndex(teams, df, "Team", multi=TRUE)
#> $HSV
#> [1] 1 5
#> 
#> $BVB
#> [1] 2
#> 
#> $BRE
#> [1] NA
#> 
#> $<NA>
#> [1] NA
#> 
matchColumnIndex(teams, df, 0, multi=FALSE)
#> [1] NA NA NA NA
matchColumnIndex(ind, df, 0, multi=FALSE)
#> [1]  1  3 NA  4  1  2  2 NA
matchColumnIndex(ind, df, 0, multi=TRUE)
#> $C
#> [1] 1
#> 
#> $A
#> [1] 3
#> 
#> $G
#> [1] NA
#> 
#> $F
#> [1] 4
#> 
#> $C
#> [1] 1
#> 
#> $B
#> [1] 2
#> 
#> $B
#> [1] 2
#> 
#> $<NA>
#> [1] NA
#> 

matchColumn(teams, df, 1L, multi=FALSE)
#>      Team Pkt
#> C     HSV  25
#> B     BVB  23
#> NA    BRE  NA
#> NA.1 <NA>  NA
matchColumn(teams, df, 1L, multi=TRUE)
#>      Team Pkt
#> C     HSV  25
#> E     HSV  21
#> B     BVB  23
#> NA    BRE  NA
#> NA.1 <NA>  NA
matchColumn(teams, df, "Team", multi=FALSE)
#>      Team Pkt
#> C     HSV  25
#> B     BVB  23
#> NA    BRE  NA
#> NA.1 <NA>  NA
matchColumn(teams, df, "Team", multi=TRUE)
#>      Team Pkt
#> C     HSV  25
#> E     HSV  21
#> B     BVB  23
#> NA    BRE  NA
#> NA.1 <NA>  NA
matchColumn(ind, df, 0, multi=FALSE)
#>   Team Pkt
#> 1  HSV  25
#> 2  HSC  12
#> 3 <NA>  NA
#> 4  FCB  18
#> 5  HSV  25
#> 6  BVB  23
#> 7  BVB  23
#> 8 <NA>  NA
matchColumn(ind, df, 0, multi=TRUE)
#>   Team Pkt
#> 1  HSV  25
#> 2  HSC  12
#> 3 <NA>  NA
#> 4  FCB  18
#> 5  HSV  25
#> 6  BVB  23
#> 7  BVB  23
#> 8 <NA>  NA
```
