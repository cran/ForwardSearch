\name{ForwardSearch.stopped}
\alias{ForwardSearch.stopped}
\title{Forward estimators after m steps}
\description{A Forward Search gives a sequence of regression estimators. 
	This function gives the regression estimators when stopped at m.}
\usage{ForwardSearch.stopped(FS, m)}
\arguments{
  	\item{FS}{List. Value of the function \code{\link{ForwardSearch.fit}}.}
  	\item{m}{Integer. Stopping time.}
	}
\value{
	\item{ranks.selected}{Vector. Ranks of m observations in the selected set.}
	\item{ranks.outliers}{Vector. Ranks of n-m observations that are not selected.
		These are the "outliers". It is the complement to \code{ranks.selected}.}
	\item{beta.m}{Vector. Least squares estimator based on \code{ranks.selected}.}    
	\item{sigma2.biased	Scalar.}{Scalar.
		Least squares residual variance based on \code{ranks.selected}. 
		Value is *not* bias corrected.}
}
\references{
	Johansen, S. and Nielsen, B. (2013) Asymptotic analysis of the Forward Search. \emph{Download}: \href{http://www.nuffield.ox.ac.uk/economics/papers/2013/ForwardSearchAsymp10feb2013.pdf}{Nuffield DP}.

	Johansen, S. and Nielsen, B. (2014) Outlier detection algorithms for least squares time series. \emph{Download}: \href{http://www.nuffield.ox.ac.uk/economics/papers/2014/OutlierDetectionAlgorithms.pdf}{Nuffield DP}.
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

ForwardSearch.stopped(FS95,107)

}