#' Translate BiOmics-Pathology pstore path to URL
#' @param path Unix path
#' 
#' The URL is only visible inside Roche
#' 
#' @examples 
#' biomicsPstorePath2URL("/pstore/data/biomics/")
#' @export
biomicsPstorePath2URL <- function(path) {
  path <- path.expand(path)
  res <- gsub("/pstore/data", "http://bioinfo.bas.roche.com:8080", path)
  return(res)
}

#' Print BEDA project information
#' 
#' The function is used at the end of the Rmarkdown report to print relevant information to help other colleagues finding relevant resources
#' 
#' @examples 
#' \dontrun{bedaInfo()}
#' @export
bedaInfo <- function() {
  pstorePath <- getwd()
  url <- biomicsPstorePath2URL(pstorePath)
  gitAddress <- system("git remote -v | awk '{if(NR==1) print $2}'", intern=TRUE)
  res <- list(PstorePath=pstorePath, 
              URL=url,
              git=gitAddress)
  return(res)
}
