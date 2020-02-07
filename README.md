*ribiosUtils*: Swiss-army knife for computational biology tasks in drug discovery
===

[![Build Status](https://travis-ci.org/Accio/ribiosUtils.svg?branch=master)](https://travis-ci.org/Accio/ribiosUtils)

## What is *ribiosUtils*?

*ribiosUtils* is a R package that performs various routine tasks for bioinformatics and computational biology research in drug discovery.

*ribiosUtils* is distributed under the GPL-3 license.

## Installation

Run following commands in the R console.

```{R}
library(devtools)
devtools::install_github("Accio/ribiosUtils")
```

## History

*ribiosUtils* is part of the *ribios* software suite (*ribios* stands for *R* *i*nterface to *BIOS*). The package was previously a sub-directory of the *ribios* project. 

Starting from version 1.3-0 (2020 Jan 02), it exists independently as a stand-alone repository. From version 1.4-0 (2020 Feb 07), it includes all codes required to compile across platforms (previously in `ribiosBase`).

It started as a R implementation of the BIOS library, publicly known as Bioinfo-C library, developed by Clemens Broger *et al.* at F. Hoffmann-La Roche for many years. Since its inception in 2012, many functionalities have been added, which are implemented in either C (or C++) or R. 

The compilation under Windows 7 was tested successfully on 2019-01-03.

## Contact

[Jitao David Zhang](mailto:jitao_david.zhang@roche.com)
