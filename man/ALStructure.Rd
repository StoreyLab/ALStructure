% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{alstructure}
\alias{alstructure}
\title{Main function for execution of the \code{ALStructure} algorithm}
\usage{
alstructure(X, d_hat = NULL, svd_method = "base", tol = 0.00001,
  max_iters = 1000, order_method = "ave_admixture", P_init, Q_init)
}
\arguments{
\item{X}{The \eqn{m \times n}{m by n} SNP data matrix.}

\item{d_hat}{Estimate of the latent space dimension \eqn{d}{d}. If left blank,
this is estimated by the function \code{estimate_d()}}

\item{svd_method}{One of "base" or "truncated_svd." If "base" is chosen, the
base \code{svd()} function is used. If "truncated_svd" is chosen, the truncated svd algorithm \code{propack.svd()} from the \code{svd} package is used.}

\item{tol}{The convergence criterion. If \eqn{RMSE(\boldsymbol{\hat{Q}}_t - \boldsymbol{\hat{Q}}_{t + 1})
< tol}{RMSE(Q_t - Q_(t + 1)) < tol}, then the algorithm halts}

\item{max_iters}{The maximum number of iterations (repetitions of steps (6)
and (7) in Algorithm 1) to be executed}

\item{order_method}{One of "ave_admixture" or "var_explained." If "ave_admixture," the \eqn{d}{d} populations are ordered by decreasing average admixture accross samples (i.e. \eqn{1 / n \sum_{j} q_{ij}}{1 / n (q_i1 + q_i2 + ... + q_in)}). If "var_explained", the \eqn{d}{d} populations are ordered be decreasing variation explained. Specifically, we compute a modified version of the \eqn{\mbox{eigen-}R^2}{eigen-R^2} statistic from (L. S. Chen and Storey 2008). The statistic is modified in the following ways: 1) we treat
rows of \eqn{\boldsymbol{Q}}{Q} as the response variables 2) we regress
each row of Q on the eigenvectors of \eqn{\boldsymbol{G}}{G} rather than the
eigenvectors of the data matrix itself 3) we take the weighted average only
over the top \eqn{d}{d} eigenvectors.
and columns of \eqn{\boldsymbol{P}}{P} are ordered by amount of variation
explained by each row of \eqn{\boldsymbol{Q}}{Q} by the function
\code{order_Q}}

\item{P_init}{Optional initialization of \eqn{\boldsymbol{P}}{P}. Only available for \code{cALS} method.}

\item{Q_init}{Optional initializtion of \eqn{\boldsymbol{Q}}{Q}. Only available for \code{cALS} method.}
}
\value{
A list with the following elements:
   \describe{
   \item{P_hat}{: The estimated \eqn{\boldsymbol{P}}{P} matrix. Each
   column of \eqn{\boldsymbol{P}}{P} may be interpreted as a vector of
   allele frequencies for a specific ancestral population.}
   \item{Q_hat}{: The estimated \eqn{\boldsymbol{Q}}{Q} matrix. Each
   column of \eqn{\boldsymbol{Q}}{Q} may be interpreted as the admixture
   proportions of a specific individual.}
   \item{rowspace}{: a list with the following elements:
   \describe{
       \item{vectors}{: The top \eqn{d}{d} eigenvectors of the matrix
       \eqn{\boldsymbol{G}}{G} sorted by decreasing eigenvalue. These vectors
   approximate the subspace spanned by the rows of \eqn{\boldsymbol{Q}}{Q}.}
       \item{values}{: The top \eqn{d}{d} eigenvalues of the matrix
       \eqn{\boldsymbol{G}}{G} sorted by decreasing eigenvalue.}}}
   }
}
\description{
Computes global ancestry estimates under the admixture model given a SNP data matrix
\eqn{\boldsymbol{X}}{X}. This function is based on the
\code{ALStrcture} algorithm from (Cabreros and Storey 2017).
}
\references{
Cabreros, I., and J. D. Storey. 2017. “A Nonparametric Estimator of Population Structure Unifying Admixture Models and Principal Components Analysis.” BioRxiv. Cold Spring Harbor Laboratory. doi:10.1101/240812.

Hao, W., M. Song and J. D. Storey. 2015. “lfa: Logistic Factor Analysis for Categorical Data.” R package version 1.8.0, https://github.com/StoreyLab/lfa.
}
