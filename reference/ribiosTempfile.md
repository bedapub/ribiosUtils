# A temporary file which (1) every machine in the cluster has access to and (2) there is sufficient space

A temporary file which (1) every machine in the cluster has access to
and (2) there is sufficient space

## Usage

``` r
ribiosTempfile(pattern = "file", tmpdir = ribiosTempdir(), fileext = "")
```

## Arguments

- pattern:

  Character string, file pattern

- tmpdir:

  Character string, temp directory

- fileext:

  CHaracter string, file name extension (suffix)

## Value

a character string of the file name

## See also

[`ribiosTempdir`](https://bedapub.github.io/ribiosUtils/reference/ribiosTempdir.md)
