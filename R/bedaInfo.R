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
  if(length(gitAddress)==0)
    gitAddress <- NA
  user <- Sys.info()["user"]
  res <- list(PstorePath=pstorePath, 
              URL=url,
              git=gitAddress,
              user=user)
  class(res) <- "BEDAinfo"
  return(res)
}

#' Print BEDAinfo object
#' @param x A BEDA info object, returned by \code{\link{bedaInfo}}
#' @param ... Ignored
#' 
#' @examples 
#' \dontrun{print(bedaInfo())}
#' @export
print.BEDAinfo <- function(x, ...) {
  cat("A Pharmaceutical Sciences (PS) Bioinformatics and Exploratory Data Analysis (BEDA) project\n\n")
  cat("[pstore path]\n  ", x$PstorePath, "\n")
  cat("[URL]\n  ", x$URL, "\n")
  cat("[git]\n  ", x$git, "\n")
  cat("[User]R
      R\n  ", x$user, "\n")
}
