\name{prune.oblique.tree}
\alias{prune.oblique.tree}
\title{Cost-complexity Pruning of Oblique Tree Object}
\description{
  Determines a nested sequence of subtrees of the supplied tree by recursively \dQuote{snipping} off the least important splits.

}
\usage{
prune.oblique.tree(
	tree, 
	k = NULL, 
	newdata, 
	prune.impurity = c("deviance", "misclass"), 
	penalty = c("complexity", "size"), 
	eps = 1e-3)
}
\arguments{
  \item{tree}{Fitted model object of class \code{oblique.tree}. This is assumed to be the result of some function that produces an object with the same named components as that returned by \code{oblique.tree}.}
  \item{k}{Cost-complexity parameter defining either a specific subtree of \code{tree} (\code{k} a scalar) or the (optional) sequence of subtrees minimizing the cost-complexity measure (\code{k} a vector). If missing, \code{k} is determined algorithmically.}
  \item{newdata}{Data frame upon which the sequence of cost-complexity subtrees is evaluated. If missing, the data used to grow the tree is used. }
  \item{prune.impurity}{Character string denoting the measure of node heterogeneity used to guide cost-complexity pruning. The default is \code{deviance} and the alternative is \code{misclass} (number of misclassifications or total loss).}
  \item{penalty}{Character string denoting the measure of tree complexity used to guide cost-complexity pruning. The default is \code{complexity} (that considers the complexity of splits used throughout the tree) and the alternative is \code{size} (that counts the number of leaves of the tree).}
  \item{eps}{A lower bound for the probabilities, used to compute deviances if events of predicted probability zero occur in \code{newdata}.}
}
\details{
  Determines a nested sequence of subtrees of the supplied tree by recursively "snipping" off the least important splits, based upon the cost-complexity measure. 

  If \code{k} is supplied, the optimal subtree for that value is returned.

  The response as well as the predictors referred to in the right side of the formula in \code{tree} must be present by name in \code{newdata}. These data are dropped down each tree in the tree sequence and deviances or losses calculated by comparing the supplied response to the prediction. A \code{plot} method exists for objects of this class. It displays the value of the deviance, the number of misclassifications or the total loss for each subtree in the tree sequence. An additional axis displays the values of the cost-complexity parameter at each subtree.
}
\value{
  If \code{k} is supplied and is a scalar, an object of class \code{c("oblique.tree","tree")} is returned that minimizes the cost-complexity measure for that \code{k}. If \code{k} is a vector, an object of class \code{tree.sequence} is returned. The object contains the following components:

  \item{size}{The complexity of each tree in the cost-complexity pruning sequence.}
  \item{deviance}{Total deviance of each tree in the cost-complexity pruning sequence.}
  \item{k}{The value of the cost-complexity pruning parameter of each tree in the sequence.}
}
\references{ 
  Truong. A (2009) \emph{Fast Growing and Interpretable Oblique Trees via Probabilistic Models}

  Ripley, B. D. (1996). \emph{Pattern Recognition and Neural Networks.} Cambridge University Press, Cambridge. Chapter 7.
}
\author{
  A. Truong
}
\seealso{\code{\link{oblique.tree}}.}
\examples{
#grow an mixture tree on the Pima Indian dataset
data(Pima.tr, package = "MASS")
ob.tree <- oblique.tree(formula		= type~.,
			data		= Pima.tr,
			oblique.splits	= "on")
plot(ob.tree);text(ob.tree);title(main="Mixture Tree")

#examine the tree sequence
tree.seq <- prune.oblique.tree(	tree	= ob.tree)	
print(tree.seq);plot(tree.seq)

#examine test error over the tree sequence
data(Pima.te, package = "MASS")
tree.seq <- prune.oblique.tree(	tree	= ob.tree,
				newdata	= Pima.te)
print(tree.seq);plot(tree.seq)

#deviance is least when k = 8.148267
pruned <- prune.oblique.tree(	tree	= ob.tree,
				k	= 9)
plot(pruned);text(pruned);title(main="Pruned Tree")

}
\keyword{tree}

