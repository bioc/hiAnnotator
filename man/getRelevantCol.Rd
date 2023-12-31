% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hiAnnotator.R
\name{getRelevantCol}
\alias{getRelevantCol}
\title{Find the column index of interest given the potential choices.}
\usage{
getRelevantCol(col.names, col.options, col.type = NULL, multiple.ok = FALSE)
}
\arguments{
\item{col.names}{column names from a dataframe}

\item{col.options}{potential column names or partial names that may exist
in col.names}

\item{col.type}{type of column information the function is searching for,
used in construction of error messages. Default is NULL.}

\item{multiple.ok}{if multiple matches are found then return indices,
else spit an error out. Default is TRUE.}
}
\value{
the index of usable column(s) or an error if no applicable
column is found.
}
\description{
The function finds relevant column(s) of interest from a vector of column
names derived from a dataframe. If no usable column is found, the function
spits out a relevant error or returns the index of the usable column(s).
This is an assistant function called by functions listed in the
see also section.
}
\examples{
data(sites)
names(sites)
getRelevantCol(names(sites), c("chr", "chromosome", "tname", "seqnames",
"chrom","contig"),"seqnames")
getRelevantCol(names(sites), c("ort", "orientation", "strand"), "strand")
}
\seealso{
\code{\link{makeGRanges}}, \code{\link{getNearestFeature}},
\code{\link{getSitesInFeature}}.
}
