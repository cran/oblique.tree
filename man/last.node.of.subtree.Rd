\name{last.node.of.subtree}
\alias{last.node.of.subtree}
\title{Internal Function that finds the Last Node of Subtrees}
\description{
  Returns the node number of the last node of a rooted subtree.
}
\usage{
last.node.of.subtree(
	tree, 
	subtree.root.name)
}
\arguments{
  \item{tree}{An object of class \code{tree}.}
  \item{subtree.root.name}{The name of the root of the subtree.}
}
\details{
  Knowing the node numbers of both the root node (of a subtree) and the last node of such a subtree is sufficient to isolate all nodes from this rooted subtree (as node are numbered in a recursive manner, left first then right). 
}
\value{
  The node number of the last node of a rooted subtree.
}
\author{A. Truong}
\examples{
#grow a tree on the Pima Indian dataset
data(Pima.tr, package = "MASS")
ob.tree <- oblique.tree(formula		= type~.,
			data		= Pima.tr,
			oblique.splits	= "on")
plot(ob.tree);text(ob.tree);title(main="Oblique Tree")

#what is the node number of the last node of the entire tree?
oblique.tree:::last.node.of.subtree(
	tree			= ob.tree, 
	subtree.root.name	= 1)

#what is the node number of the last node of the subtree rooted at the node with name '4'?
oblique.tree:::last.node.of.subtree(
	tree			= ob.tree, 
	subtree.root.name	= 4)
}
\keyword{tree}

