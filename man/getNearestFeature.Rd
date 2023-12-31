% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hiAnnotator.R
\name{getNearestFeature}
\alias{getNearestFeature}
\title{Get nearest annotation boundary for a position range.}
\usage{
getNearestFeature(
  sites.rd,
  features.rd,
  colnam = NULL,
  side = "either",
  feature.colnam = NULL,
  dists.only = FALSE,
  parallel = FALSE,
  relativeTo = "subject"
)
}
\arguments{
\item{sites.rd}{GRanges object to be used as the query.}

\item{features.rd}{GRanges object to be used as the subject or the
annotation table.}

\item{colnam}{column name to be added to sites.rd for the newly calculated
annotation...serves a core!}

\item{side}{boundary of annotation to use to calculate the nearest distance.
Options are '5p','3p', 'either'(default), or 'midpoint'.}

\item{feature.colnam}{column name from features.rd to be used for retrieving
the nearest feature name. By default this is NULL assuming that features.rd
has a column that includes the word 'name' somewhere in it.}

\item{dists.only}{flag to return distances only. If this is TRUE, then
'feature.colnam' is not required and only distance to the nearest feature
will be returned. By default this is FALSE.}

\item{parallel}{use parallel backend to perform calculation with
\code{\link[foreach]{foreach}}. Defaults to FALSE. If no parallel backend is
registered, then a serial version of foreach is ran using
\code{\link[foreach]{registerDoSEQ}}.}

\item{relativeTo}{calculate distance relative to query or subject.
Default is 'subject'. This essentially means whether to use query or subject
as the anchor point to get distance from!}
}
\value{
a GRanges object with new annotation columns appended at the end
of sites.rd.
}
\description{
Given a query object, the function retrieves the nearest feature and its
properties from a subject and then appends them as new columns within the
query object. When used in genomic context, the function can be used to
retrieve the nearest gene 5' or 3' end relative to genomic position
of interest.
}
\note{
\itemize{
  \item When side='midpoint', the distance to nearest feature is
  calculated by (start+stop)/2.
  \item If strand information doesn't exist, then everything is defaulted
  to '+' orientation (5' -> 3')
  \item If parallel=TRUE, then be sure to have a parallel backend registered
  before running the function. One can use any of the following libraries
  compatible with \code{\link[foreach]{foreach}}: doMC, doSMP, doSNOW, doMPI,
  doParallel. For example: library(doMC); registerDoMC(2)
  \item When relativeTo="subject", the biological distance is relative to
  subject, meaning, the function reports the distance to query from subject
  (i.e. an integration site is upstream or downstream from a gene).
  When relativeTo="query", the distance is from the point of view of query
  or an integration site (i.e. gene is upstream or downstream from an
  integration site).
}
}
\examples{
# Convert a dataframe to GRanges object
data(sites)
alldata.rd <- makeGRanges(sites, soloStart = TRUE)

data(genes)
genes.rd <- makeGRanges(genes)

nearestGenes <- getNearestFeature(alldata.rd, genes.rd, "NearestGene")
nearestGenes
nearestGenes <- getNearestFeature(alldata.rd, genes.rd, "NearestGene",
side = "5p")
nearestGenes
\dontrun{
nearestGenes <- getNearestFeature(alldata.rd, genes.rd, "NearestGene",
side = "3p")
nearestGenes
nearestGenes <- getNearestFeature(alldata.rd, genes.rd, "NearestGene",
side = "midpoint")
## Parallel version of getNearestFeature
nearestGenes <- getNearestFeature(alldata.rd, genes.rd, "NearestGene",
parallel = TRUE)
nearestGenes
}
}
\seealso{
\code{\link{makeGRanges}}, \code{\link{getFeatureCounts}},
\code{\link{getSitesInFeature}}, \code{\link{get2NearestFeature}}.
}
