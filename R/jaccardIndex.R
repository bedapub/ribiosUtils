#' Calculate the Jaccard Index between two vectors
#' 
#' @aliases jaccardIndex jaccardDistance
#' @param x A vector
#' @param y A vector
#' @return The Jaccard Index, a number between 0 and 1
#' 
#' \code{JaccardDistance} is defined as \code{1-JaccardIndex}.
#' @examples
#' 
#' myX <- 1:6
#' myY <- 4:9
#' jaccardIndex(myX, myY)
#' jaccardDistance(myX, myY)
#' 
#' myX <- LETTERS[1:5]
#' myY <- LETTERS[6:10]
#' jaccardIndex(myX, myY)
#' jaccardDistance(myX, myY)
#' 
#' @export jaccardIndex
jaccardIndex <- function(x,y) length(intersect(x,y))/length(union(x,y))

#' @rdname jaccardIndex
#' @export jaccardDistance
jaccardDistance <- function(x,y) {
  return(1 - jaccardIndex(x, y))
}

#' Overlap coefficient, also known as Szymkiewicz-Simpson coefficient
#'
#' @aliases overlapCoefficient overlapDistance
#' @param x A vector
#' @param y A vector
#' @param checkUniqueNonNA Logical, if \code{TRUE}, \code{x} and \code{y} are
#' made unique and non-NA
#' @return The overlap coefficient
#' @seealso \code{\link{jaccardIndex}}
#'
#' \code{overlapCofficient} calculates the overlap coefficient, and
#' \code{overlapDistance} is defined by 1-\code{overlapCoefficient}.
#' @examples
#' 
#' myX <- 1:6
#' myY <- 4:9
#' overlapCoefficient(myX, myY)
#' 
#' myY2 <- 4:10
#' overlapCoefficient(myX, myY2)
#' ## compare the result with Jaccard Index
#' jaccardIndex(myX, myY2)
#' 
#' ## overlapDistance
#' overlapDistance(myX, myY2)
#' 
#' @export overlapCoefficient
overlapCoefficient <- function(x,y, checkUniqueNonNA=FALSE) {
  if(checkUniqueNonNA) {
    x <- uniqueNonNA(x)
    y <- uniqueNonNA(y)
  }
  res <- length(intersect(x,y))/pmin(length(x), length(y))
  return(res)
}

#' @export overlapDistance
#' @rdname overlapCoefficient
overlapDistance <- function(x,y, checkUniqueNonNA=FALSE) {
  return(1 - overlapCoefficient(x, y, checkUniqueNonNA = checkUniqueNonNA))
}

#' Calculate pairwise distances between each pair of items in a list
#' 
#' @param list A list
#' @param fun A function that receives two vectors (such as jaccardIndex) and
#' returns a number (scale)
#' @return A symmetric matrix of dimension \code{mxm}, where \code{m} is the
#' length of the list
#' 
#' This function is inefficient compared with matrix-based methods. It is exported 
#' just for education and for verifying results of matrix-based methods.
#' 
#' @examples
#' 
#' myList <- list(first=LETTERS[3:5], second=LETTERS[1:3], third=LETTERS[1:5], fourth=LETTERS[6:10])
#' naivePairwiseDist(myList, fun=jaccardIndex)
#' ## despite of the name, any function that returns a number can work
#' naivePairwiseDist(myList, fun=jaccardDistance)
#' 
#' @export naivePairwiseDist
naivePairwiseDist <- function(list, fun=jaccardIndex) {
  len <- length(list)
  res <- matrix(0, len, len)
  colnames(res) <- rownames(res) <- names(list)
  vals <- sapply(seq(from = 1, to = len - 1), function(i) {
    sapply(seq(from = i + 1, to = len), function(j) {
      do.call(fun, list(list[[i]], list[[j]]))
    })
  })
  vv <- unlist(vals)
  res[lower.tri(res)] <- vv
  res <- t(res) + res
  diag(res) <- do.call(fun, list(list[[1]], list[[1]]))
  return(res)
}

#' Pairwise jaccard/overlap coefficient can be calculated efficiently using matrix
# test <- matrix(rbinom(120, 1, 0.2), nrow=15)
# testGs <- apply(test, 2, function(x) which(x==1))
# testPOE <- pairwiseOverlapCoefficient(testGs)
# 
# testProd <- t(test) %*% test
# testLen <- apply(test, 2, function(x) sum(x!=0))
# testPairMinLen <- outer(testLen, testLen, pmin)
# testMatPOE <- testProd/testPairMinLen
# diag(testMatPOE) <- 1L
# stopifnot(identical(testMatPOE, testPOE))

#' Pairwise overlap coefficient of binary matrix by column
#' 
#' @param x An integer matrix, other objects will be coereced into a matrix
#' @param y An integer matrix, other objects will be coereced into a matrix. In case of 
#'   \code{NULL}, pairwise overlap coefficients by column of \code{x} is returned.
#' @return A matrix of column-wise pairwise overlap coefficients of the binary matrix. \code{NaN} 
#' is reported when neither of the columns have any non-zero element.
#' 
#' @examples
#' 
#' set.seed(1887)
#' testMatrix1 <- matrix(rbinom(120, 1, 0.2), nrow=15)
#' columnOverlapCoefficient(testMatrix1)
#' 
#' testMatrix2 <- matrix(rbinom(150, 1, 0.2), nrow=15)
#' testMatrix12Poe <- columnOverlapCoefficient(testMatrix1, 
#'   testMatrix2)
#' \dontrun{
#'    testMatrix12NaivePoe <- t(apply(testMatrix1, 2, function(x) {
#'       apply(testMatrix2, 2, function(y) {
#'          overlapCoefficient(which(x!=0), which(y!=0))
#'       })
#'    }))
#'    dimnames(testMatrix12NaivePoe) <- list(NULL, NULL)
#'    stopifnot(identical(testMatrix12Poe, testMatrix12NaivePoe ))
#' }
#' 
#' @export columnOverlapCoefficient
columnOverlapCoefficient <- function(x, y=NULL) {
  if(!is.matrix(x)) x <- as.matrix(x)
  if(is.null(y)) y <- x
  if(is.matrix(y)) y <- as.matrix(y)
  
  stopifnot(nrow(x)==nrow(y))
  storage.mode(x) <- storage.mode(y) <- "integer"
  
  tmatProd <- t(x) %*% y
  xCount <- apply(x, 2, function(xx) sum(xx!=0))
  yCount <- apply(y, 2, function(yy) sum(yy!=0))
  tmatPmin <- outer(xCount, yCount, pmin)
  res <- tmatProd/tmatPmin
  if(is.null(y)) {
    diag(res) <- 1L
  }
  dimnames(res) <- list(colnames(x), colnames(y))
  return(res)
}  res <- columnOverlapCoefficient(mat)

#' Pairwise overlap coefficient of lists
#' 
#' @param x A list of vectors that are interpreted as sets of elements
#' @param y A list of vectors that are interpreted as sets of elements. In case of \code{NULL},
#'   pairwise overlap coefficient of lists in \code{x} is returned.
#' @param checkUniqueNonNA Logical, should vectors in the list be first cleaned up so that NA values
#'   are removed and the elements are made unique? Default is set as \code{TRUE}; if the user is 
#'   confident that the vectors are indeed valid sets, this option can be set as \code{FALSE} to speed
#'   up the code
#' @return A matrix of column-wise pairwise overlap coefficients.
#' @examples 
#' set.seed(1887)
#' testSets1 <- sapply(rbinom(10, size=26, prob=0.3), 
#'   function(x) sample(LETTERS, x, replace=FALSE))
#' names(testSets1) <- sprintf("List%d", seq(along=testSets1))
#' testSets1Poe <- listOverlapCoefficient(testSets1)
#' testSets1PoeNoCheck <- listOverlapCoefficient(testSets1, checkUniqueNonNA=FALSE)
#' stopifnot(identical(testSets1Poe, testSets1PoeNoCheck))
#' \dontrun{
#'   testSets1NaivePoe <- naivePairwiseDist(testSets1, overlapCoefficient)
#'   stopifnot(identical(testSets1NaivePoe, testSets1Poe))
#' }
#' 
#' testSets2 <- sapply(rbinom(15, size=26, prob=0.3),
#'   function(x) sample(LETTERS, x, replace=FALSE))
#' names(testSets2) <- sprintf("AnotherList%d", seq(along=testSets2))
#' testSets12Poe <- listOverlapCoefficient(testSets1, testSets2)
#' 
#' \dontrun{
#'    testSets12NaivePoe <- t(sapply(testSets1, function(x) {
#'       sapply(testSets2, function(y) {
#'          overlapCoefficient(x, y)
#'       })
#'    }))
#'    stopifnot(identical(testSets12Poe, testSets12NaivePoe))
#' }
#' 
#' @export listOverlapCoefficient
listOverlapCoefficient <- function(x, y=NULL, checkUniqueNonNA=TRUE) {
  if(checkUniqueNonNA) {
    x <- lapply(x, uniqueNonNA)
    if(!is.null(y)) {
      y <- lapply(y, uniqueNonNA)
    }
  }

  if(is.null(y)) {
    elements <- unique(unlist(x))
    mat <- sapply(x, function(xx) as.integer(elements %in% xx))
    res <- columnOverlapCoefficient(mat)
  } else {
    elements <- unique(c(unlist(x), unlist(y)))
    mat1 <- sapply(x, function(xx) as.integer(elements %in% xx))
    mat2 <- sapply(y, function(xx) as.integer(elements %in% xx))
    res <- columnOverlapCoefficient(mat1, mat2)
  }
  return(res)
}

#' Calculate pairwise Jaccard Indices between each pair of items in a list
#' 
#' @aliases pairwiseJaccardIndex pairwiseJaccardDistance
#' @param list A list
#' @return A symmetric matrix of dimension \code{mxm}, where \code{m} is the
#' length of the list
#' 
#' \code{pairwiseJaccardDistance} is defined as \code{1-pairwiseJaccardIndex}.
#' @examples
#' 
#' myList <- list(first=LETTERS[3:5], second=LETTERS[1:3], third=LETTERS[1:5], fourth=LETTERS[6:10])
#' pairwiseJaccardIndex(myList)
#' 
#' poormanPJI <- function(list) {
#'   sapply(list, function(x) sapply(list, function(y) jaccardIndex(x,y)))
#' }
#' stopifnot(identical(pairwiseJaccardIndex(myList), poormanPJI(myList)))
#' 
#' @export pairwiseJaccardIndex
pairwiseJaccardIndex <- function(list) {
  return(pairwiseDist(list, fun=jaccardIndex))
}

#' @rdname pairwiseJaccardIndex
#' @export pairwiseJaccardDistance
pairwiseJaccardDistance <- function(list) {
  return(pairwiseDist(list, fun=jaccardDistance))
}

#' Cumulative Jaccard Index
#' 
#' 
#' @aliases cumJaccardIndex cumJaccardDistance
#' @param list A list of characters or integers
#' @return The cumulative Jaccard Index, a vector of values between 0 and 1, of
#' the same length as the input list
#' 
#' The cumulative Jaccard Index is calculated by calculating the Jaccard Index
#' of element \code{i} and the union of elements between \code{1} and
#' \code{i-1}. The cumulative Jaccard Index of the first element is set as 0.0.
#' 
#' The cumulative Jaccard distance is defined in almost the same way, with the
#' only difference the distance is returned. The value of the first element is
#' 1.0.
#' @note An advantage of using cumulative overlap coefficient over cumulative
#' Jaccard Index is that it is monotonic: the value is garanteed to decrease
#' from 1 to 0, whereas the cumulative Jaccard Index may not be monotic.
#' @seealso \code{\link{cumOverlapCoefficient}}
#' @examples
#' 
#' myList <- list(first=LETTERS[1:5], second=LETTERS[6:10], third=LETTERS[8:12], fourth=LETTERS[1:12])
#' cumJaccardIndex(myList)
#' cumJaccardDistance(myList)
#' 
#' @export cumJaccardIndex
cumJaccardIndex <- function(list) {
  res <- numeric(length(list))
  cumvec <- list[[1]]
  res[1] <- 0
  for(i in 2:length(res)) {
    res[i] <- jaccardIndex(list[[i]], cumvec)
    cumvec <- union(cumvec, list[[i]])
  }
  return(res)
}

#' @rdname cumJaccardIndex
#' @export cumJaccardDistance
cumJaccardDistance <- function(list) {
  res <- 1 - cumJaccardIndex(list)
  return(res)
}

#' Calculate pairwise overlap coefficients between each pair of items in a list
#' 
#' @aliases pairwiseOverlapDistance pairwiseOverlapCoefficient
#' @param list A list
#' @return A symmetric matrix of dimension \code{mxm}, where \code{m} is the
#' length of the list
#' 
#' \code{pairwiseOverlapDistance} is defined the pairwise overlap distance.
#' @examples
#' 
#' myList <- list(first=LETTERS[3:5], second=LETTERS[1:3], third=LETTERS[1:5], fourth=LETTERS[6:10])
#' pairwiseOverlapCoefficient(myList)
#' pairwiseOverlapDistance(myList)
#' 
#' poormanPOC <- function(list) {
#'   sapply(list, function(x) sapply(list, function(y) overlapCoefficient(x,y)))
#' }
#' stopifnot(identical(pairwiseOverlapCoefficient(myList), poormanPOC(myList)))
#' 
#' @export pairwiseOverlapDistance
pairwiseOverlapDistance <- function(list) {
  return(pairwiseDist(list, fun=overlapDistance))
}

#' @rdname pairwiseOverlapDistance
#' @export pairwiseOverlapCoefficient
pairwiseOverlapCoefficient <- function(list) {
  return(pairwiseDist(list, fun=overlapCoefficient))
}

#' Cumulative overlap coefficient
#' 
#' 
#' @aliases cumOverlapCoefficient cumOverlapDistance
#' @param list A list of characters or integers
#' @return The cumulative overlap coefficients, a vector of values between 0
#' and 1, of the same length as the input list
#' 
#' The cumulative overlap coefficient is calculated by calculating the overlap
#' coefficient of element \code{i} and the union of elements between \code{1}
#' and \code{i-1}. The cumulative overlap coefficient of the first element is
#' set as 0.0.
#' 
#' The cumulative overlap distance is defined in almost the same way, with the
#' only difference the distance is returned. The value of the first element is
#' 1.0. Pratically it is calculated by \code{1-cumOverlapCoefficient}.
#' 
#' Since the denominator of the overlap coefficient is the size of the smaller
#' set of the two, which is bound to be the size of element \code{i}, the
#' cumulative overlap distance can be interpreted as the proportion of new
#' items in each new element that are unseen in previous elements. Similarly,
#' the cumulative overlap coefficient can be interpreted as the proportion of
#' items in each new element that have been seen in previous elements. See
#' examples below.
#' @note An advantage of using cumulative overlap coefficient over cumulative
#' Jaccard Index is that it is monotonic: the value is garanteed to decrease
#' from 1 to 0, whereas the cumulative Jaccard Index may not be monotic.
#' @examples
#' 
#' myList <- list(first=LETTERS[1:5], second=LETTERS[6:10], third=LETTERS[8:12], fourth=LETTERS[1:12])
#' cumOverlapCoefficient(myList)
#' cumOverlapDistance(myList)
#' 
#' @export cumOverlapCoefficient
cumOverlapCoefficient <- function(list) {
  res <- numeric(length(list))
  cumvec <- list[[1]]
  res[1] <- 0.0
  for(i in 2:length(res)) {
    res[i] <- overlapCoefficient(list[[i]], cumvec)
    cumvec <- union(cumvec, list[[i]])
  }
  return(res)
}

#' @rdname cumOverlapCoefficient
#' @export cumOverlapDistance
cumOverlapDistance <- function(list) {
  res <- 1 - cumOverlapCoefficient(list)
  return(res)
}
