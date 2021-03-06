% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/survival.r
\name{plot_Surv}
\alias{plot_Surv}
\title{Plot Surv vector [DEPRECATED]}
\usage{
plot_Surv(x, y, segments = TRUE, flip = FALSE, legendpos = "topright",
  ...)
}
\arguments{
\item{x}{\code{\link[survival]{Surv}} vector.}

\item{y}{Y-values.}

\item{segments}{Whether to draw horizontal segments.}

\item{flip}{Flip the plot to show time on y.}

\item{legendpos}{Position of legend, see \code{\link{legend}}. Set to NA or
NULL to suppress legend.}

\item{...}{Sent to \code{\link{plot}}.}
}
\description{
Package \pkg{survival} includes an official plot function as of version
2.42-5. This will therefore be removed in the next major update.
}
\author{
Christofer \enc{Bäcklin}{Backlin}
}
