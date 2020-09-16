#' Calculate correlation coefficients using common rows of the two matrices
#' @param mat1 A numeric matrix
#' @param mat2 Another numeric matrix
#' @param ... Passed \code{cor}
#' At least two rows of both matrices must share the same names, otherwise the
#' function will report an error.
#' @return A matrix of the dimension \eqn{m \times n}{m x n}, where \code{m} and \code{n} are 
#' number of columns in \code{mat1} and \code{mat2}, respectively. The matrix has an attribute, \code{commonRownames}, giving the
#' common rownames shared by the two matrices.
#' @examples 
#' myMat1 <- matrix(rnorm(24), nrow=6, byrow=TRUE,
#'   dimnames=list(sprintf("R%d", 1:6), sprintf("C%d", 1:4)))
#' myMat2 <- matrix(rnorm(35), nrow=7, byrow=TRUE,
#'   dimnames=list(sprintf("R%d", 7:1), sprintf("C%d", 1:5)))
#' corByRownames(myMat1, myMat2)
#' @importFrom stats cor
#' @export
corByRownames <- function(mat1, mat2, ...) {
  stopifnot(!is.null(rownames(mat1)) &&
              !is.null(rownames(mat2)))
  commonFeat <- intersect(rownames(mat1), rownames(mat2))
  stopifnot(length(commonFeat)>=2)
  res <- stats::cor(mat1[commonFeat,], 
             mat2[commonFeat,], ...)
  attr(res, "commonRownames") <- commonFeat
  return(res)
}
