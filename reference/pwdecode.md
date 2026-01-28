# Decode password with function implemented with pwencode

Decode password encypted with pwencode.

## Usage

``` r
pwdecode(password)
```

## Arguments

- password:

  Character string to be decoded. If starting with a empty character,
  the string is sent for decoding; otherwise, it is deemed as clear text
  password and returned.

## Value

Decoded character string, or empty string if decoding fails

## Details

See pwdecode function documentation in BIOS for implemetnation details.

Note that since R does not support strings embedding null values
(`\000`), the password to be decoded has to be given with two slashes,
e.g. ‘ \001\000\129\235’.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>. The C library code
was written by Detlef Wolf.

## Examples

``` r
mycode <- " \\001\\000\\141\\314\\033\\033\\033\\033\\033\\142\\303\\056\\166\\311\\037\\042"
pwdecode(mycode)
#> [1] "HSV"
```
