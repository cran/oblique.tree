\name{generate.ith.superclass}
\alias{generate.ith.superclass}
\title{Internal Function to Identify of Ideal Outcomes}
\description{
  Generates logical vectors that identify ideal outcomes.
}
\usage{
generate.ith.superclass(
	R, 
	superclass.index)
}
\arguments{
  \item{R}{The number of residual classes at a node.}
  \item{superclass.index}{Integer in \eqn{1,\ldots,2^{R-1}-1} indicating required ideal outcome.}
}
\details{
  With \eqn{R} residual classes at a node, \eqn{2^{R-1}-1} different ideal outcomes arise. \code{generate.ith.superclass} identifies them.
}
\value{
  A vector of length \eqn{R} with 0's and 1's denoting association with the left superclass.
}
\references{ 
  Truong. A (2009) \emph{Fast Growing and Interpretable Oblique Trees via Probabilistic Models}
} 
\author{A. Truong}
\examples{
#list all ideal outcomes when there are 5 residual classes at a node
for (i in 1:(2^{5-1}-1)){
	ideal.outcome.i <- oblique.tree:::generate.ith.superclass(
		R			= 5, 
		superclass.index	= i)
	print(ideal.outcome.i)
}
}

