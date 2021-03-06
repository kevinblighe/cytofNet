% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/markerExpressionPerCluster.R
\name{markerExpressionPerCluster}
\alias{markerExpressionPerCluster}
\title{Generate box-and-whisker plots illustrating marker expression per k-NN identified cluster. By default, 5 randomly-selected clusters are selected, and the expression profiles of 10 randomly-selected markers are plot across these.}
\usage{
markerExpressionPerCluster(
  indata,
  assay = "scaled",
  clusters = sample(unique(metadata(indata)[["Cluster"]]), 5),
  clusterAssign = metadata(indata)[["Cluster"]],
  markers = sample(rownames(indata), 10),
  ncol = 5,
  nrow = 2,
  legendPosition = "none",
  legendLabSize = 12,
  legendKeyHeight = 2.5,
  xlim = NULL,
  ylim = NULL,
  yfixed = FALSE,
  xlab = "Marker",
  xlabAngle = 90,
  xlabhjust = 0.5,
  xlabvjust = 0.5,
  ylab = "Expression",
  ylabAngle = 0,
  ylabhjust = 0.5,
  ylabvjust = 0.5,
  axisLabSize = 16,
  stripLabSize = 16,
  title = "Marker expression per cluster",
  subtitle = "",
  caption = "",
  titleLabSize = 16,
  subtitleLabSize = 12,
  captionLabSize = 12,
  borderWidth = 0.8,
  borderColour = "black",
  verbose = TRUE
)
}
\arguments{
\item{indata}{A data-frame or matrix, or SingleCellExperiment object. If a
data-frame or matrix, this should relate to expression data (cells as
columns; genes as rows). If a \code{SingleCellExperiment} object, data will be
extracted from an assay component named by \code{assay}.}

\item{assay}{Name of the assay slot in \code{indata} from which data will be
taken, assuming \code{indata} is a \code{SingleCellExperiment} object.}

\item{clusters}{Vector containing clusters to plot.}

\item{clusterAssign}{A vector of cell-to-cluster assignments. This can be
from any source but must align with your cells / variables. There is no
check to ensure this when \code{indata} is not a \code{SingleCellExperiment} object.}

\item{markers}{Vector containing marker names to plot.}

\item{ncol}{Number of columns for faceting.}

\item{nrow}{Number of rows for faceting.}

\item{legendPosition}{Position of legend \code{('top', 'bottom', 'left', 'right',
'none')}.}

\item{legendLabSize}{Size of plot legend text.}

\item{legendKeyHeight}{Height of the legend key.}

\item{xlim}{Limits of the x-axis.}

\item{ylim}{Limits of the y-axis.}

\item{yfixed}{Logical, specifying whether or not to fix the y-axis
scales across all clusters when faceting.}

\item{xlab}{Label for x-axis.}

\item{xlabAngle}{Rotation angle of x-axis labels.}

\item{xlabhjust}{Horizontal adjustment of x-axis labels.}

\item{xlabvjust}{Vertical adjustment of x-axis labels.}

\item{ylab}{Label for y-axis.}

\item{ylabAngle}{Rotation angle of y-axis labels.}

\item{ylabhjust}{Horizontal adjustment of y-axis labels.}

\item{ylabvjust}{Vertical adjustment of y-axis labels.}

\item{axisLabSize}{Size of x- and y-axis labels.}

\item{stripLabSize}{Size of the strip labels.}

\item{title}{Plot title.}

\item{subtitle}{Plot subtitle.}

\item{caption}{Plot caption.}

\item{titleLabSize}{Size of plot title.}

\item{subtitleLabSize}{Size of plot subtitle.}

\item{captionLabSize}{Size of plot caption.}

\item{borderWidth}{Width of the border on the x and y axes.}

\item{borderColour}{Colour of the border on the x and y axes.}

\item{verbose}{Boolean (TRUE / FALSE) to print messages to console or not.}
}
\value{
A \code{ggplot2} object.
}
\description{
Generate box-and-whisker plots illustrating marker expression per k-NN identified cluster. By default, 5 randomly-selected clusters are selected, and the expression profiles of 10 randomly-selected markers are plot across these.
}
\details{
Generate box-and-whisker plots illustrating marker expression per k-NN identified cluster. By default, 5 randomly-selected clusters are selected, and the expression profiles of 10 randomly-selected markers are plot across these.
}
\examples{
# create random data that follows a negative binomial
mat <- jitter(matrix(
  MASS::rnegbin(rexp(5000, rate=.1), theta = 4.5),
  ncol = 20))
colnames(mat) <- paste0('CD', 1:ncol(mat))
rownames(mat) <- paste0('cell', 1:nrow(mat))

clus <- clusKNN(mat)
markerExpressionPerCluster(t(mat), clusters = c(0, 1),
  clusterAssign = clus)

}
\author{
Kevin Blighe <kevin@clinicalbioinformatics.co.uk>
}
