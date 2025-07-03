\name{HiLoFindMarkers}
\alias{HiLoFindMarkers}
\title{HiLoFindMarkers}
\description{
  This function performs differential gene expression analysis between high and low gene expression states or specified groups within a Seurat object. It subsets the Seurat object based on gene expression levels and selected groups, then uses the FindMarkers function to identify differentially expressed genes.
}
\usage{
HiLoFindMarkers(seurat_obj, gene, group_selected, group_item, HiLo = NULL, test.use = "wilcox")
}
\arguments{
  \item{seurat_obj}{
    A Seurat object containing the gene expression data.
  }
  \item{gene}{
    The name of the gene of interest for the analysis.
  }
  \item{group_selected}{
    The column in the metadata to use for grouping the cells (e.g., experimental condition).
  }
  \item{group_item}{
    The specific value within the selected group (e.g., a particular condition or time point).
  }
  \item{HiLo}{
    An optional parameter that can be set to "High" or "Low" to subset cells based on high or low expression levels of the selected gene. Default is NULL.
  }
  \item{test.use}{
    The statistical test to use for differential expression. Default is "wilcox" for the Wilcoxon rank-sum test.
  }
}
\details{
  The function subsets the Seurat object based on the selected gene's expression (high or low) or by a specified group. After subsetting, it performs differential expression analysis using the FindMarkers function to identify markers between the specified groups or expression states. The results are ordered by log2 fold change (avg_log2FC).
}
\value{
  A data frame of differentially expressed genes with associated statistics, such as log2 fold change and p-values.
}
\references{
  Seurat: Stuart, T., et al. (2015). "Comprehensive Integration of Single-Cell Data." Cell.
}
\author{
  Ehsan Razmara
}
\note{
  If the HiLo parameter is used, it will override the group_item and subsetting will occur based on gene expression levels.
}
\seealso{
  \code{\link{Seurat}}, \code{\link{FindMarkers}}
}
\examples{
  ## Example of usage:
  # Assuming 'seurat_obj' is a Seurat object with the necessary metadata.
  HiLoFindMarkers(seurat_obj, "Gli1", "group", "CTL", HiLo = "High", test.use = "wilcox")
}
\keyword{differential expression}
\keyword{Seurat}
\concept{differential gene expression}
