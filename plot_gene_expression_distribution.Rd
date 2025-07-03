\name{plot_gene_expression_distribution}
\alias{plot_gene_expression_distribution}
\title{plot_gene_expression_distribution}
\description{
This function generates density plots to visualize the distribution of gene expression levels in a given Seurat object. It calculates descriptive statistics for the gene expression data, including mean, median, quartiles, skewness, and kurtosis, and displays these along with the density plot. Optionally, it can log-transform the data and save the plots to the specified directory.
}
\usage{
plot_gene_expression_distribution(so, gene_list, assay = "SCT", threshold = NULL, log_transform = FALSE, output_dir = getwd(), save = TRUE)
}
\arguments{
  \item{so}{
     A Seurat object containing the gene expression data.
  }
  \item{gene_list}{
     A vector of gene names for which the distribution plot is to be generated.
  }
  \item{assay}{
     The name of the assay to be used for extracting gene expression data. Default is "SCT".
  }
  \item{threshold}{
     An optional numeric threshold for filtering the gene expression data. If NULL, the median expression is used as the threshold.
  }
  \item{log_transform}{
     A logical value indicating whether to log-transform the expression data. Default is FALSE.
  }
  \item{output_dir}{
     The directory where the plot will be saved. The default is the current working directory.
  }
  \item{save}{
     A logical value indicating whether to save the plot. Default is TRUE.
  }
}
\details{
This function extracts gene expression data for each gene in \code{gene_list} from the specified \code{assay} of the Seurat object. The function computes the mean, median, quartiles (Q1, Q3), skewness, and kurtosis of the positive expression values. These statistics are printed to the console and included in a side table in the final plot. The density plot displays the distribution of the positive gene expression values with dashed lines indicating the mean, median, and quartiles.
}
\value{
This function does not return any value. It generates a plot that is either displayed or saved to the specified directory.
}
\references{
  Seurat: https://satijalab.org/seurat/
}
\author{
  Ehsan Razmara
}
\note{
  Ensure that the specified genes are present in the selected assay of the Seurat object. The function will skip genes not found in the assay.
}

\seealso{
  \code{\link[Seurat]{GetAssayData}}, \code{\link[ggplot2]{ggplot}}, \code{\link[gridExtra]{grid.arrange}}
}
\examples{
## Example usage:
# Create a Seurat object (so)
# plot_gene_expression_distribution(so, gene_list = c("GeneA", "GeneB"), assay = "SCT", log_transform = TRUE, save = TRUE, output_dir = "path/to/save/plots")
}
