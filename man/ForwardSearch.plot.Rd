\name{ForwardSearch.plot}
\alias{ForwardSearch.plot}
\title{Plots forward residuals with simultaneous confidence bands}
\description{Plots forward residuals with simultaneous confidence bands based on Johansen and Nielsen (2013, 2014).}
\usage{ForwardSearch.plot(FS, ref.dist = "normal",
	bias.correct = FALSE, return = FALSE, plot.legend = TRUE,
	col = NULL, legend = NULL, lty = NULL, lwd = NULL,
	main = NULL, type = NULL, xlab = NULL, ylab = NULL)}
\arguments{
  	\item{FS}{List. Value of the function \code{\link{ForwardSearch.fit}}.}
  	\item{ref.dist}{Character.  Reference distribution.
  		\describe{
			\item{"normal"}{standard normal distribution.}
		}}
  	\item{bias.correct}{Logical.                                                   
		If FALSE do not bias correct variance, so plots have       
		appearance similar to Atkinson and Riani (2000).		
		If TRUE do bias correct variance, so plots start at origin.
		Default is FALSE.}
  	\item{return}{Logical. Default is FALSE: do not return values.}
  	\item{plot.legend}{Logical. Default is TRUE: include legend in plot.}
  	\item{col}{\code{plot} parameter. Vector of 6 colours.}
  	\item{legend}{\code{plot} parameter. Vector of 6 characters.}
  	\item{lty}{\code{plot} parameter. Vector of 6 line types.}
  	\item{lwd}{\code{plot} parameter. Vector of 6 line widths.}
  	\item{main}{\code{plot} parameter. Character.}
  	\item{type}{\code{plot} parameter. Charcater for plot type.}
  	\item{xlab}{\code{plot} parameter. Charcater for x label.}
  	\item{ylab}{\code{plot} parameter. Charcater for y label.}
}
\value{
	\item{ref.dist}{Character. From argument.}				
	\item{bias.correct}{Logical. From argument.}			
	\item{forward.residual.scaled}{Vector. Forward residuals scaled by estimated variance.
		The estimated variance is or is not bias corrected depending on the choice of
		\code{bias.correct}.}	
	\item{forward.asymp.median}{Vector. Asymptotic median.}
	\item{forward.asymp.sdv}{Vector. Asymptotic standard deviation. Not divided by
		squareroot of sample size.}
	\item{cut.off}{Matrix.  Cut-offs taken from Table 3 of Johansen and Nielsen (2014).}	
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

ForwardSearch.plot(FS95)

}