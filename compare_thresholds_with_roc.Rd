\name{compare_thresholds_with_roc}
\alias{compare_thresholds_with_roc}
\title{compare_thresholds_with_roc}
\description{
  This function compares gene expression thresholds using mean and median values, generating ROC curves to evaluate their ability to classify cells into high and low expression categories. It also calculates the area under the curve (AUC) for both thresholds and selects the threshold with the best AUC.
}
\usage{
compare_thresholds_with_roc(so, gene, assay = "SCT", log_transform = FALSE)
}
\arguments{
  \item{so}{
    A Seurat object containing single-cell or single-nucleus gene expression data.
  }
  \item{gene}{
    A character string specifying the gene name for which the threshold comparison will be done.
  }
  \item{assay}{
    A character string specifying the assay to use for extracting gene expression data. Defaults to "SCT".
  }
  \item{log_transform}{
    A logical value indicating whether the gene expression data should be log-transformed using \code{log1p}. Defaults to \code{FALSE}.
  }
}
\details{
  The function generates two ROC curves: one based on the mean expression threshold and the other based on the median expression threshold. The Area Under the Curve (AUC) is calculated for both and the threshold with the higher AUC is selected. The final classification is made using the selected threshold, and a column is created in the Seurat object's metadata to store this classification.
}
\value{
  A list with the following components:
  \item{mean_threshold}{The mean expression threshold for the gene.}
  \item{median_threshold}{The median expression threshold for the gene.}
  \item{selected_threshold}{The threshold (mean or median) with the best AUC.}
  \item{final_classification}{A vector of final classifications based on the selected threshold (high or low expression).}
  \item{auc_mean}{The AUC for the mean threshold ROC curve.}
  \item{auc_median}{The AUC for the median threshold ROC curve.}
}
\references{
  \url{https://www.rdocumentation.org/packages/pROC/versions/latest/topics/roc}
}
\author{
  Ehsan (Ehsan's Research, Monash University)
}
\note{
  Ensure that the gene specified is present in the Seurat object. If the gene is absent or the data is missing, the function will stop and return an error.
}
\seealso{
  \code{\link{Seurat}}, \code{\link{pROC}}, \code{\link{GetAssayData}}
}
\examples{
  ## Example usage
  # Assuming 'so' is a Seurat object and 'gene' is the gene name of interest
  result <- compare_thresholds_with_roc(so, "GeneA")
  print(result)
}
\keyword{ROC}
\keyword{classification}
\keyword{gene expression}
