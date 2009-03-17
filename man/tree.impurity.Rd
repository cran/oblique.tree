\name{tree.impurity}
\alias{tree.impurity}
\title{Internal Function that Determines the Impurity of a Subtree}
\description{
  Determines the impurity of a subtree.
}
\usage{
  tree.impurity(
	yprob, 
	number.of.observations.at.leaves, 
	leaf.classes, 
	impurity.measure = c("deviance","misclass"))
}
\arguments{
  \item{yprob}{A matrix of predicted class probabilities of leaves of the subtree considered in order of tree-growth (left to right).}
  \item{number.of.observations.at.leaves}{A vector denoting the number of observations at each of these leaves.}
  \item{leaf.classes}{A vector denoting the classes associated to these leaves.}
  \item{impurity.measure}{Character string denoting the measure of node heterogeneity to be used to guide cost-complexity pruning/trimming.}
}
\details{
  \deqn{R_\alpha(T) = R(T) + \alpha size(T)} 
  When pruning and trimming trees, \eqn{R(T)} must be evaluated. Extracted arguments from \code{oblique.tree} objects is easiest.
}
\value{
  The impurity of the subtree.
}
\references{
  Ripley, B. D. (1996). \emph{Pattern Recognition and Neural Networks.}
  Cambridge University Press, Cambridge. Chapter 7.
}

\author{A. Truong}
\seealso{\code{\link{oblique.tree}}.}
\examples{
#grow a tree on the Pima Indian dataset
data(Pima.tr, package = "MASS")
ob.tree <- oblique.tree(formula		= type~.,
			data		= Pima.tr,
			oblique.splits	= "on")

#deviance of entire tree
subtree.leaves <- ob.tree$frame$var == "<leaf>"
oblique.tree:::tree.impurity(	
	yprob 					= ob.tree$frame$yprob[subtree.leaves,,drop=FALSE],
	number.of.observations.at.leaves 	= ob.tree$frame$n[subtree.leaves],
	leaf.classes 				= ob.tree$frame$yval[subtree.leaves],
	impurity.measure 			= "deviance")
}
%#the number of misclassified observations by a subtree
%subtree.leaves <- row.names(ob.tree$frame) %in% c(16,17,18,19)
%oblique.tree:::tree.impurity(
%	yprob 					= ob.tree$frame$yprob[subtree.leaves,,drop=FALSE],
%	number.of.observations.at.leaves 	= ob.tree$frame$n[subtree.leaves],
%	leaf.classes 				= ob.tree$frame$yval[subtree.leaves],
%	impurity.measure 			= "misclass")
%}
\keyword{tree}

