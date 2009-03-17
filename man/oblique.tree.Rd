\name{oblique.tree}
\alias{oblique.tree}
\title{Fit an Oblique Tree to Classification Data}
\description{
  An oblique tree is grown by binary recursive partitioning using the response in the specified formula with oblique splits composed of linear combinations of terms from the right-hand-side.
}
\usage{
oblique.tree(
	formula, 
	data, 
	subset, 
	control = tree.control(nobs, ...), 
	method = "recursive.partition", 
	split.impurity = c("deviance", "gini"), 
	model = FALSE, 
	oblique.splits = c("only", "on", "off"), 
	variable.selection = c(	"none", 
				"model.selection.aic", 
				"model.selection.bic", 
				"lasso.aic", 
				"lasso.bic"), 
	...)
}
\arguments{
  \item{formula}{A formula expression. The left-hand-side (response) should be a factor. The right-hand-side should be a series of numeric or factor variables separated by \code{+} (there should be no interaction terms). Both \code{.} and \code{-} are allowed.}
  \item{data}{A data frame in which to interpret \code{formula} and \code{subset}.}
  \item{subset}{An expression specifying the subset of cases to be used.}
  \item{control}{A list as returned by \code{tree.control}.}
  \item{method}{A character string specifying the method to use. The only other useful value is \code{"model.frame"}.}
  \item{split.impurity}{Splitting criterion to use.}
  \item{model}{A model frame containing a response and predictors that can be used in place of \code{formula}, \code{data} and \code{subset} to allow direct specification of the problem.}
  \item{oblique.splits}{If and how oblique splits should be used during tree-growth. \code{only} grows trees that only consider oblique splits, \code{on} grows those that consider oblique and axis-parallel splits simultaneously and \code{off} grows trees that only consider axis-parallel splits.}
  \item{variable.selection}{If and how concise oblique splits should be found during tree-growth. \code{none} grows oblique trees using full oblique splits, \code{model.selection.aic} performs variable selection with AIC from the full model upon the best ideal split, \code{model.selection.bic} similarly for BIC, \code{lasso.aic} applies L1 regularization from the full model and chooses the penalization parameter with AIC and \code{lasso.bic} similarly for BIC.}
  \item{\dots}{Additional arguments that are passed to \code{tree.control}. Normally used for \code{mincut}, \code{minsize} or \code{mindev}.}
}
\details{
  An oblique tree is grown by binary recursive partitioning using the response in the specified formula and by choosing splits composed of terms from the right-hand-side. Where categorical attributes are considered levels of unordered factors are divided into two non-empty groups, where axis-parallel splits are considered numeric variables are divided into \eqn{X < a} and \eqn{X \geq a} and where oblique splits are considered numeric variables are divided into \eqn{\sum aX < c} and \eqn{\sum aX \geq c}. The split that maximizes the reduction in impurity is chosen and the process repeated. Splitting continues until the terminal nodes are either pure, sufficiently pure or too small to be split.

  When growing oblique trees, \eqn{2^{R-1}-1} logistic regression problems need to be (where \eqn{R} is the number of residual classes at a node). If observations come from more than 20 classes this approach will be slow. 
}
\value{
  An object of class \code{c("oblique.tree","tree")} is returned with components
  \item{frame}{A data frame with a row for each node and \code{row.names} giving the node numbers. The columns include \code{var}, the variable used to perform each split (where "" denotes an oblique split and \code{"<leaf>"} a terminal node), \code{n}, the number of cases reaching that node, \code{dev} the deviance of the node, \code{yval}, the class associated to that node, \code{split}, a two-column matrix of the labels for left and right splits at the node and \code{yprob}, a matrix of fitted probabilities for each response level.}
  \item{where}{A vector indicating the row number of the frame detailing the node to which each case is assigned.}
  \item{terms}{The terms of the formula.}
  \item{call}{The matched call to \code{oblique.tree}.}
  \item{y}{Predicted classes of each observation by the tree (this differs from the implementation in the \pkg{tree} package where \code{y} is instead used to denote the actual classes).}

  A tree with no splits is of class \code{"singlenode"} which inherits from class \code{"tree"}.

}
\references{ 
  Truong. A (2009) \emph{Fast Growing and Interpretable Oblique Trees via Probabilistic Models}

  Ripley, B. D. (1996). \emph{Pattern Recognition and Neural Networks.} Cambridge University Press, Cambridge. Chapter 7.
}
\author{
  A. Truong
}
\seealso{
  \code{tree.control} in the \pkg{tree} package, \code{\link{predict.oblique.tree}}, \code{\link{prune.oblique.tree}}, \code{\link{trim.oblique.tree}}
}
\examples{
#create the augmented crabs dataset
data(crabs, package = "MASS")
aug.crabs.data <- data.frame(	g=factor(rep(1:4,each=50)),
				predict(princomp(crabs[,4:8]))[,2:3])

plot(	aug.crabs.data[,-1],type="n")
text(	aug.crabs.data[,-1],
	col=as.numeric(aug.crabs.data[,1]),
	labels=as.numeric(aug.crabs.data[,1]))

#grow a full oblique tree
ob.tree <- oblique.tree(formula		= g~.,
			data		= aug.crabs.data,
			oblique.splits	= "only")
plot(ob.tree);text(ob.tree)
}
\keyword{tree}

