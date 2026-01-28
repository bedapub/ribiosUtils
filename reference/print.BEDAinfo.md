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
#>    /private/var/folders/kg/7q73ww8s3llgyl61c9z_j5g40000gn/T/RtmpBZcogf/file1f935661502a/reference 
#> [URL]
#>    /private/var/folders/kg/7q73ww8s3llgyl61c9z_j5g40000gn/T/RtmpBZcogf/file1f935661502a/reference 
#> [git]
#>    https://github.com/bedapub/ribiosUtils 
#> [User]R
#>       R
#>    runner 
```
