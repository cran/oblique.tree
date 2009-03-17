\name{node.impurity}
\alias{node.impurity}
\title{Internal Function to Calculate Impurity of Nodes}
\description{
  Calculates the impurity of a node.
}
\usage{
node.impurity(
	class.probabilities,
	impurity.measure = c("deviance","gini"))
}
\arguments{
  \item{class.probabilities}{A vector of observed class probabilities.}
  \item{impurity.measure}{Impurity criterion to use.}
}
\details{
  Where \eqn{p_i} are observed class probabilities, ``Gini Impurity'' is calculated as 
  \deqn{i(p) = \sum_{i!=j} p_i p_j = 1-\sum_i p_i^2.} 
  The ``deviance'' measure is calculated as 
  \deqn{i(p) = -2 \sum_i p_i \log(p_i)} 
  to allow for internal compatibility. Note: \eqn{0 \log(0) = 0}.
}
\value{
  A value for node impurity is returned.
}
\author{A. Truong}
\examples{
#A node only has observations of one type
oblique.tree:::node.impurity(
	class.probabilities	= c(1,0,0,0),
	impurity.measure 	= "deviance")

#Another node has equal numbers of observations of each type
oblique.tree:::node.impurity(
	class.probabilities	= c(0.25,0.25,0.25,0.25),
	impurity.measure 	= "deviance")
}

