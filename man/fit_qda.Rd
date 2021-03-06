% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qda.r
\name{fit_qda}
\alias{fit_qda}
\title{Fit quadratic discriminant.}
\usage{
fit_qda(x, y, ...)
}
\arguments{
\item{x}{Dataset, numerical matrix with observations as rows.}

\item{y}{Class labels, factor.}

\item{...}{Sent to \code{\link{qda}}.}
}
\value{
Fitted QDA.
}
\description{
Wrapper for the \pkg{MASS} package implementation.
}
\references{
Venables, W. N. and Ripley, B. D. (2002) Modern Applied
  Statistics with S. Fourth edition.  Springer.

  Ripley, B. D. (1996) Pattern Recognition and Neural Networks.
  Cambridge University Press.
}
\seealso{
\code{\link{emil}}, \code{\link{predict_qda}},
  \code{\link{modeling_procedure}}
}
\author{
Christofer \enc{Bäcklin}{Backlin}
}
