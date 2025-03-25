#!/usr/bin/env Rscript

## install ribios packages from github

if(require("devtools") && require("BiocManager")) {
  install_github("bedapub/ribiosUtils", upgrade="never")
  install_github("bedapub/ribiosGraph", upgrade="never")
  install_github("bedapub/ribiosIO", upgrade="never")
  install_github("bedapub/ribiosArg", upgrade="never")
  install_github("bedapub/ribiosMath", upgrade="never")
  install_github("bedapub/ribiosPlot", upgrade="never")
  install_github("bedapub/ribiosAnnotation", upgrade="never")

  BiocManager::install(c("edgeR", "limma", "Biobase", "latticeExtra", "globaltest", "data.table",
			 "ComplexHeatmap", "vsn", "made4", 
			 "igraph", "sva", "gage"), update=FALSE)
  install_github("bedapub/ribiosExpression", upgrade="never")
  install_github("bedapub/ribiosGSEA", upgrade="never")
  install_github("bedapub/ribiosNGS", upgrade="never")
  install_github("bedapub/ribiosROGER", upgrade="never")
  install_github("bedapub/ribiosBioMart", upgrade="never")
} else {
  stop("Please install 'devtools' and 'BiocManager' first!")
}
