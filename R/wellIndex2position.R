#' Translate well index numbers to well positions
#' @param ind Well index, integer numbers starting from 1, running rowwise. Non-integer parameters will be coereced to integers.
#' @param format Character string, well format
#' @return A \code{data.frame} containing three columns: input \code{WellIndex}, \code{Row} (characters) and \code{Column} (integers)
#' @examples
#' wellIndex2position(1:96, format="96")
#' wellIndex2position(c(3,2,5,34,85, NA), format="96")
#' wellIndex2position(1:384, format="384")
#' @export
wellIndex2position <- function(ind, format=c("96", "384")) {
  if(!is.integer(ind))
    ind <- as.integer(as.character(ind))
  format <- match.arg(format)
  if (format=="96") {
    nrow <- 8
    ncol <- 12
  } else if (format=="384") {
    nrow <- 16
    ncol <- 24
  }
  
  rowInd <- (ind - 1) %/% ncol + 1
  rowInd[rowInd<1 | rowInd>nrow] <- NA
  rowLetter <- LETTERS[1:nrow][rowInd]
  colInd <- as.integer((ind - 1) %% ncol + 1)
  
  outOfRange <- is.na(ind) | ind < 1 | ind > nrow*ncol
  rowLetter[outOfRange] <- colInd[outOfRange] <- NA
  
  res <- data.frame(WellIndex=ind,
                    Row=rowLetter,
                    Column=colInd,
                    row.names=NULL,
                    stringsAsFactors = FALSE)
  return(res)
}
