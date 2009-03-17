\name{oblique.tree.prune.nodes}
\alias{oblique.tree.prune.nodes}
\title{Internal Function that Prunes Oblique Tree Objects}
\description{
  Prunes entire subtrees off objects of class \code{c("oblique.tree","tree")}.
}
\usage{
oblique.tree.prune.nodes(
	tree, 
	list.of.node.names.to.prune)
}
\arguments{
  \item{tree}{Fitted model object of class \code{oblique.tree}. This is assumed to be the result of some function that produces an object with the same named components as that returned by \code{oblique.tree}.}
  \item{list.of.node.names.to.prune}{A list containing subtrees that are to be pruned. Each subtree is represented by a vector of its node names starting from its root to its the last node.}
}
\details{
  The data structure representing objects of class \code{c("oblique.tree","tree")} need to be carefully manipulated to reflect the pruning of nodes. Rows of \code{tree$frame} are removed and \code{tree$frame$var}, \code{tree$frame$splits}, \code{tree$where}, \code{tree$y} \code{tree$details} need to be updated.
}
\value{
  An object of class \code{c("oblique.tree","tree")} is return. 
}
\author{A. Truong}
\seealso{\code{\link{oblique.tree}}.}
\examples{
#grow a tree on the Pima Indian dataset
data(Pima.tr, package = "MASS")
ob.tree <- oblique.tree(formula		= type~.,
			data		= Pima.tr,
			oblique.splits	= "on")
plot(ob.tree);title(main="Oblique Tree")

#prune 1 subtree
plot(	oblique.tree:::oblique.tree.prune.nodes(
		tree				= ob.tree, 
		list.of.node.names.to.prune	= list(c(5,10,11,22,23,46,47,94,95))
	)
);title(main="Prune one Subtree")
}
%#prune 2 subtrees
%plot(	oblique.tree:::oblique.tree.prune.nodes(
%		tree				= ob.tree, 
%		list.of.node.names.to.prune	= list(	c(5,10,11,22,23,46,47,94,95),
%							c(7,14,15,30,31,62,124,125,63,126,127))
%	)
%);title(main="Prune two Subtrees")
%}
\keyword{tree}

