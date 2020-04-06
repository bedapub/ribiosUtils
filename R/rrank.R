#' Reverse rank order
#' @param x A numeric, complex, character or logical vector
#' @param ... Passed to \code{\link{rank}}
#' 
#' @return A vector of numbers of the same length as the input, 
#'     giving reverse rank orders.
#'     
#' The function returns the reverse rank order, i.e. in the descending order
#' 
#' @seealso \code{\link{rank}}
#' @examples 
#' testVec <- c(3,6,4,5)
#' rank(testVec)
#' rrank(testVec)
#' @export
rrank <- function(x, ...) UseMethod("rrank")


#' @rdname rrank
#' @export
rrank.default <- function(x, ...) return(length(x) - rank(x, ...) + 1)

#' Get reverse rank orders in each column
#' 
#' @param x A matrix
#' @param ... Passed to \code{\link{rank}}
#' @return  A matrix of the same dimension and attributes of the input matrix, 
#'   with reverse rank orders of each column
#'   
#' @examples 
#' testMatrix <- matrix(c(3,6,4,5,2,4,8,3,2,5,4,7), ncol=3, byrow=FALSE)
#' rrank(testMatrix)
#' @export
rrank.matrix <- function(x, ...) {
  res <- apply(x, 2, rrank.default)
  attributes(res) <- attributes(x)
  return(x)
}

#' Return a matrix that highlights reverse rank orders of features of interest by column
#' 
#' @param matrix A matrix
#' @param ind An integer vector or a logical vector that gives the index
#' @param inValue Value to highlight the reverse ranks indexed by \code{ind}, 
#'   see details below
#' @param outValue Values assigned to other values not indexed by \code{ind}
#' @param ... Passed to \code{\link{rank}}
#' 
#' @return A matrix of the same dimension and attributes of the input matrix,
#'      each column contains a vector of \code{inValue} and \code{outValue}. 
#'      Positions that match the reverse ranks of matrix values indexed by 
#'      \code{ind} are assigned the \code{inValue}, otherwise, 
#'      the \code{outValue}.
#'      
#' The function can be used to visualize the reverse ranks of
#' features of interest (rows of the input matrix) in each sample (columns of 
#' the input matrix). This is for instance useful for rank plots of features for
#' gene-set enrichment analysis.
#' 
#' Imagine that all features indexed by \code{ind} are the larger than 
#' all other features in each sample, then the returned matrix will have 
#' value \code{1} in the first rows (the number determined by the features 
#' indxed by \code{ind}), and \code{0} in the rest rows.
#' 
#' @seealso \code{\link{rank}}
#' @examples 
#' testMatrix <- matrix(c(3,6,4,5,2,4,8,3,2,5,4,7), ncol=3, byrow=FALSE)
#' print(testMatrix)
#' testInd <- c(2,4)
#' ## verify that the command below returns 1 in positions occupied by 
#' ## the reverse ranks of the values indexed by testInd
#' rrankInd(testMatrix, testInd)
#' testIndBool <- c(FALSE, TRUE, FALSE, TRUE)
#' rrankInd(testMatrix, testIndBool)
#' @export
rrankInd <- function(matrix, ind, inValue=1L, outValue=0L, ...) {
  ranks <- apply(matrix, 2, function(x) {
    revRank <- rrank(x, ...)
    res <- rep(outValue, length(x))
    res[revRank[ind]] <- inValue
    return(res)
  })
  attributes(ranks) <- attributes(matrix)
  return(ranks)
}
