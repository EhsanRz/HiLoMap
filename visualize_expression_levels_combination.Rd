\name{visualize_expression_levels_combination}
\alias{visualize_expression_levels_combination}
\title{Visualize Expression Levels Across Combinations of Genes and Conditions}
\description{
This function generates a bar plot to visualize the proportion of cell groups across specified combinations of gene expression levels and conditions. It calculates and displays the proportions of cells for each combination and optionally saves the plot to a file.
}
\usage{
visualize_expression_levels_combination(so, condition_column = "condition", 
    selected_genes = NULL, group_by = NULL, font_size = 12, 
    show_labels = TRUE, save_as = NULL, width = 10, height = 8, angle = 45)
}
\arguments{
  \item{so}{
A Seurat object containing the metadata and expression data for visualization. 
The metadata should include columns representing the expression status of selected genes.
}
  \item{condition_column}{
The name of the column in the metadata specifying experimental conditions.
}
  \item{selected_genes}{
A character vector of gene names to include in the visualization. Each gene must have an associated \code{_Expressed_high} column in the metadata.
}
  \item{group_by}{
The metadata column used to group cells for visualization. Typically represents cell types or other categories of interest.
}
  \item{font_size}{
Font size for axis titles, labels, and legend text in the plot. Default is 12.
}
  \item{show_labels}{
Logical. If \code{TRUE}, displays the proportion values as labels on the bars. Default is \code{TRUE}.
}
  \item{save_as}{
Optional. A string specifying the format to save the plot. Options are \code{"PDF"} or \code{"PNG"}. If \code{NULL}, the plot is displayed instead of saved. Default is \code{NULL}.
}
  \item{width}{
Width of the saved plot in inches (if \code{save_as} is specified). Default is 10.
}
  \item{height}{
Height of the saved plot in inches (if \code{save_as} is specified). Default is 8.
}
  \item{angle}{
Angle for rotating x-axis labels. Default is 45 degrees.
}
}
\details{
This function combines gene expression levels and experimental conditions into unique combinations for each cell. It calculates the proportions of cells in each group and generates a bar plot showing these proportions. 
The function is particularly useful for visualizing cell type distributions under different gene expression states and conditions.
}
\value{
The modified Seurat object with a new \code{combined} column added to the metadata, representing the concatenated gene expression levels and condition.
}
\references{
Refer to the Seurat documentation for details on managing metadata and expression data:
\url{https://satijalab.org/seurat/}
}
\author{
Ehsan [Your Last Name Here], PhD Candidate, Monash University
}
\examples{
# Example usage:
# Assuming 'so' is a Seurat object with metadata and expression data.
visualize_expression_levels_combination(
  so = so,
  condition_column = "condition",
  selected_genes = c("GeneA", "GeneB"),
  group_by = "cell_type",
  font_size = 14,
  show_labels = TRUE,
  save_as = "PDF",
  width = 12,
  height = 10,
  angle = 30
)
}
\seealso{
\code{\link{Seurat}}, \code{\link{ggplot2}}, \code{\link{dplyr}}
}
\note{
Ensure the Seurat object metadata includes columns named \code{<gene>_Expressed_high} for each selected gene.
}
