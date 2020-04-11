#' Set boundaries for numeric values, or perform a 0-1 normalization.
#' 
#' The basic concepts of these functions are borrowed from the \code{bound}
#' function in the \code{Qt} framework.
#' 
#' \code{bound} sets the values smaller than \code{low}, or larger than
#' \code{high}, to the value of \code{low} and \code{high} respectively.If no
#' such values exist, the vector or matrix is returned unchanged.
#' 
#' \code{boundNorm} performs a 0-1 normalization. Input vector or matrix is
#' transformed linearly onto the region defined between \code{low} and
#' \code{high}, which has the unit length (1).
#' 
#' @aliases bound boundNorm
#' @param x A numeric vector or matrix
#' @param low New lower boundary
#' @param high New higher boundary
#' @return A numeric vector or matrix, the same type as input.
#' @author Jitao David Zhang <jitao_david.zhang@@roche.com>
#' @examples
#' 
#' myVec <- c(2,4,3,-1,9,5,3,4)
#' bound(myVec, 0, 8)
#' boundNorm(myVec)
#' ## boundNorm returns negative values if input values lie out of the
#' ## given region between low and high
#' boundNorm(myVec, 0, 8)
#' 
#' myMat <- matrix(myVec, nrow=2)
#' myMat
#' bound(myMat, 0, 8)
#' boundNorm(myMat)
#' boundNorm(myMat, 0, 8)
#' 
#' @export bound
bound <- function(x,low,high)  pmin(pmax(x, low),high)

#' @rdname bound
#' @export
boundNorm <- function(x,
                      low = min(x, na.rm=TRUE),
                      high = max(x, na.rm=TRUE)) {
  x <- (x - low)/(high - low)
  x
}

