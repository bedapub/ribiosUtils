#' Remove rows in a matrix that contains one or more NAs
#' @param mat A matrix
#' @return A matrix, with rows containing one or more NAs removed
#' @examples 
#' myMat <- matrix(c(1:9, NA, 10:17), nrow=6, byrow=TRUE,
#'   dimnames=list(sprintf("R%d", 1:6), sprintf("C%d", 1:3)))
#' removeRowsWithNA(myMat)
#' @export
removeRowsWithNA <- function(mat) {
  isAnyNA <- apply(mat, 1, function(x) any(is.na(x)))
  res <- mat[!isAnyNA,,drop=FALSE]
  return(res)
}

#' Remove columns in a matrix that contains one or more NAs
#' @param mat A matrix
#' @return A matrix, with columns containing one or more NAs removed
#' @examples 
#' myMat <- matrix(c(1:9, NA, 10:17), nrow=6, byrow=TRUE,
#'   dimnames=list(sprintf("R%d", 1:6), sprintf("C%d", 1:3)))
#' removeColumnsWithNA(myMat)
#' @export
removeColumnsWithNA <- function(mat) {
  isAnyNA <- apply(mat, 2, function(x) any(is.na(x)))
  res <- mat[,!isAnyNA,drop=FALSE]
  return(res)
}
