# Column bind by rownames

Column bind by rownames

## Usage

``` r
cbindByRownames(..., type = c("intersect", "union"))

rbindByColnames(..., type = c("intersect", "union"))
```

## Arguments

- ...:

  Two or more matrices, or a list of matrices.

- type:

  Character string, how are row names that are not shared by all items
  handled, either `intersect` (intersect are kept) or `union` (union is
  used, `NA` is inserted whenever necessary)

## Value

A `matrix`

## Examples

``` r
mat1 <- matrix(1:9, nrow=3, byrow=FALSE,
               dimnames=list(LETTERS[1:3], LETTERS[1:3]))
mat2 <- matrix(1:9, nrow=3, byrow=FALSE,
               dimnames=list(LETTERS[2:4], LETTERS[4:6]))
mat3 <- matrix(1:9, nrow=3, byrow=FALSE,
               dimnames=list(LETTERS[c(2,4,5)], LETTERS[7:9]))
cbindByRownames(mat1, mat2, mat3, type="intersect")
#>   A B C D E F G H I
#> B 2 5 8 1 4 7 1 4 7
cbindByRownames(mat1, mat2, mat3, type="union")
#>    A  B  C  D  E  F  G  H  I
#> A  1  4  7 NA NA NA NA NA NA
#> B  2  5  8  1  4  7  1  4  7
#> C  3  6  9  2  5  8 NA NA NA
#> D NA NA NA  3  6  9  2  5  8
#> E NA NA NA NA NA NA  3  6  9
## it is also possible to pass a list
cbindByRownames(list(mat1, mat2, mat3), type="union")
#>    A  B  C  D  E  F  G  H  I
#> A  1  4  7 NA NA NA NA NA NA
#> B  2  5  8  1  4  7  1  4  7
#> C  3  6  9  2  5  8 NA NA NA
#> D NA NA NA  3  6  9  2  5  8
#> E NA NA NA NA NA NA  3  6  9
mat4 <- matrix(1:9, nrow=3, byrow=FALSE,
               dimnames=list(LETTERS[1:3], LETTERS[1:3]))
mat5 <- matrix(1:9, nrow=3, byrow=FALSE,
               dimnames=list(LETTERS[4:6], LETTERS[2:4]))
mat6 <- matrix(1:9, nrow=3, byrow=TRUE,
               dimnames=list(LETTERS[7:9], LETTERS[c(2,4,6)]))
rbindByColnames(mat4, mat5, mat6, type="intersect")
#>   B
#> A 4
#> B 5
#> C 6
#> D 1
#> E 2
#> F 3
#> G 1
#> H 4
#> I 7
rbindByColnames(mat4, mat5, mat6,  type="union")
#>    A B  C  D  F
#> A  1 4  7 NA NA
#> B  2 5  8 NA NA
#> C  3 6  9 NA NA
#> D NA 1  4  7 NA
#> E NA 2  5  8 NA
#> F NA 3  6  9 NA
#> G NA 1 NA  2  3
#> H NA 4 NA  5  6
#> I NA 7 NA  8  9
## it is also possible to pass a list
rbindByColnames(list(mat4, mat5, mat6), type="union")
#>    A B  C  D  F
#> A  1 4  7 NA NA
#> B  2 5  8 NA NA
#> C  3 6  9 NA NA
#> D NA 1  4  7 NA
#> E NA 2  5  8 NA
#> F NA 3  6  9 NA
#> G NA 1 NA  2  3
#> H NA 4 NA  5  6
#> I NA 7 NA  8  9
```
