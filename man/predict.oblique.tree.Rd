\name{predict.oblique.tree}
\alias{predict.oblique.tree}
\title{Predictions from Fitted Oblique Tree Object}
\description{
  Returns predictions from a fitted \code{oblique.tree} object.
}
\usage{
predict.oblique.tree(
	object, 
	newdata, 
	type = c("vector", "tree", "class", "where"), 
	eps = 1e-3, 
	update.tree.predictions = FALSE,
	...)
}
\arguments{
  \item{object}{Fitted model object of class \code{oblique.tree}. This is assumed to be the result of some function that produces an object with the same named components as that returned by \code{oblique.tree}.}
  \item{newdata}{Data frame containing the values at which predictions are required. The predictors referred to in the right side of \code{formula(object)} must be present by name in \code{newdata}. If missing, fitted values are returned.}
  \item{type}{Character string denoting how predictions are to be returned, i.e. class probabilities (default), a tree object, class predictions or predictions to leaf nodes.}
  \item{eps}{A lower bound for the probabilities, used if events of predicted probability zero occur in \code{newdata} when predicting a tree.}
  \item{update.tree.predictions}{Logical vector denoting whether tree predictions (\code{frame$yval, frame$yprob, $where, $y} etc) are updated when \code{newdata} is provided.}
  \item{\dots}{Further arguments passed to or from other methods.}
}
\details{
  This function is a method for the generic function \code{predict()} for objects of class \code{c("oblique.tree","tree")}. It can be invoked by calling \code{predict(x)} for an object \code{x} of the appropriate class or directly by calling \code{predict.oblique.tree(x)} regardless of the class of the object.
}
\value{
  If \code{type = "vector"}:
  a matrix of predicted class probabilities is returned. This object is obtained by dropping observations down \code{object}. 
  
  If \code{type = "tree"}:
  an object of class \code{c("oblique.tree","tree")} is returned with new values for \code{frame$n} and \code{frame$dev}. 

  If \code{type = "class"}:
  a factor of the predicted classes (that with highest posterior probability, with ties split randomly).

  If \code{type = "where"}:
  the nodes the cases reach.
}
\references{ 
  Truong. A (2009) \emph{Fast Growing and Interpretable Oblique Trees via Probabilistic Models}

  Ripley, B. D. (1996). \emph{Pattern Recognition and Neural Networks.} Cambridge University Press, Cambridge. Chapter 7.
}
\author{
  A. Truong
}
\seealso{
  \code{\link{predict}}, \code{\link{oblique.tree}}.
}
\examples{
#grow an oblique tree to the Pima Indian dataset
data(Pima.tr, package = "MASS")
ob.tree <- oblique.tree(formula		= type~.,
			data		= Pima.tr,
			oblique.splits	= "on")
plot(ob.tree);text(ob.tree);title(main="Oblique Tree")

#predictions to in-sample data
#class probabilities for each observation
predict(ob.tree,type="vector")
#the tree itself
predict(ob.tree,type="tree")
#class predictions for each observation
predict(ob.tree,type="class")
#the leaf where each observation falls
predict(ob.tree,type="where")

#predictions to out-of-sample data
data(Pima.te, package = "MASS")
#class probabilities for each observation
predict(ob.tree,newdata=Pima.te,type="vector")
#the tree itself
predict(ob.tree,newdata=Pima.te,type="tree")
#class predictions for each observation
predict(ob.tree,newdata=Pima.te,type="class")
#the leaf where each observation falls
predict(ob.tree,newdata=Pima.te,type="where")
}
\keyword{tree}
