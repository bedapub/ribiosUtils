# Print BEDAinfo object

Print BEDAinfo object

## Usage

``` r
# S3 method for class 'BEDAinfo'
print(x, ...)
```

## Arguments

- x:

  A BEDA info object, returned by
  [`bedaInfo`](https://bedapub.github.io/ribiosUtils/reference/bedaInfo.md)

- ...:

  Ignored

## Value

Invisible `NULL`, only side effect is used

## Examples

``` r
print(bedaInfo())
#> A Pharmaceutical Sciences (PS) Bioinformatics and Exploratory Data Analysis (BEDA) project
#> 
#> [pstore path]
#>    /private/var/folders/t5/f77_gwnj6p95qxy9py3fckx00000gn/T/Rtmp9ttXwa/file353b43037830/reference 
#> [URL]
#>    /private/var/folders/t5/f77_gwnj6p95qxy9py3fckx00000gn/T/Rtmp9ttXwa/file353b43037830/reference 
#> [git]
#>    https://github.com/bedapub/ribiosUtils 
#> [User]R
#>       R
#>    runner 
```
