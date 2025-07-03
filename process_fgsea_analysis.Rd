\name{process_fgsea_analysis}
\alias{process_fgsea_analysis}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Process FGSEA Analysis Results}
\description{
This function processes marker data, performs FGSEA analysis, and returns filtered and sorted results based on normalized enrichment scores (NES), p-values, and user-defined criteria.
}
\usage{
process_fgsea_analysis(markers_file, gmt_path, nperm = 10000, pval_threshold = 0.05, top = 30, selected_pathways = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{markers_file}{
A data frame containing gene markers. It should have at least one column representing log fold change (\code{avg_log2FC}) and row names as gene names.
}
  \item{gmt_path}{
The file path to the GMT file containing pathway definitions for FGSEA analysis.
}
  \item{nperm}{
The number of permutations to perform during FGSEA analysis. Default is 10000.
}
  \item{pval_threshold}{
A numeric value indicating the p-value and adjusted p-value threshold for filtering significant pathways. Default is 0.05.
}
  \item{top}{
The number of top positive and negative pathways to return based on normalized enrichment scores (NES). Default is 30.
}
  \item{selected_pathways}{
A character vector of specific pathway names to extract from the FGSEA results. Default is \code{NULL}, meaning no specific pathways are selected.
}
}
\details{
This function processes the marker data to prepare it for FGSEA analysis by extracting gene names and log fold change values. FGSEA is performed on the provided pathways, and the results are filtered based on the p-value thresholds. The function then sorts pathways by NES and returns the top positive and negative pathways. Optionally, it also extracts user-specified pathways for detailed examination.
}
\value{
A list containing:
\item{fgsea_results}{A tibble of FGSEA results filtered by \code{pval_threshold}, sorted by NES.}
\item{top_negative}{The top \code{top} negative pathways based on NES.}
\item{top_positive}{The top \code{top} positive pathways based on NES.}
\item{selected}{The FGSEA results for user-specified pathways, if provided. Otherwise, \code{NULL}.}
}
\references{
Subramanian et al. (2005). Gene Set Enrichment Analysis: A Knowledge-Based Approach for Interpreting Genome-Wide Expression Profiles. \emph{PNAS}.
}
\author{
Ehsan
}
\note{
Ensure that the \code{gmt_path} file exists and is accessible before running this function.
}
\seealso{
\code{\link{fgsea}}, \code{\link{gmtPathways}}
}
\examples{
## Example Usage
markers_file <- data.frame(avg_log2FC = c(1.5, -2.3, 0.8), row.names = c("Gene1", "Gene2", "Gene3"))
gmt_path <- "path/to/hallmark.gmt"

## Run the function
results <- process_fgsea_analysis(markers_file, gmt_path, nperm = 1000, pval_threshold = 0.01, top = 10)

## Accessing results
results$fgsea_results
results$top_positive
results$top_negative
results$selected
}
\keyword{analysis}
\keyword{bioinformatics}
