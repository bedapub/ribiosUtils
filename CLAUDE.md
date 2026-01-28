# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working
with code in this repository.

## Overview

ribiosUtils is an R package providing utilities for computational
biology and bioinformatics in drug discovery. It serves as an R
interface to the BIOS (Bioinfo-C) library from F. Hoffmann-La Roche.

## Build Commands

``` bash
make roxygenise    # Generate roxygen documentation
make test          # Run tests with devtools
make build         # Build package distribution (runs roxygenise first)
make install       # Install package locally (runs roxygenise first)
make check         # Run R CMD check (runs clean and roxygenise first)
make clean         # Clean build artifacts (*.o, *.so, *.dll in src/)
```

Alternative R commands:

``` r
devtools::load_all()     # Load package for development
devtools::test()         # Run testthat tests
devtools::check()        # Full R CMD check
devtools::document()     # Generate documentation
```

## Architecture

### R Code (`R/`)

~50 R source files organized by functionality: - **dfmat.R**:
Matrix/data frame operations (asNumMatrix, sortByDimnames,
cbindByRownames, matrix2longdf) - **jaccardIndex.R**: Set similarity
metrics (jaccardIndex, overlapCoefficient, pairwise variants) -
**matchColumn.R**: Column matching utilities (mmatch, matchColumn -
C-accelerated) - **summarizeRows.R**: Row/column summarization
functions - **string.R**: String manipulation (trim, shortenStr,
strtoken) - **factor.R**: Factor operations (dfFactor, relevels,
ofactor) - **scripting.R**: Script utilities (scriptInit, setDebug,
verbose) - **file_dir.R**: File/directory assertions and creation -
**pScore.R**: P-value scoring transformations - **writeLog.R**: Logging
mechanism (registerLog, doLog, writeLog)

### C Code (`src/`)

~52 C source files from the BIOS library (~29K lines).
Performance-critical operations: - `mmatch.c`: Multiple matching (backs
R mmatch function) - `trim.c`: String trimming - `pwdecode.c`: Password
encoding/decoding

C headers available at `inst/include/` for use by other R packages.

### Testing (`tests/`)

- Modern tests: `tests/testthat/test_*.R` using testthat framework
- Run with `make test` or
  [`devtools::test()`](https://devtools.r-lib.org/reference/test.html)

## Key Exports (156 total)

Most frequently used function categories: - Matrix/data frame:
`asNumMatrix`, `sortByDimnames`, `cbindByRownames`,
`removeColumnsWithNA` - Matching: `mmatch`, `matchColumn`, `imatch`
(case-insensitive) - Set operations: `jaccardIndex`,
`overlapCoefficient`, `mset`, `munion`, `mintersect` - Validation:
`haltifnot`, `assertFile`, `assertDir`, `assertColumnName` - Utilities:
`ulen` (unique length), `uniqueNonNA`, `headtail`, `silencio`

## Dependencies

- R \>= 3.4.0
- Base packages: methods, stats, utils
- Suggested: testthat (for testing)
- No external C library dependencies (BIOS code is included)

## CI/CD

GitHub Actions workflow (`.github/workflows/standard-ci-workflow.yml`)
runs R CMD check on: - Windows (R release) - macOS (R release & devel) -
Ubuntu (R release)

## Additional checks for CRAN submission

When submitted to CRAN, R packages are checked with the guidelines
defined in [CRAN
Cookbook](https://contributor.r-project.org/cran-cookbook/). Please
check the code with the guidelines and make corresponding changes.
