\name{oblique.tree.complexity}
\alias{oblique.tree.complexity}
\title{Internal Function that Quantifies the Complexity of Oblique Trees}
\description{
  Quantifies the complexity of subtrees of oblique trees
}
\usage{
oblique.tree.complexity(
	tree, 
	subtree.internal.node.names)
}
\arguments{
  \item{tree}{Fitted model object of class \code{oblique.tree}. This is assumed to be the result of some function that produces an object with the same named components as that returned by \code{oblique.tree}.}
  \item{subtree.internal.node.names}{A numeric vector containing the names of internal nodes of such a subtree.}
}
\details{
  \deqn{R_\alpha(T) = R(T) + \alpha size(T)} 
  When pruning and trimming trees, \eqn{size(T)} must be evaluated. Though counting the number of leaves (tree size) gives an good indication of the complexity of axis-parallel trees, it does not take into account the complexity of each split in oblique trees. This complexity measure generalizes tree size by inflating the cost of each leaf up from 1 for more complex branches. The cost of each leaf is defined to be the number of attributes used along its branch divided the by the number of tests (which coincides with tree size in the case of axis-parallel trees)
}
\value{
  A measure of complexity for oblique trees.
}
\references{
  Truong. A (2009) \emph{Fast Growing and Interpretable Oblique Trees via Probabilistic Models}

  Ripley, B. D. (1996). \emph{Pattern Recognition and Neural Networks.}
  Cambridge University Press, Cambridge. Chapter 7.
}
\author{A. Truong}
\seealso{\code{\link{oblique.tree}}.}
\examples{
#consider various tree on the Pima Indian dataset
data(Pima.tr, package = "MASS")
ob.tree.only <- oblique.tree(formula		= type~.,
				data		= Pima.tr,
				oblique.splits	= "only")
ob.tree.on <- oblique.tree(formula		= type~.,
				data		= Pima.tr,
				oblique.splits	= "on")
ob.tree.off <- oblique.tree(formula		= type~.,
				data		= Pima.tr,
				oblique.splits	= "off")
x11();par(mfrow=c(1,3))
plot(ob.tree.only);text(ob.tree.only);title(main="Oblique Splits Only")
plot(ob.tree.on);text(ob.tree.on);title(main="Oblique Splits On")
plot(ob.tree.off);text(ob.tree.off);title(main="Oblique Splits Off")

#calculate the complexity of a subtree
oblique.tree:::oblique.tree.complexity(
	tree				= ob.tree.only, 
	subtree.internal.node.names	= c(12,13,7))

#calculate the complexity of each tree
oblique.tree:::oblique.tree.complexity(
	tree		= ob.tree.only, 
	subtree.internal.node.names	= as.numeric(row.names(ob.tree.only$frame)[ob.tree.only$frame$var == "<leaf>"]))
oblique.tree:::oblique.tree.complexity(
	tree		= ob.tree.on, 
	subtree.internal.node.names	= as.numeric(row.names(ob.tree.on$frame)[ob.tree.on$frame$var == "<leaf>"]))
oblique.tree:::oblique.tree.complexity(
	tree		= ob.tree.off, 
	subtree.internal.node.names	= as.numeric(row.names(ob.tree.off$frame)[ob.tree.off$frame$var == "<leaf>"]))
}
\keyword{tree}

