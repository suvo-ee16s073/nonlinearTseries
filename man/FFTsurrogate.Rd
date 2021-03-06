% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/surrogate.data.R
\name{FFTsurrogate}
\alias{FFTsurrogate}
\title{Generate surrogate data using the Fourier transform}
\usage{
FFTsurrogate(time.series, n.samples = 1)
}
\arguments{
\item{time.series}{The original time.series from which the surrogate data is generated.}

\item{n.samples}{The number of surrogate data sets to generate,}
}
\value{
A matrix containing the generated surrogate data (one time series per row).
}
\description{
Generates surrogate samples from the original time series.
}
\details{
This function uses the phase randomization procedure for
generating the surrogated data. This algorithm generates surrogate data with the same
mean and autocorrelation function (and thus, the same power spectrum because of the
Wiener-Khinchin theorem) as the original time series.

The phase randomization algorithm is often used when the null hypothesis being tested
consist on the assumption that the time.series data comes from a stationary linear
stochastic process with Gaussian inputs. The phase randomization preserves the Gaussian
distribution.
}
\examples{
\dontrun{
# generate 20 surrogate sets using as original time series
# an arma(1,1) simulation
time.series = arima.sim(list(order = c(1,0,1), ar = 0.6, ma = 0.5), n = 200)
surrogate = FFTsurrogate(time.series, 20)
}
}
\author{
Constantino A. Garcia
}
\references{
H. Kantz  and T. Schreiber: Nonlinear Time series Analysis (Cambridge university press)
}

