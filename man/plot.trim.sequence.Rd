\name{plot.trim.sequence}
\alias{plot.trim.sequence}
\title{
  Plot a Trim Sequence
}
\description{
  Allows the user to plot a trim sequence.
}
\usage{
\method{plot}{trim.sequence}(x, \dots, type = "l", ylim = range(x$dev),
    order = c("decreasing", "increasing"))
}
\arguments{
  \item{x}{object of class \code{trim.sequence}. This is assumed to be the result of some function that produces an object with the same named components (\code{comp}, \code{deviance}, \code{h}) as that returned by \code{\link{trim.oblique.tree}}.}
  \item{order}{of \code{comp} on the plot. Use \code{"decreasing"} for a natural ordering of the complexity of tree and the amount of trimming. Only the first character is needed.}
  \item{type, ylim, \dots}{graphical parameters.}
}
\section{Side Effects}{
  Plots deviance or number of misclassifications (or total loss) versus size for a sequence of trimmed trees.
}
\details{
  This function is a method for the generic function \code{plot()} for class \code{trim.sequence}. It can be invoked by calling \code{plot(x)} for an object \code{x} of the appropriate class, or directly by calling \code{plot.trim.sequence(x)} regardless of the class of the object.
}
\examples{
#grow an oblique tree
data(Pima.tr, package="MASS")
ob.tree <- oblique.tree(	type~.,
				Pima.tr,
				oblique.splits="only",
				variable.selection="model.selection.aic")

#look at the tree
plot(ob.tree);text(ob.tree)

#and its trim sequence
plot(trim.oblique.tree(ob.tree))
}
\keyword{tree}
