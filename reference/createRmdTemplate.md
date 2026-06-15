# Copy the skeleton RMarkdown file to a specified location

This function copies the skeleton RMarkdown template shipped with
`ribiosUtils` to the current working directory (or any specified path)
under a user-given file name. When no file name is provided, a default
name based on the current date is used.

## Usage

``` r
createRmdTemplate(filename = NULL, overwrite = FALSE)
```

## Arguments

- filename:

  Character string, the name (or path) of the destination file. If
  `NULL` (default), the file is named `Report_[YYYY-DD-MM]-report.Rmd`,
  where the date components reflect the current date.

- overwrite:

  Logical, whether to overwrite an existing file. Default is `FALSE`.

## Value

The path of the copied file (invisible).

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
if (FALSE) { # \dontrun{
## copy with default file name
createRmdTemplate()

## copy with a custom file name
createRmdTemplate("my_analysis.Rmd")
} # }

## copy to a temporary directory
dest <- createRmdTemplate(file.path(tempdir(), "test_report.Rmd"))
#> Skeleton file copied to '/var/folders/bh/cdl3cft92_dbvg852_fp7y7w0000gn/T//Rtmpb3kf3a/test_report.Rmd'
file.exists(dest)
#> [1] TRUE
unlink(dest)
```
