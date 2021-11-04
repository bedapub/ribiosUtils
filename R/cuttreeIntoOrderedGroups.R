NULL

#' Reorder the groups by their group size
#' @param groups Named vectors of integers as group indices
#' @param decreasing Logical, should the first group be the largest?
#' 
#' The function permutes a vector of names integers so that the names 
#' matching the same integer match to the same or another integer, while 
#' assuring that the permuted group matching the first integer
#'  (or the last integer if \code{decreasing} is set to \code{FALSE}) is the 
#'  largest group by count.
orderCutgroup <- function(groups, decreasing=TRUE) {
  stopifnot(!is.null(names(groups)) && is.integer(groups))
  clusterCount <- table(groups)
  ordByCount <- names(clusterCount)[order(clusterCount, decreasing = decreasing)]
  cutresFac <- factor(groups, levels=ordByCount)
  res <- as.integer(cutresFac)
  names(res) <- names(groups)
  return(res)
}

#' Cut a tree into groups of ordered sizes
#' 
#' @param tree a tree as produced by \code{\link{hclust}}, will be passed to
#'  \code{\link{cutree}}
#' @param k an integer scalar or vector with the desired number of groups
#' @param h numeric scalar or vector with heights where the tree should be cut.
#' @param decreasing logical, should be the first group the largest?
#' 
#' Cut a tree, e.g. as resulting from \code{\link{hclust}}, into groups, with 
#' the groups being ordered by their size.
#' 
#' @importFrom stats cutree
#' @seealso \code{\link{cutree}}
#' @export
#' @examples 
#' hc <- hclust(dist(USArrests))
#' hck5 <- cutreeIntoOrderedGroups(hc, k = 5)
#' table(hck5)
#' ## compare with cutree, which does not order the groups
#' table(cutree(hc, k=5))
#' 
#' hck25 <- cutreeIntoOrderedGroups(hc, k = 2:5)
#' apply(hck25, 2, table)
cutreeIntoOrderedGroups <- function(tree, k=NULL, h=NULL, decreasing=TRUE) {
  cutres <- cutree(tree, k=k, h=h)
  if(is.matrix(cutres)) {
    res <- apply(cutres, 2, orderCutgroup, decreasing=decreasing)
  } else {
    res <- orderCutgroup(cutres, decreasing=decreasing)
  }
  return(res)
}
