% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reshape-result.r
\name{subtree}
\alias{subtree}
\title{Extract a subset of a tree of nested lists}
\usage{
subtree(x, i, ..., error_value, warn, simplify = TRUE)
}
\arguments{
\item{x}{List of lists.}

\item{i}{Indexes to extract on the first level of the tree. Can also be a
function that will be applied to the downstream result of the function.}

\item{...}{Indexes to extract on subsequent levels.}

\item{error_value}{A template for the return value in case it is missing or
invalid. Note that \code{NA} is a \code{\link{logical}} by default,
causing \code{subtree} to also convert existing results to logicals.
To get around this, please specify it as \code{as.numeric(NA)},
\code{as.character(NA)}, or similar (see the example below).}

\item{warn}{Specifies whether warnings should be displayed (\code{0}),
ignored (\code{-1}), or break execution (\code{1}). Works like the
\code{\link{options}} parameter \code{warn}.}

\item{simplify}{Whether to collapse results into vectors or matrices when
possible (\code{TRUE}) or to preserve the original tree structure as a
list (\code{FALSE}).}
}
\value{
A subset of the list tree.
}
\description{
Modeling results produced by \code{\link{evaluate}} comes in the
form of nested lists. This function can be used to subset or rearrange parts
of the results into vectors, matrices or data frames.
Also note the \code{\link[emil]{select}} function that provides an extension
to the \pkg{dplyr} package for data manipulation.
}
\details{
This function can only be used to extract data, not to assign.
}
\examples{
l <- list(A=list(a=0:2, b=3:4, c=023-22030),
          B=list(a=5:7, b=8:9))
subtree(l, 1:2, "b")
subtree(l, TRUE, mean, "a")

# More practical examples
x <- iris[-5]
y <- iris$Species
cv <- resample("crossvalidation", y, nfold=5, nrep=3)
procedure <- modeling_procedure("pamr")

# To illustrate the error handling capacities of subtree we'll introduce some
# spurious errors in the pre-processing function. By setting .return_error=TRUE
# they wont break the execution, but will instead be return in the results.
pre_error <- function(data, risk=.1){
    if(runif(1) < risk)
        stop("Oh no! Random error!")
    data
}
result <- evaluate(procedure, x, y, resample=cv,
    .save=c(importance=TRUE), .return_error=TRUE,
    pre_process = function(...){
        pre_split(...) \%>\%
            pre_error(risk=.3) \%>\%
            pre_pamr
    }
)
message(sum(sapply(result, inherits, "error")),
        " folds did not complete successfully!")

# Extract error rates. Since some folds fail it will be an ugly list with both
# numeric estimates and NULL values (for the failed folds).
subtree(result, TRUE, "error")

# To put it on a more consistent form we can impute the missing error rates
# with NA to allow automatic simplification into a vector (since it requires
# all values to be on the same form, i.e. numeric(1) rather than a mix
# between numeric(1) and NULL as in the previous example).
subtree(result, TRUE, "error", error_value=as.numeric(NA), warn=-1)

# Sum up feature importance for all classes within each fold and extract.
# Note that the lengths (= 4) must match between the folds for the automatic
# simplification to work.
subtree(result, TRUE, "importance", function(x){
    if(is.null(x)){
        rep(NA, 3)
    } else {
        colMeans(x[2:4])
    }
})

# The equivalent 'select' command would be ...
require(tidyr)
imp <- result \%>\% select(fold = TRUE, "importance", function(x){
    if(is.null(x)) return(NULL)
    x \%>\% gather(Species, Importance, -feature)
})
require(ggplot2)
ggplot(imp, aes(x=Species, y=Importance)) +
    geom_abline(intercept=0, slope=0, color="hotpink") +
    geom_boxplot() + facet_wrap(~feature)

}
\seealso{
\code{\link{select}}, \code{\link{get_prediction}},
  \code{\link{get_importance}}, \code{\link{get_tuning}}.
}
\author{
Christofer \enc{Bäcklin}{Backlin}
}
