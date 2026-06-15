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
#>    /private/var/folders/bh/cdl3cft92_dbvg852_fp7y7w0000gn/T/Rtmpb3kf3a/file147265697761/reference 
#> [URL]
#>    /private/var/folders/bh/cdl3cft92_dbvg852_fp7y7w0000gn/T/Rtmpb3kf3a/file147265697761/reference 
#> [git]
#>    https://github.com/bedapub/ribiosUtils 
#> [User]R
#>       R
#>    runner 
```
