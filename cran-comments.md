## Test environments

* Local: Linux Mint 21.2 (x86_64), R 4.5.2
* GitHub Actions:
  - Windows (R release)
  - macOS (R release, R devel)
  - Ubuntu (R release, R oldrel)

## R CMD check results

0 errors | 0 warnings | 0 notes

## Notes for CRAN reviewers

This package provides an R interface to the Bioinfo-C (BIOS) library from
F. Hoffmann-La Roche AG. The C source code is included in the package
(src/ directory).

Some functions are designed for internal Roche infrastructure:
- `pwencode`/`pwdecode`: Password encoding/decoding utilities
- `bedaInfo`: BIOS environment information
- `biomicsPstorePath2URL`: Internal path conversion

These functions will work only within the Roche environment but do not
affect the functionality of the remaining ~150 exported functions which
are generally useful for computational biology workflows.
