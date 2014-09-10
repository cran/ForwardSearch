\name{ForwardSearch.pointwise.asymptotics}
\alias{ForwardSearch.pointwise.asymptotics}
\title{Functions for asymptotic theory of Forward Search}
\description{Computes functions appearing in asymptotic theory of Forward Search based on Johansen and Nielsen (2013).}
\usage{ForwardSearch.pointwise.asymptotics(psi, ref.dist = "normal")}
\arguments{
  \item{psi}{Number or vector.  Takes value(s) in interval 0,1.}
  \item{ref.dist}{Character.  Reference distribution
  		\describe{
			\item{"normal"}{Standard normal distribution}
				}	
		}
}
\details{
	The asymptotic theory is developed in
	Johansen and Nielsen (2013), see Section 2.2.

	\eqn{c} and \eqn{\psi} are linked through
	\eqn{P(|\epsilon|<c)=\psi},
	where
	\eqn{\epsilon}
	is a random variable with the chosen reference distribution.

	\eqn{\zeta} is a consistency factor. Its square is defined as
	the truncated second moment
	\eqn{\tau = \int_{-c}^{c} x^2 f(x) dx}
	divided by \eqn{\psi}.

	\eqn{\varpi} is the asymptotic standard deviation resulting from Theorem 3.3.
}
\value{
	\item{varpi}{Number or vector. sdv for forward residuals normalized by variance estimator
			and multiplied by twice the reference densisty.}
	\item{zeta}{Number or vector.  Consistency correction factor.}
	\item{sdv.unbiased}{Number or vector.  varpi/2/f.}
	\item{sdv.biased}{Number or vector.  varpi/2/f/zeta.}
	\item{c}{Number or vector.  c (median in unbiased case).}
	\item{median.biased}{Number or vector.  median (in biased case).}
}
\references{
	Johansen, S. and Nielsen, B. (2013) Asymptotic analysis of the Forward Search. \emph{Download}: \href{http://www.nuffield.ox.ac.uk/economics/papers/2013/ForwardSearchAsymp10feb2013.pdf}{Nuffield DP}.
}
\author{Bent Nielsen <bent.nielsen@nuffield.ox.ac.uk> 9 Sep 2014}
\examples{
#####################
#	EXAMPLE 1
#	Suppose n=100. Get asymptotic values for grid psi = (1, ... ,n)/n

n	<- 100
psi	<- seq(1,n-1)/n
FS	<- ForwardSearch.pointwise.asymptotics(psi)

#	Plot for biased normalisation
#	- matching choice of Atkinson and Riani (2000)

main <- "Pointwise confidence bands for n=100\n Biased normalisation"
ylab <-	"forward residual asymptotics"
 plot(psi,FS$median.biased,ylim=c(0,3),ylab=ylab,main=main,type="l")
lines(psi,FS$median.biased-2*FS$sdv.biased/sqrt(n))
lines(psi,FS$median.biased+2*FS$sdv.biased/sqrt(n))

#	Plot for unbiased normalisation

main <- "Pointwise confidence bands for n=100\n Unbiased normalisation"
ylab <-	"forward residual asymptotics"
 plot(psi,FS$c,ylim=c(0,3),ylab=ylab,main=main,type="l")
lines(psi,FS$c-2*FS$sdv.unbiased/sqrt(n))
lines(psi,FS$c+2*FS$sdv.unbiased/sqrt(n))

}
