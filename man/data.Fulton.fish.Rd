\name{Fulton}
\alias{Fulton}
\docType{data}
\title{Fulton fish data}
\description{Data from Fulton fish market collected by Graddy (1995, 2006).
See also Hendry and Nielsen (2007) and Johansen and Nielsen (2014)}
\usage{data(Fulton)}
\format{Matrix with 111 rows of daily data and 13 variables.}
\details{
	Documentation on the Fulton Fish market and original data can be found in
	Graddy (1995, 2006). 
	Documentation for aggregated data used here can be found in
	Angrist, Graddy and Imbens (2000).
	Data used as example in
	Hendry and Nielsen (2007).
	Downloaded from
	\href{http://users.ox.ac.uk/~nuff0078/EconometricModeling/}{Econometric Modeling}.

	The data set comprises aggregated daily prices and quantities of
	whiting sold in the period 2 December 1991 to 8 May 1992.
	In particular it has the variables
	\describe{
		\item{Monday}{1 if Monday, 0 otherwise.}
		\item{Tuesday}{1 if Tuesday, 0 otherwise.}
		\item{Wednesday}{1 if Wednesday, 0 otherwise.}
		\item{Thursday}{1 if Thursday, 0 otherwise}
		\item{Date}{}
		\item{Stormy}{1 if
			Wave hight greater than 4.5 feet
			Wind speed greater than 18 knots
			Based on moving averages of the last three days' wind speed and wave
			height before the trading day, as measured off the coast of Long
			Island and reported in the New York Times boating forecast.}
		\item{Mixed}{1 if
			Wave hight greater than 3.8 feet
			Wind speed greater than 13 knots
			excluding stormy days.
			Based on moving averages of the last three days' wind speed and wave
			height before the trading day, as measured off the coast of Long
			Island and reported in the New York Times boating forecast.}
		\item{LogPrice}{Prices are average prices in US dollars per pound.}
		\item{LogQuantity}{Quantities are pounds of whiting per day.}
		\item{Rainy}{1 if rainy wheather on shore.}
		\item{Cold}{1 if cold wheather on shore.}
		\item{Windspeed}{}
		\item{Windspeed2}{Square of windspeed.}
	}	
}
\source{
	Angrist, J.D., Graddy, K. and Imbens, G.W. (2000) The interpretation of
		instrumental variables estimators in simultaneous equations models
	 	with an application to the demand for fish.
		\emph{Review of Economic Studies} 67, 499-527.
		
	Graddy, K. (1995) Testing for imperfect competition at the Fulton Fish Market.
		\emph{RAND Journal of Economics} 26, 75-92.
		
	Graddy, K. (2006) The Fulton Fish Market.
		\emph{Journal of Economic Perspectives} 20, 207-220.
		
	Hendry, D.F. and Nielsen, B. (2007)
		\emph{Econometric Modeling}.  Princeton University Press.

	Johansen, S. and Nielsen, B. (2014) Outlier detection algorithms for least squares time series. \emph{Download}: \href{http://www.nuffield.ox.ac.uk/economics/papers/2014/OutlierDetectionAlgorithms.pdf}{Nuffield DP}.
}
\examples{
	data(Fulton)
}
\keyword{datasets}
