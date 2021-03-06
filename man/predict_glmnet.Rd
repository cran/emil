% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glmnet.r
\name{predict_glmnet}
\alias{predict_glmnet}
\alias{predict_ridge_regression}
\alias{predict_lasso}
\title{Predict using generalized linear model with elastic net regularization}
\usage{
predict_glmnet(object, x, s, ...)

predict_ridge_regression(object, x, s, ...)

predict_lasso(object, x, s, ...)
}
\arguments{
\item{object}{Fitted model.}

\item{x}{New data to be predicted.}

\item{s}{Regularization parameter lambda.}

\item{...}{Sent to \code{\link[glmnet]{predict.glmnet}}.}
}
\value{
A list with a subset of the following elements:
\describe{
    \item{\code{prediction}}{The response of the modeling problem, i.e. a
        factor for classification, problems, a numeric for regressions, and a
        relative risk for survival analyses.}
    \item{\code{probability}}{Data frame of predicted class probabilities.}
    \item{\code{link}}{Link function values.}
}
}
\description{
Due to the way \code{\link[glmnet]{glmnet}} is implemented, the regularization alpha
can not be modified after the model is fitted.
}
\seealso{
\code{\link{emil}}, \code{\link{fit_glmnet}},
  \code{\link{importance_glmnet}}, \code{\link{modeling_procedure}}
}
\author{
Christofer \enc{Bäcklin}{Backlin}
}
