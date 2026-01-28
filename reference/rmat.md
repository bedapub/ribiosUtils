# Remove temporary files at a specified time interval from now

Send a `at` job to remove (probably temporary) files in the future with
a specified time interval from now

## Usage

``` r
rmat(..., days = NULL, hours = NULL, minutes = NULL, dry = TRUE)
```

## Arguments

- ...:

  Files to be removed

- days:

  Numeric, interval in days

- hours:

  Numeric, interval in hours

- minutes:

  Numeric, interval in minutes

- dry:

  Logical, if set to `TRUE`, only the command will be returned and files
  are not really removed.

## Value

(Invisibly) the output of the `at` job.

## Details

The command will delete files, and there is usually no way to get
deleted files back. *So make sure you know what you are doing!*

Days, hours, and minutes can be given in a mixed way: they will be
summed up to give the interval.

## Note

Since the command uses `at` internally, it is unlikely the command will
work in the Windows system “out of box”.

## See also

[`qsystem`](https://bedapub.github.io/ribiosUtils/reference/qsystem.md)
for running system commands quietly.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
tmp1 <- tempfile()
tmp2 <- tempfile()
rmat(tmp1, tmp2, minutes=1)
#> [1] "echo rm -f /var/folders/kg/7q73ww8s3llgyl61c9z_j5g40000gn/T//RtmpBZcogf/file1f93225d0ce5 /var/folders/kg/7q73ww8s3llgyl61c9z_j5g40000gn/T//RtmpBZcogf/file1f93af9a003 | at now + 1 minutes"
```
