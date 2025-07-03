\name{analyze_gene_expression_proportions_multi}
\alias{analyze_gene_expression_proportions_multi}
\title{Analyze Gene Expression Proportions Across Multiple Conditions}
\description{
  This function analyzes gene expression proportions across multiple conditions, performing statistical tests (Chi-squared or Fisher's exact test) to assess the differences in high gene expression between conditions. The results include p-values, adjusted p-values, and FDR for each gene, along with contingency tables.
}
\usage{
  analyze_gene_expression_proportions_multi(so, condition_columns = c("condition", "combined"), gene_filter = NULL)
}
\arguments{
  \item{so}{
    A Seurat object containing gene expression data in its metadata. The metadata should include columns that indicate the gene expression status, particularly for high-expression genes (e.g., `gene_Expressed_high`).
  }
  \item{condition_columns}{
    A character vector specifying the condition columns in the metadata to group the samples by. Default is `c("condition", "combined")`.
  }
  \item{gene_filter}{
    An optional character vector specifying a subset of genes to filter. If provided, only the genes matching the filter will be considered for analysis.
  }
}
\details{
  This function operates on a Seurat object and assesses gene expression levels across multiple conditions. For each specified gene, it generates contingency tables and applies statistical tests (Chi-squared or Fisher's test) to evaluate differences in expression proportions between conditions. It adjusts the p-values using the Benjamini-Hochberg method to control for false discovery rate (FDR).
}
\value{
  A data frame containing the following columns:
  \item{Gene}{The name of the gene being analyzed.}
  \item{Test}{The type of statistical test applied (Chi-squared or Fisher's test).}
  \item{X_squared}{The Chi-squared statistic (if applicable).}
  \item{P_value}{The raw p-value from the statistical test.}
  \item{Adj_P_value}{The adjusted p-value using the Benjamini-Hochberg method.}
  \item{FDR}{The False Discovery Rate (FDR), which is equal to the adjusted p-value.}
  \item{Num_Samples}{The total number of samples analyzed.}
  \item{Contingency_Table}{A string representation of the contingency table used for the test.}
}
\references{
  No specific references are needed at this time.
}
\author{
  Ehsan Razmara
}
\note{
  The function assumes that gene expression status is represented as columns with the suffix `_Expressed_high` in the metadata.
}
\seealso{
  \code{\link[Seurat]{Seurat}}, \code{\link{fisher.test}}, \code{\link{chisq.test}}
}
\examples{
  ## Example usage of the function
  ## analyze_gene_expression_proportions_multi(seurat_object, condition_columns = c("condition", "combined"), gene_filter = c("GeneA", "GeneB"))
}
