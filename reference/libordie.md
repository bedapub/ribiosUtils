# Load a library mutedly and quit (die) in case of failing

The specified library is loaded mutedly by suppressing all messages. If
the library is not found, or its version under the specification of
`minVer`, the R session dies with a message.

## Usage

``` r
libordie(package, minVer, missing.quit.status = 1, ver.quit.status = 1)
```

## Arguments

- package:

  One package name (can be character or non-quoted symbol (see examples)

- minVer:

  Optional, character string, the minimum working version

- missing.quit.status:

  Integer, the status of quitting when the package was not found

- ver.quit.status:

  Integer, the status of quitting when the package was found, but older
  than the minimum working version

## Value

`NULL` if success, otherwise the session will be killed.

## Details

Only one package should be tested once.

## See also

The function calls
[`qqmsg`](https://bedapub.github.io/ribiosUtils/reference/qqmsg.md)
internally to kill the session

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
libordie(stats)
libordie("methods")
libordie(base, minVer="2.15-1")
```
