\name{PlotVennGeneOverlap}
\alias{PlotVennGeneOverlap}
\title{PlotVennGeneOverlap}
\description{
  Plots a Venn diagram to visualize the overlap of gene expression between different genes, categorized by expression state (High or Low).
}
\usage{
PlotVennGeneOverlap(srt, genes, expression_state = "High")
}
\arguments{
  \item{srt}{
    A Seurat object containing the single-cell RNA-seq data. The object must have metadata columns indicating whether a gene is expressed in "high" or "low" states.
  }
  \item{genes}{
    A character vector of gene names for which the overlap of expression states is to be visualized. At least two genes must be provided.
  }
  \item{expression_state}{
    A string indicating the expression state to be used for the analysis. Options are "High" or "Low". Default is "High".
  }
}
\details{
  This function retrieves the metadata for each specified gene and identifies the cells with "High" or "Low" expression states. It then creates a Venn diagram to visualize the overlap of cells that express the specified genes in the selected expression state.
}
\value{
  Returns a ggplot object representing the Venn diagram, which can be further customized or displayed.
}
\references{
  Venn diagrams are commonly used to represent set overlaps, and this function uses the \code{ggVennDiagram} package to visualize these overlaps for gene expression data.
}
\author{
  Ehsan RAZMARA
}
\note{
  Ensure that the Seurat object contains the relevant metadata columns for gene expression states before using this function.
}

\seealso{
  \code{\link{Seurat}}, \code{\link{ggVennDiagram}}
}
\examples{
  ## Example usage with Seurat object (srt) and gene names
  genes <- c("Gene1", "Gene2", "Gene3")
  PlotVennGeneOverlap(srt, genes, expression_state = "High")
}
