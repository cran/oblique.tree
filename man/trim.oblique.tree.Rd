\name{trim.oblique.tree}
\alias{trim.oblique.tree}
\title{Trims Oblique Splits of Fitted Oblique Tree Objects}
\description{
  Determines a sequence of concise subtrees of the supplied tree by recursively \dQuote{trimming} off the least important attributes used in oblique splits.
}
\usage{
trim.oblique.tree(
	tree, 
	best = NULL, 
	newdata, 
	trim.impurity = c("deviance", "misclass"), 
	trim.depth = c("partial", "complete"), 
	eps = 1e-3)
}
\arguments{
  \item{tree}{Fitted model object of class \code{oblique.tree}. This is assumed to be the result of some function that produces an object with the same named components as that returned by \code{oblique.tree}.}
  \item{best}{Requests the complexity (i.e. 1 + number of attributes used throughout the tree) of the concise subtree of \code{tree} to return (\code{best} a scalar) or a (optional) sequence of concise subtrees (\code{best} a vector). If missing, \code{best} is determined algorithmically. If there is no tree in the sequence of the requested size, the next largest is returned.}
  \item{newdata}{Data frame upon which the sequence of cost-complexity subtrees is evaluated. If missing, the data used to grow the tree is used. }
  \item{trim.impurity}{Character string denoting the measure of node heterogeneity used to guide tree trimming. The default is \code{deviance} and the alternative is \code{misclass} (number of misclassifications or total loss).}
  \item{trim.depth}{A character string denoting if oblique splits should be trimmed towards axis-parallel splits \code{partial} or to the constant predictor \code{complete}.}
  \item{eps}{A lower bound for the probabilities, used to compute deviances if events of predicted probability zero occur in \code{newdata}.}
}
\details{
  Determines a sequence of concise subtrees of the supplied tree by recursively "trimming" its splits, based upon the cost-complexity measure. 

  If \code{best} is supplied, the optimal subtree for that value is returned.

  The response as well as the predictors referred to in the right side of the formula in \code{tree} must be present by name in \code{newdata}. These data are dropped down each tree in the trim sequence and deviances or losses calculated by comparing the supplied response to the prediction. A \code{plot} method exists for objects of this class. It displays the value of the deviance, the number of misclassifications or the total loss for each subtree in the trim sequence. An additional axis displays the values of the cost-complexity parameter at each subtree.
}
\value{
  If \code{best} is a scalar, a \code{c("oblique.tree","tree")} object of size \code{best} is returned. Otherwise an object of class \code{c("trim", "trim.sequence")} is returned. The object contains the following components:

  \item{comp}{The complexity of each tree in the cost-complexity pruning sequence.}
  \item{dev}{Total deviance of each tree in the cost-complexity pruning sequence.}
  \item{h}{The value of the cost-complexity pruning parameter of each tree in the sequence.}
}
\references{ 
  Truong. A (2009) \emph{Fast Growing and Interpretable Oblique Trees via Probabilistic Models}
}
\author{
  A. Truong
}
\seealso{\code{\link{oblique.tree}}.}
\examples{
#grow a tree on the Pima Indian dataset
data(Pima.tr, package = "MASS")
ob.tree <- oblique.tree(formula			= type~.,
			data			= Pima.tr,
			oblique.splits		= "only")
plot(ob.tree);text(ob.tree);title(main="Full Oblique Tree")

#partially trimming
#examine the tree sequence
trim.seq <- trim.oblique.tree(	tree		= ob.tree)	
print(trim.seq);plot(trim.seq)

#examine test error over the trim sequence
data(Pima.te, package = "MASS")
trim.seq <- trim.oblique.tree(	tree		= ob.tree,
				newdata		= Pima.te)
print(trim.seq);plot(trim.seq)

#deviance is least when best = 7
p.trimmed <- trim.oblique.tree(	tree		= ob.tree,
				best		= 7)
plot(p.trimmed);text(p.trimmed);title(main="Partially Trimmed Tree")

#complete trimming
#examine the tree sequence
trim.seq <- trim.oblique.tree(	tree		= ob.tree,
				trim.depth	= "complete")	
print(trim.seq);plot(trim.seq)

#examine test error over the trim sequence
data(Pima.te, package = "MASS")
trim.seq <- trim.oblique.tree(	tree		= ob.tree,
				trim.depth	= "complete",
				newdata	= Pima.te)
print(trim.seq);plot(trim.seq)

#deviance is least when best = 9
c.trimmed <- trim.oblique.tree(	tree		= ob.tree,
				best		= 9)
plot(c.trimmed);text(c.trimmed);title(main="Completely Trimmed Tree")
}
\keyword{tree}

