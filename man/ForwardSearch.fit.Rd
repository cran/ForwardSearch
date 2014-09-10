\name{ForwardSearch.fit}
\alias{ForwardSearch.fit}
\title{Execute the Forward Search Algorithm.}
\description{Execute the Forward Search Algorithm. 	Based on Johansen & Nielsen (2013).}
\usage{ForwardSearch.fit(x.1, y, psi.0 = 0.5, m.0 = NULL, beta.0 = NULL)}
\arguments{
  	\item{x.1}{Matrix of dimension n x (dim.x -1).             
  		Design matrix for regressors apart from constant.}
  	\item{y}{Vector of dimension n. Dependent variable.}
  	\item{psi.0}{proportion of observations in initial set of set of selected observations.
		Default is 0.5.                                                           
  		Initial set has \code{round(n*psi.0)} observations.}
  	\item{m.0}{Number of observations in initial set of selected observations.
		Default is NULL.
		If value is given this overrides \code{psi.0}.}
  	\item{beta.0}{Vector of dimension dim.x.
		Initial estimator for regression coefficient.						
		Default is NULL, which results in Least Trimmed Squares estimator
		through \code{beta.0 <- ltsReg(y~x.1,alpha=psi.0)$coefficients}.}
	}
\details{Dimensions: n is the number of observations. dim.x is the number of regressors (including intercept).

Default is initial estimator is the Least Trimmed Squares estimator of
Rousseeuw (1984)
implemented as \code{ltsReg} in package \code{robustbase}.

The breakdown point of the initial Least Trimmed Squares estimator
and the size of the initial sub-sample are both
given by \code{psi.0}.  Alternatively, a Least Trimmed Squares estimator
with a particular breakdown point can be entered through the argument \code{beta.0}.
}
\value{
	\item{forward.beta}{Matrix of dimension n x p. Forward Search estimates of beta.}
	\item{forward.sigma2.biased}{Matrix of dimension n x 1.
		Forward Search estimates of sigma. Values are *not* bias corrected.}
	\item{forward.residual}{Matrix of dimension	n x 1.
		Forward Search estimates of forward residuals. Values are *not* bias corrected.}                        
	\item{m.0}{Number of observations in initial set of selected observations.}
	\item{y}{Vector of dimension n. Dependent variable from argument.}
	\item{x}{Matrix of dimension n x dim.x. Design matrix for regressors.
		Dependent variable from argument augmented with constant.
		First column is constant.}
}
\references{
	Johansen, S. and Nielsen, B. (2013) Asymptotic analysis of the Forward Search. \emph{Download}: \href{http://www.nuffield.ox.ac.uk/economics/papers/2013/ForwardSearchAsymp10feb2013.pdf}{Nuffield DP}.

	Johansen, S. and Nielsen, B. (2014) Outlier detection algorithms for least squares time series. \emph{Download}: \href{http://www.nuffield.ox.ac.uk/economics/papers/2014/OutlierDetectionAlgorithms.pdf}{Nuffield DP}.

	Rousseeuw, P.J. (1984) Least median of squares regression. \emph{Journal of the American Statistical Association} 79, 871-880.
}
\author{Bent Nielsen <bent.nielsen@nuffield.ox.ac.uk> 9 Sep 2014}
\examples{
#####################
#	EXAMPLE 1
#	using Fulton Fish data,
#	see Johansen and Nielsen (2014).

#	Call package
library(ForwardSearch)

#	Call data
data(Fulton)
mdata	<- as.matrix(Fulton)
n		<- nrow(mdata)

#	Identify variable to reproduce Johansen and Nielsen (2014)
q		<- mdata[2:n		,9]
q_1		<- mdata[1:(n-1) ,9]
s		<- mdata[2:n		,6]
x.q.s	<- cbind(q_1,s)
colnames(x.q.s	)	<- c("q_1","stormy")

#	Fit Forward Search
FS95	<- ForwardSearch.fit(x.q.s,q,psi.0=0.95)

}
