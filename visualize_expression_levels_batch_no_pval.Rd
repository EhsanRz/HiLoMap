\name{visualize_expression_levels_batch_pval}
\alias{visualize_expression_levels_batch_pval}
\title{Batch Visualization of Gene Expression Levels with Proportions and P-Values}
\description{
This function generates and saves bar plots visualizing the proportions of high and low gene expression levels across specified conditions. It includes optional p-value annotations based on chi-squared tests.
}
\usage{
visualize_expression_levels_batch_pval(so, gene_list, condition_column = "condition", 
                                       output_dir = "gene_plots", 
                                       show_pval_asterisks = TRUE)
}
\arguments{
  \item{so}{
A Seurat object containing the metadata and expression data. The metadata must include columns for the specified conditions and gene expression classifications.
}
  \item{gene_list}{
A character vector of gene names for which to generate the plots. Each gene's high-expression classification should exist in the metadata.
}
  \item{condition_column}{
A character string specifying the metadata column representing experimental conditions (default: "condition").
}
  \item{output_dir}{
A character string specifying the directory where the generated plots will be saved (default: "gene_plots").
}
  \item{show_pval_asterisks}{
A logical value indicating whether to annotate plots with p-value significance stars from chi-squared tests (default: TRUE).
}
}
\details{
The function checks for the presence of required metadata columns and creates an output directory if it doesn't already exist. For each gene in the provided list, it calculates the proportions of cells expressing the gene at high and low levels for each condition and performs a chi-squared test to evaluate differences. The resulting bar plots are saved as PDFs.
}
\value{
The function saves a series of PDF files, one for each gene, in the specified directory. Each plot shows:
\itemize{
  \item Proportions of cells in high and low expression states across conditions.
  \item Optional p-value significance annotations based on the chi-squared test.
}
}
\references{
No specific references provided. For more on Seurat and ggplot2 usage, see their respective documentation.
}
\author{
Ehsan Razmara
}
\note{
Ensure that the Seurat object metadata contains columns for all specified genes and conditions.
}
\seealso{
\code{\link{ggplot2}}, \code{\link{chisq.test}}, \code{\link{Seurat}}
}
\examples{
# Example usage
# Assume `so` is a Seurat object with the necessary metadata
genes <- c("GeneA", "GeneB", "GeneC")
visualize_expression_levels_batch_pval(so = so, 
                                       gene_list = genes, 
                                       condition_column = "condition", 
                                       output_dir = "gene_plots", 
                                       show_pval_asterisks = TRUE)
}
\keyword{visualization}
\keyword{Seurat}
\keyword{gene-expression}
