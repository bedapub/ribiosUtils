# Quietly runs a system command

Quietly runs a system command: the output is internalized and returned
as an invisible variable, and the standard error output is ignored.

## Usage

``` r
qsystem(command)
```

## Arguments

- command:

  A system command

## Value

(Invisibly) the internalized output of the command

## Details

The function runs the system command in a quiet mode. The function can
be useful in CGI scripts, for instance

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
dateIntern <- system("date")
```
