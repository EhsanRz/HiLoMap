\name{define_expression_levels}
\alias{define_expression_levels}
\title{define_expression_levels}
\description{
This function classifies cells based on their expression levels of one or more genes. It allows for both manual and automatic threshold selection (mean or median) for high and low expression classification, with the option to log-transform the expression data. Statistical tests (Wilcoxon test) are applied to compare high and low expression groups, and the function adjusts p-values using the Benjamini-Hochberg method for multiple testing correction.
}
\usage{
define_expression_levels(so, gene = NULL, gene_list = NULL, assay = "SCT", threshold = NULL, log_transform = FALSE)
}
\arguments{
  \item{so}{
    A Seurat object containing the single-cell RNA-seq data. This object should include the expression data for the genes of interest in a specified assay.
  }
  \item{gene}{
    A single gene name (character string) to analyze. If provided, `gene_list` should be `NULL`.
  }
  \item{gene_list}{
    A character vector of gene names to analyze. If provided, `gene` should be `NULL`.
  }
  \item{assay}{
    The name of the assay in the Seurat object from which expression data should be extracted. Default is "SCT".
  }
  \item{threshold}{
    A numeric value to manually define a threshold for high expression. If provided, it overrides the automatic mean/median classification.
  }
  \item{log_transform}{
    A logical value indicating whether to log-transform the expression data before classification. Default is `FALSE`.
  }
}
\details{
The function classifies cells into "high" or "low" expression groups based on either a manual threshold or the mean/median expression levels of a given gene. The function can handle single genes or a list of genes and works with various assays available in the Seurat object. If no positive expression values exist for a gene, the function will skip that gene. Statistical testing is performed using the Wilcoxon test to compare expression levels between high and low groups, with p-values adjusted using the Benjamini-Hochberg method for multiple comparisons.
}
\value{
The function returns the Seurat object with new columns added to the `meta.data` slot. These columns indicate whether each cell is classified as high or low expression for each gene, based on the selected threshold (mean, median, or manual).
}
\references{
For more information on Seurat, please see: 
Satija, R., Farrell, J., & Ramesh, V. et al. (2015). "Seurat: A Tool for Single-Cell RNA-Seq Analysis". \emph{Nature Biotechnology}.
}
\author{
Ehsan, PhD candidate at Monash University. \cr
The function was developed by Ehsan and is designed for Seurat-based single-cell RNA-seq analysis.
}
\note{
This function assumes that the Seurat object already contains expression data in the specified assay. It is recommended to check that the Seurat object contains the required assays and that the gene names are correctly specified.
}

\seealso{
\code{\link{Seurat}}, \code{\link{GetAssayData}}, \code{\link{wilcox.test}}, \code{\link{p.adjust}}
}
\examples{
# Example usage for a single gene
so <- define_expression_levels(so, gene = "Gli1", assay = "SCT", log_transform = TRUE)

# Example usage for a list of genes
so <- define_expression_levels(so, gene_list = c("Gli1", "Ccn2"), assay = "SCT", threshold = 1)

# Example usage with no threshold, automatically selecting mean or median
so <- define_expression_levels(so, gene = "Gli1", assay = "SCT", log_transform = TRUE)
}
