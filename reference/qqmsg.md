# Quitely Quit with Messages

Quitely quit R with messages in non-interactive sessions

## Usage

``` r
qqmsg(..., status = 0, save = FALSE, runLast = TRUE)
```

## Arguments

- ...:

  Messages to be passed to `message`

- status:

  Quit stats

- save:

  Logical, should current working environment be saved?

- runLast:

  Logical, should `.Last()` be executed?

## Value

Invisible `NULL`, only side effect is used.

## Details

The function prints messages in any case, and quits R if the current
session is non-interactive, e.g. in the command-line running Rscript
mode

## See also

[`quit`](https://rdrr.io/r/base/quit.html)

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
## the example should not run because it will lead the R session to quit
if (FALSE) { # \dontrun{
  qqmsg()
  qqmsg("die", status=0)
  qqmsg("Avada kedavra", status=-1)
  qqmsg("Crucio!", "\n", "Avada kedavra", status=-100)
} # }
```
