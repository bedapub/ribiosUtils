% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cuttreeIntoOrderedGroups.R
\name{orderCutgroup}
\alias{orderCutgroup}
\title{Reorder the groups by their group size}
\usage{
orderCutgroup(groups, decreasing = TRUE)
}
\arguments{
\item{groups}{Named vectors of integers as group indices}

\item{decreasing}{Logical, should the first group be the largest?

The function permutes a vector of names integers so that the names 
matching the same integer match to the same or another integer, while 
assuring that the permuted group matching the first integer
 (or the last integer if \code{decreasing} is set to \code{FALSE}) is the 
 largest group by count.}
}
\description{
Reorder the groups by their group size
}
