\name{HiLostatplot}
\alias{HiLostatplot}
\title{HiLostatplot}
\description{
HiLostatplot visualizes the distribution of cells across various clusters or groups, comparing cell proportions and creating different types of plots such as bar, circos, pie, trend, and heatmap. This function helps in evaluating how cell proportions change across different conditions or identities, providing insights into underlying cellular dynamics.
}
\usage{
HiLostatplot(object, ident = "seurat_clusters", group_by = NULL, group_by_sep = "_", split_by = NULL, split_by_sep = "_", facet_by = NULL, rows = NULL, columns_split_by = NULL, frac = c("none", "group", "ident", "cluster", "all"), rows_name = NULL, name = NULL, plot_type = c("bar", "circos", "pie", "pies", "ring", "donut", "trend", "area", "sankey", "alluvial", "heatmap", "radar", "spider", "violin", "box"), swap = FALSE, ylab = NULL, ...)
}
\arguments{
  \item{object}{
    A Seurat object containing the data to be plotted, including the metadata with information on cell identities and other relevant attributes.
  }
  \item{ident}{
    The identity class to be used for categorizing the cells (e.g., "seurat_clusters").
  }
  \item{group_by}{
    A character vector specifying columns in the metadata to group the cells by. This could be experimental conditions or other factors.
  }
  \item{group_by_sep}{
    Separator used when concatenating multiple values for the `group_by` variable. Defaults to "_".
  }
  \item{split_by}{
    A column or factor by which to split the data, such as splitting by conditions or another categorical variable.
  }
  \item{split_by_sep}{
    Separator for values within the `split_by` column when splitting.
  }
  \item{facet_by}{
    A variable in the metadata to facet the plots by. For instance, this could be a timepoint or treatment condition.
  }
  \item{rows}{
    Defines the rows in the plot. Usually, this is used to segment the data in the final visualization.
  }
  \item{columns_split_by}{
    Defines how to split the columns in the plot, often based on categories within the data.
  }
  \item{frac}{
    The fraction of cells to calculate and plot. Options include "none", "group", "ident", "cluster", or "all".
  }
  \item{rows_name}{
    Custom name for the rows in the plot, if applicable.
  }
  \item{name}{
    The name of the plot, used for title or further annotation.
  }
  \item{plot_type}{
    The type of plot to generate. Available options include bar, circos, pie, trend, area, sankey, alluvial, heatmap, radar, spider, violin, and box plots.
  }
  \item{swap}{
    A logical indicating whether to swap the identity and group by variables in the plot.
  }
  \item{ylab}{
    Custom y-axis label for the plot.
  }
  \item{\dots}{
    Additional arguments passed to the plot functions for further customization.
  }
}
\details{
The function generates various plot types to visualize the distribution and fractions of cell types across different groups, clusters, or identities. It can be customized to display proportions, counts, and different breakdowns of the data by applying faceting, splitting, or grouping based on metadata columns.
}
\value{
  A plot object, typically of class ggplot or a specialized plot object, depending on the chosen plot type.
}
\references{
  \url{https://cran.r-project.org/web/packages/Seurat/Seurat.pdf} for general usage of Seurat and its metadata handling.
}
\author{
  Ehsan Razmara
}
\note{
  The `HiLostatplot` function requires the metadata of the Seurat object to be correctly formatted and contain the necessary columns for grouping, splitting, and faceting.
}
\seealso{
  \code{\link{Seurat}}, \code{\link{BarPlot}}, \code{\link{CircosPlot}}, \code{\link{PieChart}}, \code{\link{RingPlot}}, \code{\link{TrendPlot}}, \code{\link{AreaPlot}}, \code{\link{SankeyPlot}}
}
\examples{
# Example usage of HiLostatplot:
HiLostatplot(seurat_object, ident = "seurat_clusters", plot_type = "bar", group_by = "treatment", frac = "group")
}
