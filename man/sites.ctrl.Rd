% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hiAnnotator.R
\docType{data}
\name{sites.ctrl}
\alias{sites.ctrl}
\title{Controls for Sample Retrovirus Integration Sites data}
\format{
A data frame with 3909 rows and 6 variables
}
\description{
Controls for a sample dataset containing collection of unique HIV & MLV
integration sites in the human genome mapped to UCSC freeze hg18 from
PMID: 12805549. Each row represents three controls per integration site
in sites object.
}
\details{
\itemize{
  \item Sequence. Name of the DNA sequence which was aligned to the host
  genome. There should be three control sites per experimental site from the
  "sites" dataset.
  \item Position. The genomic coordinate of the integration site.
  \item Chr. The chromosome of the integration site.
  \item Ort. The orientation or strand of the integration site.
  \item virus. Name of the virus used for the experiment and a given
  sequencing clone.
  \item type. Column denoting whether the data is control
}
}
\keyword{datasets}
