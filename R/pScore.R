#' Replace p-values of zero
#' @param p A numeric vector, containing p-values. Zero values will be replaced by a small, non-zero value.
#' @param factor A numeric vector, the minimal p-value will be multiplied by it. Useful for \code{pQnormScore}, because there the p-value needs to be divided by two, therefore a factor of two makes sense.
#' 
#' @return A numeric vector of the same length as the input vector, with zeros replaced by the minimal absolute double value defined by the machine multiplied by the factor.
#' 
#' @notes Values under the minimal positive double value are considered zero and replaced.
#' 
#' @examples 
#' ps <- seq(0,1,0.1)
#' replaceZeroPvalue(ps)
#' replaceZeroPvalue(ps, factor=2)
#' @export
replaceZeroPvalue <- function(p, factor=1) {
  isZero <- !is.na(p) & (p==0 | p<.Machine$double.xmin)
  if(any(isZero)) {
      p[isZero] <- .Machine$double.xmin * factor
  }
  return(p)
}

#' Transform p-values to continuous scores with the absolute-log10 transformation
#' 
#' The function maps p values between 0 and 1 to continuous scores ranging on \code{R} by the following equation: \eqn{abs(log10(p))*sign}
#' 
#' @param p \emph{p}-value(s) between (0,1]
#' @param sign Sign of the score, either positive (in case of positive
#' numbers), negative (in case of negative numbers), or zero.  In case a
#' logical vector, \code{TRUE} is interpreted as positive and \code{FALSE} is
#' interpreted as negative.
#' @param replaceZero Logical, whether to replace zero p-values with the 
#' minimal double value specified by the machine. Default is \code{TRUE}. If 
#' set to \code{FALSE}, results will contain infinite values. 
#' @examples
#' 
#' testPvals <- c(0.001, 0.01, 0.05, 0.1, 0.5, 1)
#' pAbsLog10Score(testPvals)
#' testPvalSign <- rep(c(-1,1), 3)
#' pAbsLog10Score(testPvals, sign=testPvalSign)
#' testLog <- rep(c(TRUE, FALSE),3)
#' pAbsLog10Score(testPvals, testLog)
#' 
#' @seealso \code{\link{pQnormScore}}, \code{\link{pScore}}, \code{\link{replaceZeroPvalue}}
#' @export pAbsLog10Score
pAbsLog10Score <- function(p, sign=1, replaceZero=TRUE) {
  if(replaceZero) {
    p <- replaceZeroPvalue(p, factor=1)
  }
  if(is.logical(sign))
     sign <- ifelse(sign, 1, -1)
  return(abs(log10(p)) * sign(sign))
}

#' Transform p-values to continuous scores with the quantile function of the normal distribution
#'
#' Quantile function, also known as the inverse of cumulative distribution function of the normal 
#' distribution, is used to map p-values to continuous scores raging on \eqn{R}. The signs of the 
#' resulting scores are positive by default and are determined by the parameter \code{sign}.
#'
#' @param p \emph{p}-value(s) between \eqn{(0,1]}
#' @param sign Signs of the scores, either positive (in case of positive numbers),
#' negative (in case of negative numbers), or zero. In case of a logical vector,
#' \code{TRUE} is interpreted as positive and \code{FALSE} is interpreted as negative.
#' @param replaceZero Logical, whether to replace zero p-values with the 
#' minimal double value specified by the machine. Default is \code{TRUE}. If 
#' set to \code{FALSE}, results will contain infinite values. 
#'
#' @examples
#' testPvals <- c(0.001, 0.01, 0.05, 0.1, 0.5, 1)
#' pQnormScore(testPvals)
#' testPvalSign <- rep(c(-1,1), 3)
#' pQnormScore(testPvals, sign=testPvalSign)
#' testLog <- rep(c(TRUE, FALSE),3)
#' pQnormScore(testPvals, testLog)
#' 
#' @seealso \code{\link{pAbsLog10Score}}, \code{\link{pScore}}, \code{\link{double}}
#' @export pQnormScore
pQnormScore <- function(p, sign=1, replaceZero=TRUE) {
  if(replaceZero) {
    p <- replaceZeroPvalue(p, factor=2)
  }
  if(is.logical(sign))
    sign <- ifelse(sign, 1, -1)
  res <- abs(qnorm(p/2)) * sign(sign)
  return(res)
}

#' Transform p-values to continuous scores
#' 
#' The function wraps other functions to map \emph{p} values ranging on \eqn{(0,1]}
#' to continuous scores ranging on \eqn{R} in a number of ways.
#' 
#' @param p \emph{p}-value between (0,1]
#' @param sign Sign of the score, either positive (in case of positive
#' numbers), negative (in case of negative numbers), or zero.  In case a
#' logical vector, \code{TRUE} is interpreted as positive and \code{FALSE} is
#' interpreted as negative.
#' @param method Currently available methods include \code{qnorm} and \code{absLog10}.
#' @param replaceZero Logical, whether to replace zero p-values with the 
#' minimal double value specified by the machine. Default is \code{TRUE}. If 
#' set to \code{FALSE}, results will contain infinite values. 
#' @examples
#' 
#' testPvals <- c(0.001, 0.01, 0.05, 0.1, 0.5, 1)
#' pScore(testPvals, method="absLog10")
#' pScore(testPvals, method="qnorm")
#' testPvalSign <- rep(c(-1,1), 3)
#' pScore(testPvals, sign=testPvalSign, method="absLog10")
#' pScore(testPvals, sign=testPvalSign, method="qnorm")
#' testLog <- rep(c(TRUE, FALSE),3)
#' pScore(testPvals, testLog, method="absLog10")
#' pScore(testPvals, testLog, method="qnorm")
#' 
#' testPvals <- 10^seq(-5, 0, 0.05)
#' plot(pScore(testPvals, method="qnorm"),
#'      pScore(testPvals, method="absLog10"),
#'      xlab="pQnormScore", ylab="pAbsLog10Score"); abline(0,1, col="red", lty=2)
#' @seealso \code{\link{pAbsLog10Score}}, \code{\link{pQnormScore}}
#' @export pScore
pScore <- function(p, sign=1, 
                   method=c("qnorm", "absLog10"), 
                   replaceZero=TRUE) {
  method <- match.arg(method)
  if(method=="qnorm") {
    return(pQnormScore(p, sign, replaceZero=replaceZero))
  } else if (method=="absLog10") {
    return(pAbsLog10Score(p, sign, replaceZero=replaceZero))
  } else {
    stop("Should not be here! Contact the developer")
  }
}
