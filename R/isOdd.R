#' Whether an integer is odd (or even)
#' @param x An integer.
#' @return Logical, whether the input number is odd or even.
#' 
#' \code{isOdd} and \code{isEven} returns whether an integer is odd or even,
#' respectively.
#' @aliases isEven
#' @examples 
#' isOdd(3)
#' isEven(4)
#' @export
isOdd <- function(x) x%%2 == 1

#' @rdname isOdd
#' @export
isEven <- function(x) x%%2 == 0

