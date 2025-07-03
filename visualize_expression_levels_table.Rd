\name{visualize_expression_levels_table}
\alias{visualize_expression_levels_table}
\title{Visualize Gene Expression Levels Across Conditions}
\description{
This function analyzes and visualizes the distribution of gene expression levels across specified conditions in a Seurat object. It performs statistical testing and adjusts p-values to identify significant differences between conditions.
}
\usage{
visualize_expression_levels_table(
  so, 
  condition_column = "condition", 
  sig_only = FALSE, 
  p_value_col = "FDR", 
  threshold = 0.05
)
}
\arguments{
  \item{so}{
A Seurat object containing metadata and expression data.
}
  \item{condition_column}{
The name of the column in the metadata specifying the experimental conditions (e.g., "condition").
}
  \item{sig_only}{
Logical; if TRUE, filters the output to include only rows with significant p-values (default is FALSE).
}
  \item{p_value_col}{
The column name containing p-values for filtering (default is "FDR").
}
  \item{threshold}{
The significance threshold for filtering results based on the specified p-value column (default is 0.05).
}
}
\details{
The function extracts columns with "_Expressed_high" in their names from the metadata, calculates the proportion of cells expressing high levels of each gene under different conditions, and performs statistical tests (e.g., chi-squared) to assess significance. Adjusted p-values are calculated using the Benjamini-Hochberg method.
}
\value{
A data frame with the following columns:
\item{gene}{The gene name.}
\item{condition}{The experimental condition.}
\item{comparison}{Comparison of conditions (e.g., "EXP vs. CTL").}
\item{expression_condition}{Combined expression level and condition.}
\item{Count}{Proportion of cells with high expression levels.}
\item{total_count}{Total count of cells per condition.}
\item{p_value}{Raw p-value from statistical testing.}
\item{adjusted_p_value}{Adjusted p-value (False Discovery Rate).}
\item{FDR}{False Discovery Rate (adjusted p-value).}
\item{significance}{Significance level ("***", "**", "*", or "ns").}
}
\seealso{
\code{\link[Seurat]{Seurat}}, \code{\link[stats]{chisq.test}}
}
\examples{
# Example usage:
visualize_expression_levels_table(
  so = seurat_object, 
  condition_column = "condition", 
  sig_only = TRUE, 
  p_value_col = "FDR", 
  threshold = 0.05
)
}
\author{
Ehsan
}
\keyword{data-visualization}
