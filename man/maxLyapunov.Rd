% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/Lyapunov.R
\name{maxLyapunov}
\alias{divTime.maxLyapunov}
\alias{divergence.maxLyapunov}
\alias{embeddingDims.maxLyapunov}
\alias{estimate.maxLyapunov}
\alias{maxLyapunov}
\alias{plot.maxLyapunov}
\title{Maximum lyapunov exponent}
\usage{
maxLyapunov(time.series, min.embedding.dim = 2,
  max.embedding.dim = min.embedding.dim, time.lag = 1, radius,
  theiler.window = 1, min.neighs = 5, min.ref.points = 500,
  max.time.steps = 10, number.boxes = NULL, sampling.period = 1,
  do.plot = TRUE, ...)

\method{divTime}{maxLyapunov}(x)

\method{embeddingDims}{maxLyapunov}(x)

\method{divergence}{maxLyapunov}(x)

\method{plot}{maxLyapunov}(x, main = "Estimating maximal Lyapunov exponent",
  xlab = "time t", ylab = "S(t)", type = "p", col = NULL, pch = NULL,
  add.legend = T, ...)

\method{estimate}{maxLyapunov}(x, regression.range = NULL, do.plot = FALSE,
  use.embeddings = NULL, main = "Estimating maximal Lyapunov exponent",
  xlab = "time t", ylab = "S(t)", type = "p", col = NULL, pch = NULL,
  ylim = NULL, fit.col = NULL, fit.lty = 2, fit.lwd = 2,
  add.legend = T, ...)
}
\arguments{
\item{time.series}{The original time series from which the maximal Lyapunov exponent will be estimated}

\item{min.embedding.dim}{Integer denoting the minimum dimension in which we shall embed the time.series (see \link{buildTakens}).}

\item{max.embedding.dim}{Integer denoting the maximum dimension in which we shall embed the time.series (see \link{buildTakens}).Thus,
we shall estimate the Lyapunov exponent between \emph{min.embedding.dim} and \emph{max.embedding.dim}.}

\item{time.lag}{Integer denoting the number of time steps that will be use to construct the
Takens' vectors (see \link{buildTakens}).}

\item{radius}{Maximum distance in which will look for nearby trajectories.}

\item{theiler.window}{Integer denoting the Theiler window:  Two Takens' vectors must be separated by more than
\emph{theiler.window} time steps in order to be considered neighbours. By using a Theiler window, we exclude temporally correlated
vectors from our estimations.}

\item{min.neighs}{Minimum number of neighbours that a Takens' vector must have to be considered
a reference point.}

\item{min.ref.points}{Number of reference points that the routine will try to use. The routine stops when it finds
\emph{min.ref.points} reference points, saving computation time.}

\item{max.time.steps}{Integer denoting the number of time steps marking the end of the linear region.}

\item{number.boxes}{Number of boxes that will be used in the box assisted algorithm (see \link{neighbourSearch}).}

\item{sampling.period}{Sampling period of the time series. When dealing with a discrete
system, the \emph{sampling.period} should be set to 1.}

\item{do.plot}{Logical value. If TRUE (default value), a plot of \eqn{S(t)} Vs  \eqn{t} is shown.}

\item{...}{Additional plotting parameters.}

\item{x}{A \emph{maxLyapunov} object.}

\item{main}{A title for the plot.}

\item{xlab}{A title for the x axis.}

\item{ylab}{A title for the y axis.}

\item{type}{Type of plot (see \code{\link[graphics]{plot}}).}

\item{col}{Vector of colors for each of the dimensions of the plot.}

\item{pch}{Vector of symbols for each of the dimensions of the plot.}

\item{add.legend}{add a legend to the plot?}

\item{regression.range}{Vector with 2 components denoting the range where the function will perform linear regression.}

\item{use.embeddings}{A numeric vector specifying which embedding dimensions should
the \emph{estimate} function use to compute the Lyapunov exponent.}

\item{ylim}{Numeric vector of length 2, giving the y coordinates range.}

\item{fit.col}{A vector of colors to plot the regression lines.}

\item{fit.lty}{The type of line to plot the regression lines.}

\item{fit.lwd}{The width of the line for the regression lines.}
}
\value{
A list with three components named  \eqn{time} and \eqn{s.function}.
\eqn{time} is a vector containing the temporal interval where the system
evolves. It ranges from 0 to
\emph{\eqn{max.time.steps \cdot sampling.period}{max.time.steps * sampling.period}}.
\eqn{s.function} is a matrix containing the
values of the \eqn{S(t)} for each t in the time vector(the columns) and each
embedding dimension (the rows).

The \emph{divTime} function returns the
time in which the divergence of close trajectories was computed.

The \emph{embeddingDims} function returns the
embeddings in which the divergence of close trajectories was computed

The \emph{divergence} function returns the
rate of divergence of close trajectories needed for the maximum Lyapunov
exponent estimation.

In order to obtain an estimation of the Lyapunov exponent the user can use the
\emph{estimate} function. The  \eqn{estimate} function allows the user to obtain
an estimation of the maximal Lyapunov exponent by averaging the slopes of the
embedding dimensions specified in the \emph{use.embeddings} parameter. The
slopes are determined by performing a linear regression
over the radius' range specified in \emph{regression.range}
}
\description{
Functions for estimating the maximal Lyapunov exponent of a dynamical system
 from 1-dimensional time series using Takens' vectors.
}
\details{
It is a well-known fact that close trajectories diverge exponentially fast in a chaotic system. The
averaged exponent that determines the divergence rate is called the Lyapunov exponent (usually denoted with \eqn{\lambda}{lambda}).
If \eqn{\delta(0)}{delta(0)} is the distance between two Takens' vectors in the embedding.dim-dimensional space, we expect that the distance
after a time \eqn{t} between the two trajectories arising from this two vectors fulfills:
\deqn{\delta (n) \sim \delta (0)\cdot exp(\lambda \cdot t)}{\delta (n) is.approximately \delta (0) exp(\lambda *t).}
The lyapunov exponent is estimated using the slope obtained by performing a linear regression of
\eqn{S(t)=\lambda \cdot t \sim log(\delta (t)/\delta (0))}{S(t)=\lambda *t is.approximately log(\delta (t)/\delta (0))}
on  \eqn{t}. \eqn{S(t)} will be estimated by averaging the divergence of several reference points.

The user should plot \eqn{S(t) Vs t} when looking for the maximal lyapunov exponent and, if for some temporal range
\eqn{S(t)} shows a linear behaviour, its slope is an estimate of the maximal Lyapunov exponent per unit of time. The estimate
 routine allows the user to get always an estimate of the maximal Lyapunov exponent, but the user must check that there is a linear region in the
\eqn{S(t) Vs t}. If such a region does not exist, the estimation should be discarded. The computations should be performed
for several embedding dimensions in order to check that the Lyapunov exponent does not depend on the embedding dimension.
}
\examples{
\dontrun{
## Henon System
h=henon(n.sample=  5000,n.transient= 100, a = 1.4, b = 0.3,
        start = c(0.63954883, 0.04772637), do.plot = FALSE)
my.ts=h$x
ml=maxLyapunov(time.series=my.ts,
               min.embedding.dim=2,
               max.embedding.dim=5,
               time.lag=1,
               radius=0.001,theiler.window=4,
               min.neighs=2,min.ref.points=500,
               max.time.steps=40,do.plot=FALSE)
plot(ml)
ml.estimation = estimate(ml,regression.range = c(0,15),
                         use.embeddings=4:5,
                         do.plot = TRUE)
# The max Lyapunov exponent of the Henon system is 0.41
cat("expected: ",0.41," calculated: ",ml.estimation,"\\n")

## Rossler system
r=rossler(a=0.15,b=0.2,w=10,start=c(0,0,0), time=seq(0,1000,0.1),do.plot=FALSE)
my.ts=r$x
use.cols = c("#999999","#E69F00","#56B4E9")
ml=maxLyapunov(time.series=my.ts,min.embedding.dim=5,max.embedding.dim = 7,
               time.lag=12,radius=0.1,theiler.window=50,
               min.neighs=5,min.ref.points=length(r),
               max.time.steps=300,number.boxes=NULL,
               sampling.period=0.1,do.plot=TRUE,
               col=use.cols)
#  The max Lyapunov exponent of the Rossler system is 0.09
ml.est=estimate(ml,col=use.cols,do.plot=T,
                fit.lty=1,
                fit.lwd=5)
cat("expected: ",0.090," calculated: ",ml.est,"\\n")
}
}
\author{
Constantino A. Garcia
}
\references{
Eckmann, Jean-Pierre and Kamphorst, S Oliffson and Ruelle, David and Ciliberto, S and others. Liapunov exponents from time series.
Physical Review A, 34-6, 4971--4979, (1986).

Rosenstein, Michael T and Collins, James J and De Luca, Carlo J.A practical method for calculating largest Lyapunov exponents from small data sets.
Physica D: Nonlinear Phenomena, 65-1, 117--134, (1993).
}

