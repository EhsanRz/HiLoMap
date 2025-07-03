\name{HiLo_pseudoBulk_plot}
\alias{HiLo_pseudoBulk_plot}
\title{HiLo_pseudoBulk_plot}
\description{
  This function generates visualizations of gene expression values across clusters using a pseudo-bulk approach. It displays the expression of specified genes within different cell types and conditions, optionally scaling the expression values and applying log transformation for better visualization. 
}
\usage{
HiLo_pseudoBulk_plot(seurat_obj, features, legend = TRUE, log_Expression = TRUE, scale = TRUE)
}
\arguments{
  \item{seurat_obj}{
    A Seurat object containing the single-cell RNA-seq data, including the expression values for the genes of interest, cell types, and conditions.
  }
  \item{features}{
    A character vector of genes to be visualized in the pseudo-bulk plots.
  }
  \item{legend}{
    Logical value indicating whether the legend should be included in the plots. Default is TRUE.
  }
  \item{log_Expression}{
    Logical value indicating whether to log-transform the expression values for visualization. Default is TRUE.
  }
  \item{scale}{
    Logical value indicating whether to scale the expression values across cells. Default is TRUE.
  }
}
\details{
  The function uses the top 50 genes to generate visualizations, splits the data by clusters, and calculates the fraction of expression across different conditions. The resulting plots display gene expression in a facet grid, with options to adjust scaling and log transformation.
}
\value{
  A combined plot that includes:
  \item{p1}{A plot showing the expression of genes with raw expression values.}
  \item{p2}{A plot showing the expression of genes with log-transformed expression values.}
  Optionally, the function can combine both plots along with their legends into a single view.
}
\references{
  Include references to relevant papers or resources that explain the methodology used in the function.
}
\author{
  Ehsan [Your Name] \email{your_email@example.com}
}
\note{
  This function is designed for visualizing gene expression patterns across different cell types and conditions in single-cell transcriptomics data.
}

\seealso{
  \code{\link{Seurat}}, \code{\link{ggplot2}}, \code{\link{viridis}}
}
\examples{
  # Example usage of HiLo_pseudoBulk_plot function
  HiLo_pseudoBulk_plot(seurat_obj = my_seurat_obj, features = top_50_genes, legend = TRUE, log_Expression = TRUE, scale = TRUE)
}
