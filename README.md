*ribiosUtils*: Swiss-army knife for computational biology tasks in drug discovery
===

## What is *ribiosUtils*?

*ribiosUtils* is a R package that performs various routine tasks for bioinformatics and computational biology research in drug discovery.


## Installation

Run following commands in the R console.

```{R}
library(devtools)
devtools::install_github("Accio/ribiosUtils")
```

## History

*ribiosUtils* is part of the *ribios* software suite (*ribios* stands for *R* *i*nterface to *BIOS*). The package was previously a sub-directory of the *ribios* project. Starting from version 1.3.0 (2019-01-02), it exists independently as a stand-alone repository.

It started as a R implementation of the BIOS library, publicly known as Bioinfo-C library, developed by Clemens Broger *et al.* at F. Hoffmann-La Roche for many years. Since its inception in 2012, many functionalities have been added, which are implemented in either C (or C++) or R. 

The compilation under Windows 7 was tested successfully on 2019-01-03.
