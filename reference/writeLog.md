# Write text as log to a connection

The function `writeLog` can be used to log outputs and/or running status
of scripts to *one connection*. To use it one does *not* need to run
`registerLog` first.

## Usage

``` r
writeLog(fmt, ..., con = stdout(), level = 0)
```

## Arguments

- fmt:

  Format string to passed on to sprintf

- ...:

  Parameters passed on to sprintf

- con:

  A connection, for instance a file (or its name) or
  [`stdout()`](https://rdrr.io/r/base/showConnections.html)

- level:

  Logging level: each higher level will add one extra space before the
  message. See examples

## Value

Side effect is used.

## Details

In contrast, `doLog` can be used to log on multiple connections that are
registered by `registerLog`. Therefore, to register logger(s) with
`registerLog` is a prerequisite of calling `doLog`. Internally `doLog`
calls `writeLog` sequentially to make multiple-connection logging.

## See also

`registerLog` to register more than one loggers so that `doLog` can
write to them sequentially.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
## the following code section is not run to prevent issues with pkgdown
if (FALSE) { # \dontrun{
  writeLog("This is the start of a log")
  writeLog("Message 1", level=1)
  writeLog("Message 1.1", level=2)
  writeLog("Message 1.2", level=2)
  writeLog("Message 2", level=1)
  writeLog("Message 3", level=1)
  writeLog("Message 3 (special)", level=4)
  writeLog("End of the log");

  ## log with format
  writeLog("This is Message %d", 1)
  writeLog("Square of 2 is %2.2f", sqrt(2))

  ## NA is handled automatically
  writeLog("This is a not available value: %s", NA, level=1)
  writeLog("This is a NULL value: %s", NULL, level=1)
} # }
```
