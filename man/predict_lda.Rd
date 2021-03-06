% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lda.r
\name{predict_lda}
\alias{predict_lda}
\title{Prediction using already trained prediction model}
\usage{
predict_lda(object, x, ...)
}
\arguments{
\item{object}{Fitted classifier as produced by \code{\link{evaluate}}.}

\item{x}{Dataset of observations to be classified.}

\item{...}{Sent to \code{\link{predict.lda}}.}
}
\value{
A list with elements:
\itemize{
    \item{\code{prediction}: Factor of predicted class memberships.}
    \item{\code{probability}: Data frame of predicted class probabilities.}
}
}
\description{
Wrapper for the \pkg{MASS} package implementation.
}
\seealso{
\code{\link{emil}}, \code{\link{fit_lda}},
  \code{\link{modeling_procedure}}
}
\author{
Christofer \enc{Bäcklin}{Backlin}
}
