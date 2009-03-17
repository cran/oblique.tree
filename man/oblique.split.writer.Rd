\name{oblique.split.writer}
\alias{oblique.split.writer}
\title{Internal function to Summarize Information about Oblique Splits}
\description{
  Collates, rewrites and summarizes information about oblique splits. 
}
\usage{
oblique.split.writer(
	coefficients, 
	impurity, 
	child.left.T.F, 
	superclass.composition)
}
\arguments{
  \item{coefficients}{A (named) vector of coefficients of an oblique split. The first component is the intercept followed by each attribute in turn.}
  \item{impurity}{Impurity of this split.}
  \item{child.left.T.F}{A logical vector denoting allocation of observations to left child node.}
  \item{superclass.composition}{A record of the targets of the classification problem that lead to this ideal split.}
}
\details{
  Variable selection can reduce full oblique splits to using only one attribute which are better represented as axis-parallel splits. This function handles this representational issue.
}
\value{
  A list is returned with the following components,
  \item{impurity}{Impurity of this split.}
  \item{child.left.T.F}{A logical vector denoting allocation of observations to left child node.}
  \item{details}{A list with \code{coefficients}, the coefficients of this split and \code{superclass.targets}, a record of the targets of the classification problem that lead to this ideal split.}
  \item{variable}{A string denoting the type of such a split, \code{""} for oblique splits and a variable name for axis-parallel splits.}
  \item{cutleft}{A string expressing the left branch.}
  \item{cutright}{A string expressing the right branch.}
}
\author{A. Truong}

