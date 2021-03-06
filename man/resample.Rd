% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/resampling.r
\name{resample}
\alias{resample}
\alias{resample_holdout}
\alias{resample_crossvalidation}
\alias{resample_bootstrap}
\title{Resampling schemes}
\usage{
resample(method, y, ..., subset = TRUE)

resample_holdout(y, test_fraction = 0.5, nfold = 5,
  balanced = is.factor(y), subset)

resample_crossvalidation(y, nfold = 5, nrepeat = 5,
  balanced = is.factor(y), subset)

resample_bootstrap(y, nfold = 10, fit_fraction = if (replace) 1 else 0.632,
  replace = TRUE, balanced = is.factor(y), subset)
}
\arguments{
\item{method}{The resampling method to use, e.g. \code{"holdout"} or
\code{"crossvalidation"}.}

\item{y}{Observations to be divided.}

\item{...}{Sent to the method specific function, e.g.
\code{"resample_holdout"}.}

\item{subset}{Which objects in \code{y} that are to be divided and which
that are not to be part of neither set.
If \code{subset} is a resampling scheme, a list of inner
cross-validation schemes will be returned.}

\item{test_fraction}{Fraction of objects to hold out (0 < test_fraction < 1).}

\item{nfold}{Number of folds.}

\item{balanced}{Whether the sets should be balanced or not, i.e. if the
class ratio over the sets should be kept constant (as far as possible).}

\item{nrepeat}{Number of fold sets to generate.}

\item{fit_fraction}{The size of the training set relative to the entire data
set.}

\item{replace}{Whether to sample with replacement.}
}
\value{
A data frame defining a resampling scheme. \code{TRUE} or a positive integer
  codes for training set and \code{FALSE} or \code{0} codes for test set.
  Positive integers > 1 code for multiple copies of an observation in the
  training set. \code{NA} codes for neither training nor test set and is
  used to exclude observations from the analysis altogether.
}
\description{
Performance evaluation and parameter tuning use resampling methods to
estimate the performance of models. These are defined by resampling
schemes, which are data frames where each column corresponds to a
division of the data set into mutually exclusive training and test sets.
Repeated hold out and cross-validation are two methods to create such
schemes.
}
\details{
Note that when setting up analyzes, the user should not call
\code{resample_holdout} or \code{resample_crossvalidation} directly, as
\code{resample} performs additional necessary processing of the scheme.

Resampling scheme can be visualized in a human digestible form with the
\code{\link[=image.resample]{image}} function.

Functions for generating custom resampling schemes should be implemented as
follows and then called by \code{resample("myMethod", ...)}:

\code{resample_myMethod <- function(y, ..., subset)}
\describe{
    \item{\code{y}}{Response vector.}
    \item{\code{...}}{Method specific attributes.}
    \item{\code{subset}}{Indexes of observations to be excluded for the
        resampling.}
}
The function should return a list of the following elements:
\describe{
    \item{\code{folds}}{A data frame with the folds of the scheme that
        conforms to the description in the 'Value' section below.}
    \item{\code{parameter}}{A list with the parameters necessary to generate
        such a resampling scheme. These are needed when creating subschemes
        needed for parameter tuning, see \code{\link{subresample}}.}
}
}
\examples{
resample("holdout", 1:50, test_fraction=1/3)
resample("holdout", factor(runif(60) >= .5))
y <- factor(runif(60) >= .5)
cv <- resample("crossvalidation", y)
image(cv, main="Cross-validation scheme")
}
\seealso{
\code{\link{emil}}, \code{\link{subresample}},
  \code{\link{image.resample}}, \code{\link{index_fit}}
}
\author{
Christofer \enc{Bäcklin}{Backlin}
}
