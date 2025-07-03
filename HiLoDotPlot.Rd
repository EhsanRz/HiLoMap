\name{HiLoDotPlot}
\alias{HiLoDotPlot}
\title{HiLoDotPlot}
\description{
  A function to create a dot plot visualization of gene expression data from a Seurat object.
  It allows customization of features, color scaling, and the selection of top markers based on differential expression.
}
\usage{
HiLoDotPlot(object, features, rotation = TRUE, colormap = "OrRd", color.direction = 1, 
            color.use = c("#F8766D","#00BFC4"), scale = TRUE, col.min = -2.5, 
            col.max = 2.5, dot.scale = 6, assay = "RNA", idents = NULL, 
            group.by = NULL, split.by = NULL, legend.width = 0.5, angle.x = 45, 
            hjust.x = 1, angle.y = 0, hjust.y = 0.5, show.legend = TRUE, top_n = 30, 
            markers = NULL, gene = NULL, only_positive = FALSE, ...)
}
\arguments{
  \item{object}{
    A Seurat object containing the data to be visualized. This object should include gene expression data, typically in the specified assay.
  }
  \item{features}{
    A character vector specifying the features (genes) to plot. If markers are provided, this will be updated to the selected top markers.
  }
  \item{rotation}{
    A logical value indicating whether to rotate the plot. Default is TRUE.
  }
  \item{colormap}{
    A character string specifying the color palette to use. Default is "OrRd". Other valid palettes can be used, such as "Blues", "RdYlBu", etc.
  }
  \item{color.direction}{
    A numeric value specifying the direction of the color scale. Default is 1 (ascending color scale). A negative value would reverse the color direction.
  }
  \item{color.use}{
    A character vector of two colors to use for the dot color. Default is c("#F8766D","#00BFC4"), which are red and cyan.
  }
  \item{scale}{
    A logical value indicating whether to scale the data before plotting. Default is TRUE.
  }
  \item{col.min}{
    A numeric value specifying the minimum value for the color scale. Default is -2.5.
  }
  \item{col.max}{
    A numeric value specifying the maximum value for the color scale. Default is 2.5.
  }
  \item{dot.scale}{
    A numeric value specifying the size of the dots in the plot. Default is 6.
  }
  \item{assay}{
    A character string specifying the assay to use from the Seurat object. Default is "RNA".
  }
  \item{idents}{
    A character vector specifying the identities (e.g., cell types) to group by. Default is NULL, meaning all identities will be considered.
  }
  \item{group.by}{
    A character string specifying a metadata column to group the data by. Default is NULL.
  }
  \item{split.by}{
    A character string specifying a metadata column by which to split the data into multiple subplots. Default is NULL.
  }
  \item{legend.width}{
    A numeric value specifying the width of the legend. Default is 0.5.
  }
  \item{angle.x}{
    A numeric value specifying the angle of the x-axis labels. Default is 45.
  }
  \item{hjust.x}{
    A numeric value specifying the horizontal adjustment for the x-axis labels. Default is 1.
  }
  \item{angle.y}{
    A numeric value specifying the angle of the y-axis labels. Default is 0.
  }
  \item{hjust.y}{
    A numeric value specifying the horizontal adjustment for the y-axis labels. Default is 0.5.
  }
  \item{show.legend}{
    A logical value indicating whether to show the legend. Default is TRUE.
  }
  \item{top_n}{
    A numeric value specifying the number of top markers to display. Default is 30.
  }
  \item{markers}{
    A data frame containing marker genes, including the "avg_log2FC" column. Used to select the top markers for visualization. Default is NULL.
  }
  \item{gene}{
    A character string specifying a gene of interest for dynamic grouping. If provided, the function will group cells based on whether they express high levels of the specified gene. Default is NULL.
  }
  \item{only_positive}{
    A logical value indicating whether to include only the positive markers with positive "avg_log2FC". Default is FALSE.
  }
  \item{...}{
    Additional arguments passed to `Seurat::DotPlot` for further customization.
  }
}
\details{
  The `HiLoDotPlot` function generates a dot plot that visualizes gene expression data across different cell groups, with customization options for scaling, colors, and grouping. It supports dynamic grouping based on a gene of interest and allows the selection of the top markers by differential expression.
}
\value{
  A ggplot object representing the dot plot.
}
\references{
  Seurat: https://satijalab.org/seurat/
}
\author{Ehsan Razmara}
\note{
  The function allows for extensive customization of dot plot appearance and is especially useful for visualizing expression levels of genes across different cell types or conditions.
}
\seealso{
  \code{\link{Seurat::DotPlot}}, \code{\link{Seurat}}
}
\examples{
HiLoDotPlot(object = so,
            markers = markers, 
            top_n = 20,  # Select top 20 genes based on avg_log2FC
            rotation = F, 
            color.use = c("#F8766D", "#00BFC4"), 
            colormap = "OrRd", 
            color.direction = 1, 
            scale = TRUE, 
            col.min = -2.5, 
            col.max = 2.5, 
            dot.scale = 6, 
            assay = "RNA", 
            legend.width = 0.5, 
            angle.x = 45, 
            hjust.x = 1,
            angle.y = 0, 
            hjust.y = 0.5,
            gene = "Gli1")
}
