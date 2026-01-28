# Print messages conditional on the verbose level

The verbose level can be represented by non-negative integers. The
larger the number is, the more verbose is the program: it prints then
more messages for users' information.

## Usage

``` r
verbose(..., global = 1L, this = 1L)
```

## Arguments

- ...:

  Messages to be printed, will be passed to the `message` function

- global:

  Integer, the global verbose level

- this:

  Integer, the verbose level of this message

## Value

The function is used for its side effect by printing messages.

## Details

This function decides whether or not to print a message, dependent on
the global verbose level and the specific level of the message. If the
specific level is larger than the global level, the message is
suppresed; otherwise it is printed. see the details section for an
example.

Suppose the global verbose level is set to `5`, and two messages have
levels of `1` and `7` repsectively. Since `1` suggests a low-threshold
of being verbose, the first message is printed; whereas the message of
level `7` is only printed when the program should run in a more verbose
way (`7,8,9,...{}`), it is suppressed in the current global verbose
level.

## Author

Jitao David Zhang \<jitao_david.zhang@roche.com\>

## Examples

``` r
Gv <- 5L
verbose("Slightly verbosing", global=Gv, this=1L)
#> Slightly verbosing
verbose("Moderately verbosing", global=Gv, this=5L)
#> Moderately verbosing
verbose("Heavily verbosing", global=Gv, this=9L)
```
