\name{ForwardSearch-package}
\alias{ForwardSearch-package}
\alias{ForwardSearch}
\docType{package}
\title{Functions for Forward Search for regression models.}
\description{
	The Forward Search algorithm is an iterative algorithm for 
	for multiple (time series) regression suggested by
	Hadi and Simonoff (1993) and developed further by
	Atkinson and Riani (2000).
	The algorithm starts with a robust estimate of the regression parameters and a sub-sample of size
	\eqn{m_0} and iterates with a sequence of least squares steps.
	The asymptotic theory developed by Johansen and Nielsen (2013, 2014)
	is implemented.
}
\details{
	\tabular{ll}{
		Package: \tab ForwardSearch\cr
		Type: \tab Package\cr
		Version: \tab 1.0\cr
		Date: \tab 2014-09-09\cr
		License: \tab GPL-3\cr
	}  	
	The Forward Search algorithm is an iterative algorithm for 
	for multiple (time series) regression suggested by
	Hadi and Simonoff (1993) and developed further by
	Atkinson and Riani (2000).
	The algorithm starts with a robust estimate of the regression parameters and a sub-sample of size
	\eqn{m_0}.
	A common choice for the initial estimator is the Least Trimmed Squares estimator of
	Rousseeuw (1984).

	The algorithm is initiated by computing the absolute residuals for all \eqn{n} observations.
	The initial sub-sample consists of the observations with the smallest \eqn{m_0} absolute
	residuals. We then run a regression on those \eqn{m_0} observations and compute
	absolute residuals of all \eqn{n} observations. The observations with \eqn{m_0+1}
	smallest residuals are then selected. The
	\eqn{m_0+1} smallest residual is the forward residual.
	A new regression is performed on
	these \eqn{m_0+1} observations. This is then iterated. Eventually the least squares estimator
	based on all \eqn{n} observations is computed.

	The algorithm results in a sequence of forward residuals indexed by the sub-sample size
	\eqn{m} running from \eqn{m_0} to \eqn{n-1}.
	The idea is to monitor the plot of these and stop when the forward residuals become "large".
	Johansen and Nielsen (2013, 2014) have developed, respectively,
	pointwise and simultaneous confidence bands for estimators and forward residuals.
	These are implemented in the package.

	The ForwardSearch package can be used as follows.
	\enumerate{
		\item
			Execute the full Forward Search using
			\code{\link{ForwardSearch.fit}}.
		\item
			Create the forward plot of the forward residuals using
			\code{\link{ForwardSearch.plot}}.
			This requires the output from above and a choice of reference distribution.
			The plot shows the scaled forward residuals from above along with simultaneous
			confidence bands.
			The user has to choose a "gauge", which is the expected fraction of falsely
			detected outliers that are tolerable when in fact there are no outliers.  For
			instance a "gauge" of 0.01 indicates that in a sample of n=110 observations
			1.1 outlier is found on average when there are none.
			The simultaneous confidence bands are calibrated so that the Forward Search
			stop when the fitted values exceed the chosen confidence bands the first time.
			This is a stopping time.
			The theory for this is given in Johansen and Nielsen.
		\item
			Get the estimates of the stopped Forward Search using
			\code{\link{ForwardSearch.stopped}}.
			The user has to input the estimated stopping time.
			This also gives the rank of the selected and non-selected observations.
			These are the "good" and the "bad" observations.			
	}
}
\author{Bent Nielsen <bent.nielsen@nuffield.ox.ac.uk> 9 Sep 2014}
\references{
	Atkinson, A.C. and Riani, M. (2000) \emph{Robust Diagnostic Regression Analysis.} New York: Springer.

	Hadi, A.S. and Simonoff, J.S. (1993) Procedures for the Identification of Multiple Outliers in Linear Models \emph{Journal of the American Statistical Association} 88, 1264-1272.

	Johansen, S. and Nielsen, B. (2013) Asymptotic analysis of the Forward Search. \emph{Download}: \href{http://www.nuffield.ox.ac.uk/economics/papers/2013/ForwardSearchAsymp10feb2013.pdf}{Nuffield DP}.

	Johansen, S. and Nielsen, B. (2014) Outlier detection algorithms for least squares time series. \emph{Download}: \href{http://www.nuffield.ox.ac.uk/economics/papers/2014/OutlierDetectionAlgorithms.pdf}{Nuffield DP}.

	Rousseeuw, P.J. (1984) Least median of squares regression. \emph{Journal of the American Statistical Association} 79, 871-880.
}
\seealso{
	Forward Search can alternatively be done by the package
	\href{http://cran.r-project.org/web/packages/forward/index.html}{\code{forward}}.
	\code{forward} version 1.0.3 includes functions for the analysis suggested in e.g.
	Atkinson and Riani (2000), but does not include the asymptotic theory of
	Johansen and Nielsen (2013, 2014).
	Matlab code for Forward Search is also available from
	\href{http://www.riani.it}{www.riani.it}.
}
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
FS80	<- ForwardSearch.fit(x.q.s,q,psi.0=0.80)

#	Forward plot of forward residuals scaled by variance estimate
#	Note the variance estimate is not bias corrected
#	This is taken into account in asymptotic theory
ForwardSearch.plot(FS95)
ForwardSearch.plot(FS80)

#	Based on the plot of e.g. FS95 it is decided to stop at m=107
ForwardSearch.stopped(FS95,107)

#	Alternatively use the file inst/extdata/Fulton.txt 
#	Data	<- read.table(data/Fulton.txt,header=TRUE)

}
\keyword{package}