#' Invert the names and elements of a list 
#' @param inputList a list, other classed (e.g. named vectors) will be converted to lists
#' @param simplify Logical, if yes and if no duplicated names, return a vector
#' @examples
#' myList <- list("A"=c("a", "alpha"), "B"=c("b", "Beta"), "C"="c")
#' invertList(myList)
#' invertList(myList, simplify=TRUE)
#' @return A list with values from the input becoming names and vice versa. When \code{simplify=TRUE} and there are no duplicated names, a named character vector is returned instead.
#' @export
invertList <- function(inputList, simplify=FALSE) {
  if(!is.list(inputList)) inputList <- as.list(inputList)
  dkeys <- rep(names(inputList),
               sapply(inputList, length))
  dvals <- unlist(inputList)
  res <- split(dkeys, dvals)
  if(simplify && !any(duplicated(names(res)))) {
    resVec <- unlist(res)
    names(resVec) <- names(res)
    return(resVec)
  } else {
    return(res)
  }
}

