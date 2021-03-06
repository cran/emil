% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/imputation.r
\name{na_index}
\alias{na_index}
\title{Support function for identifying missing values}
\usage{
na_index(data)
}
\arguments{
\item{data}{Fitting and testing data sets, as returned by
\code{\link{pre_split}}.}
}
\value{
Data frame containing row and column indices of missing values or
  \code{NULL} if the data doesn't contain any.
}
\description{
Support function for identifying missing values
}
\examples{
x <- as.matrix(iris[-5])
y <- iris$Species
x[sample(length(x), 10)] <- NA
cv <- resample("crossvalidation", y)
sets <- pre_split(x, y, cv[[1]])
sets <- pre_remove(sets, 3L)
na_index(sets)
}
\author{
Christofer \enc{Bäcklin}{Backlin}
}
