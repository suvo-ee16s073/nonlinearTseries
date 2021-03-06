% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/nonLinearSystems.R
\name{cliffordMap}
\alias{cliffordMap}
\title{Clifford map}
\usage{
cliffordMap(a = -1.4, b = 1.6, cc = 1, d = 0.7, start = runif(2),
  n.sample = 5000, n.transient = 500, do.plot = TRUE)
}
\arguments{
\item{a}{The \emph{a} parameter. Default: -1.4}

\item{b}{The \emph{b} parameter. Default: 1.6}

\item{cc}{The \emph{c} parameter. Default: 1.0}

\item{d}{The \emph{d} parameter. Default: 0.7}

\item{start}{a 2-dimensional vector indicating the starting values for the x and y Clifford coordinates.
If the starting point is not specified, it is generated randomly.}

\item{n.sample}{Length of the generated time series. Default: 5000 samples.}

\item{n.transient}{Number of transient samples that will be discarded. Default: 500 samples.}

\item{do.plot}{Logical value. If TRUE (default value), a plot of the generated Clifford system is shown.}
}
\value{
A list with two vectors named x and y containing the x-components and the
y-components of the Clifford map, respectively.
}
\description{
Generates a 2-dimensional time series using the Clifford map.
}
\details{
The Clifford map is defined as follows:
\deqn{x_{n+1} = sin(a \cdot y_n) + c \cdot cos(a \cdot x_n)}{x[n+1] = sin(a*y[n]) + c*cos(a*x[n])}
\deqn{y_{n+1} = sin(b \cdot x_n) + d \cdot cos(b \cdot y_n)}{y[n+1] = sin(b*x[n] + d*cos(b*y[n])}
The default selection for the \emph{a} \emph{b} \emph{c} and \emph{d} parameters is known to
produce a deterministic chaotic time series.
}
\note{
Some initial values may lead to an unstable system that will tend to infinity.
}
\examples{
\dontrun{
clifford.map=cliffordMap(n.sample = 1000, n.transient=10,do.plot=TRUE)
# accessing the x coordinate and plotting it
plot(ts(clifford.map$x))}
}
\author{
Constantino A. Garcia
}
\seealso{
\code{\link{henon}, \link{logisticMap}, \link{lorenz}, \link{rossler}, \link{ikedaMap}, \link{sinaiMap}, \link{gaussMap}}
}

