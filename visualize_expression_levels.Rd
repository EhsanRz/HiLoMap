\name{visualize_expression_levels}
\alias{visualize_expression_levels}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Visualize Gene Expression Levels by Condition and Split Groups}
\description{
This function generates a faceted bar plot visualizing the proportion of cells expressing a gene at high or low levels across different conditions. Optionally, the data can be further split by a specified metadata column.
}
\usage{
visualize_expression_levels(so, condition_column = "condition", split_by = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{so}{
A \code{Seurat} object containing the metadata and expression data to be visualized. Metadata must include the specified condition column and gene expression labels.
}
  \item{condition_column}{
A character string specifying the column name in the \code{Seurat} object's metadata that represents experimental conditions.
}
  \item{split_by}{
A character string specifying an optional metadata column to further split the visualizations. If \code{FALSE}, no splitting is performed.
}
}
\details{
The function computes the proportions of cells expressing genes at high or low levels for each condition and, optionally, for each level of the specified \code{split_by} column. The data is visualized as a faceted bar plot, where each facet corresponds to a gene and optionally to a split group.
}
\value{
A faceted bar plot displaying the proportions of high and low gene expression for each condition and optional split group. The plot is displayed using \code{cowplot}.
}
\references{
None.
}
\author{
Ehsan Razmara
}
\note{
Ensure the \code{Seurat} object's metadata contains valid columns for \code{condition_column} and \code{split_by} if specified.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Seurat}}, \code{\link{ggplot2}}, \code{\link{cowplot}}
}
\examples{
## Not run:
# Example usage with a Seurat object `so`:
visualize_expression_levels(so, condition_column = "condition", split_by = "split_group")
visualize_expression_levels(so, condition_column = "condition")
## End(Not run)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ visualization }
% \keyword{ expression }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ Seurat }
% \concept{ data analysis }
% Use only one concept per line.
