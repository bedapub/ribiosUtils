# Get the base and extension(s) of file name(s)

Many files have base and extensions in their names, for instance for the
file `mybook.pdf`, the base is `mybook` and the extension is `pdf`.
`basefilename` `extname` functions extract these information from one or
more file names.

## Usage

``` r
extname(x, ifnotfound = NA, lower.case = FALSE)
```

## Arguments

- x:

  Character vector of file names; other classes will be coereced to
  characters

- ifnotfound:

  If no extension name was found, the value to be returned. Default is
  `NA`

- lower.case:

  Logical, should the names returned in lower case?

## Value

The base file name or the extension as characters, of the same length as
the input file name character. In case that a file name does not contain
a extension, `NA` will be returned.

## Note

In case there are multiple dots in the input file name, the last field
will be taken as the extension, and the rest as the base name. For
instance for file `test.out.txt`, returned base name is `test.out` and
extension is `txt`.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
extname("mybook.pdf")
#> [1] "pdf"
extname("sequence.in.fasta")
#> [1] "fasta"
extname(c("/path/mybook.pdf", "test.doc"))
#> [1] "pdf" "doc"
extname("README")
#> [1] NA
extname("README", ifnotfound="")
#> [1] ""
extname("/path/my\ home/Holiday Plan.txt")
#> [1] "txt"

basefilename("mybook.pdf")
#> [1] "mybook"
basefilename("sequence.in.fasta")
#> [1] "sequence.in"
basefilename(c("/path/mybook.pdf", "test.doc"))
#> [1] "mybook" "test"  
basefilename("README")
#> [1] "README"
basefilename("/path/my\ home/Holiday Plan.txt")
#> [1] "Holiday Plan"

basefilename("myBook.pdf", lower.case=TRUE)
#> [1] "mybook"
extname("myBook.PDF", lower.case=TRUE)
#> [1] "pdf"
```
