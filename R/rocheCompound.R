#' Tell whether a character string is a Roche compound ID
#' @param str Character string(s)
#' @return A logical vector of the same length as \code{str}, indicating whether each element is a Roche compound ID or not.
#' 
#' @note Short versions (RO[1-9]\{2,7\}) are supported.
#' 
#' @examples
#' isRocheCompoundID(c("RO1234567", "RO-1234567", 
#'                    "RO1234567-000", "RO1234567-000-000",
#'                    "ROnoise-000-000"))
#' @export isRocheCompoundID
isRocheCompoundID <- function(str) {
  grepl("^RO-?{0,1}[0-9]{2,7}(-[0-9]{3})?(-[0-9]{3})?$", 
        as.character(str))
}

#' Shorten Roche compounds identifiers
#' @param str Character strings that contains one or more Roche core identifiers (\code{RO} followed by seven-digit numbers)
#' @return Character strings of the same length as the input, with all core identifiers shortened
#' 
#' In contrast to \code{\link{rocheCore}}, which only handles character strings that are valid Roche compound identifiers, this function takes any input
#' string and performs a \code{gsub} operation to shorten Roche core numbers. Therefore, it even works when only a substring matches the pattern of a Roche compound name.
#'
#' @examples 
#' shortenRocheCompoundID(c("RO1234567-001", "RO1234567-001-000", 
#' "RO1234567", "ROnoise-001", "anyOther-not-affected", 
#' "RO1234567 and RO9876543 are two imaginary compounds."))
#' @export
shortenRocheCompoundID <- function(str) {
  res <- gsub("RO[0-9]{3}([0-9]{4})(-[0-9]{3})?(-[0-9]{3})?", "RO\\1", str)
  return(res)
}

#' Extract core identifiers from Roche compound IDs
#' @param str Character strings
#' @param short Logical, if \code{TRUE}, the short version of Roche identifiers (\code{RO[0-9]{4}}) is returned. Default: \code{FALSE}
#' @return Core identifiers if the element is a Roche compound ID, the original element otherwise
#' Non-character input will be converted to character strings first.
#' @seealso \code{\link{isRocheCompoundID}}
#' @examples
#' rocheCore(c("RO1234567-001", "RO1234567-001-000", "RO1234567", 
#'     "ROnoise-001", "anyOther-not-affected"))
#' rocheCore(c("RO1234567-001", "RO1234567-001-000", "RO1234567",
#'     "ROnoise-001","anyOther-not-affected"), short=TRUE)
#' 
#' @export rocheCore
rocheCore <- function(str, short=FALSE) {
  str <- as.character(str)
  isRO <- isRocheCompoundID(str)
  res <- gsub("-[0-9]{3}$", "", as.character(str))
  res <- gsub("-[0-9]{3}$", "", res)
  if(short) {
    res <- shortenRocheCompoundID(res)
  }
  res[!isRO] <- str[!isRO]
  return(res)
}
