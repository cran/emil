\name{emil}
\alias{emil}
\title{Introduction  to the emil package}
\description{
The emil package implements a framework for working with
predictive modeling problems without information leakage.
For an overview of its functionality please read the
original publication included as the package's vignette (to be added).
}

\section{Central topics and functions}{
    \subsection{Setting up modeling problems}{
        \describe{
            \item{\code{\link{resample}}}{Functions for generating and
                resampling schemes and information on how to implement custom
                resampling methods.}
            \item{\code{\link{pre_process}}}{Data pre-processing
                functions.}
            \item{\code{\link{modeling_procedure}}}{Manages
                algorithms used for fitting models, making predictions, and
                extracting feature importance scores.}
            \item{\code{\link{error_fun}}}{Performance estimation
                functions used to tune parameters and evaluate performance
                of modeling procedures.}
        }
    }
    \subsection{Solving modeling problems}{
        \describe{
            \item{\code{\link{fit}}}{Fit a model (according to a procedure).}
            \item{\code{\link{tune}}}{Tune parameters of a procedure.}
            \item{\code{\link[=predict.model]{predict}}}{Use a
                fitted model to predict the response of observations.}
            \item{\code{\link{evaluate}}}{Evaluate
                the performance of a procedure using resampling.}
            \item{\code{\link{learning_curve}}}{Learning curve analysis.}
        } 
    }
    \subsection{Managing the results of modeling problems}{
        \describe{
            \item{\code{\link{get_prediction}}}{Extract predictions from 
                resampled modeling results.}
            \item{\code{\link{get_tuning}}}{Extract feature importance scores of a
                fitted model or resampled modeling results.}
            \item{\code{\link{get_importance}}}{Extract feature importance scores of a
                fitted model or resampled modeling results.}
            \item{\code{\link{subtree}}}{Extracts results
                from the output of \code{\link{evaluate}}. It is
                essentially a recursive version of \code{\link{lapply}} and
                \code{\link{sapply}}.}
            \item{\code{\link{select}}}{Interface between emil and the
                \code{\link{dplyr}} package for data manipulation.
                Can be used to subset modeling results, reorganize or summarize
                to help interpretation or prepare for plotting.}
        }
    }
}

\section{Methods included in the package}{
    \subsection{Resampling methods}{
        See \code{\link{resample}} for information on usage and implementation
        of custom methods.
        \describe{
            \item{\code{\link{resample_holdout}}}{Repeated holdout.}
            \item{\code{\link{resample_crossvalidation}}}{Cross validation.}
        }
    }
    \subsection{Data pre-processing methods}{
        See \code{\link{pre_process}} for information on usage and
        implementation of custom methods.  The imputation functions
        can also be used outside of the resampling scheme, see
        \code{\link{impute}}.
        \describe{
            \item{\code{\link{pre_split}}}{Only split, no transformation.}
            \item{\code{\link{pre_center}}}{Center data to have mean 0 of each
                feature.}
            \item{\code{\link{pre_scale}}}{Center and scale data to
                have mean 0 and standard deviation 1.}
            \item{\code{\link{pre_impute_median}}}{Impute missing
                values with feature medians.}
            \item{\code{\link{pre_impute_knn}}}{Impute missing values
                with k-NN, see \code{\link{pre_impute_knn}} for details on
                how to set parameters.}
        }
    }
    \subsection{Modeling methods}{
        The following modeling methods are included in the emil package.
        For a complete list of available methods in both the emil package and
        other loaded packages, please use \code{\link{list_method}}.
        See \code{\link{modeling_procedure}} for information on usage
        and \code{\link{extension}} for information on
        implementation of custom methods.
        \describe{
            \item{\code{\link[=fit_cforest]{cforest}}}{Conditional inference
                forest.}
            \item{\code{\link[=fit_coxph]{coxph}}}{Cox proportional hazards model.}
            \item{\code{\link[=fit_glmnet]{glmnet}}}{Elastic net.}
            \item{\code{\link[=fit_lasso]{lasso}}}{LASSO.}
            \item{\code{\link[=fit_lda]{lda}}}{Linear discriminant.}
            \item{\code{\link[=fit_lm]{lm}}}{Linear model.}
            \item{\code{\link[=fit_pamr]{pamr}}}{Nearest shrunken
                centroids.}
            \item{\code{\link[=fit_qda]{qda}}}{Quadratic discriminant.}
            \item{\code{\link[=fit_randomForest]{randomForest}}}{Random
                forest.}
            \item{\code{\link[=fit_ridge_regression]{ridge_regression}}}{Ridge regression.}
            \item{\code{\link[=fit_rpart]{rpart}}}{Decision trees.}
        }
        It is also possible to incorporate any method from the \sQuote{caret}
        package by using the function \code{\link{fit_caret}}.
        
        To search for emil compatible methods in all attached packages use the
        \code{\link{list_method}} function.
    }
    \subsection{Performance estimation methods}{
        See \code{\link{error_fun}} for information on usage and implementation
        of custom methods. Since the framework is designed to minimize the error
        when tuning parameters, some measures are negated, e.g. \code{\link{neg_auc}}.

        For classification problems:
            \describe{
                \item{\code{\link{error_rate}}}{Fraction of predictions that were
                    incorrect.}
            \item{\code{\link{weighted_error_rate}}}{See its own documentation.}
            \item{\code{\link{neg_auc}}}{Negative area under ROC curve.
                To plot the ROC curves see \code{\link{roc_curve}}.}
            \item{\code{\link{neg_gmpa}}}{Negative geometric mean of class-specific
                prediction accuracy. Good for problems with imbalanced class sizes.}
        }
        For regression problems:
        \describe{
            \item{\code{\link{mse}}}{Mean square error.}
            \item{\code{\link{rmse}}}{Root mean square error.}
        }
        For survival analysis problem:
        \describe{
            \item{\code{\link{neg_harrell_c}}}{Negative Harrell's concordance index.}
        }
    }
    \subsection{Plotting}{
        Plotting is not the one of the main aims of the package and the methods
        that do exist mainly serves as examples for how to write your own.
        These exists for:
        \itemize{
            \item \link[=learning_curve]{Learning curve analyses}.
            \item \link[=image.resample]{Resampling schemes}.
            \item \link[=roc_curve]{ROC-curves}.
        }
    }
}
\author{Christofer \enc{Bäcklin}{Backlin}}

