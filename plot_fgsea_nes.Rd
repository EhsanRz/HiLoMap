\name{plot_fgsea_nes}
\alias{plot_fgsea_nes}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{plot_fgsea_nes}
\description{
  This function visualizes the normalized enrichment scores (NES) of hallmark pathways 
  from Gene Set Enrichment Analysis (GSEA). It creates a horizontal bar plot, 
  where pathways are ordered by NES, with colors indicating whether they are 
  upregulated or downregulated based on their NES values.
}
\usage{
  plot_fgsea_nes(top_scores, upregulated_color = "#D32F2F", downregulated_color = "#1976D2")
}
\arguments{
  \item{top_scores}{
    A data frame containing GSEA results with at least two columns: 
    \code{pathway} (the names of pathways as strings) and \code{NES} 
    (Normalized Enrichment Scores as numeric values). The \code{pathway} 
    column will be displayed on the y-axis, and the \code{NES} values will 
    determine the bar lengths and direction.
  }
  \item{upregulated_color}{
    A character string specifying the color used to fill bars representing 
    upregulated pathways (positive NES values). The default is \code{"#D32F2F"} 
    (a shade of red).
  }
  \item{downregulated_color}{
    A character string specifying the color used to fill bars representing 
    downregulated pathways (negative NES values). The default is \code{"#1976D2"} 
    (a shade of blue).
  }
}

\details{
  This function generates a bar plot where pathways are ordered by their NES values, 
  with colors indicating upregulated or downregulated pathways. The plot uses custom 
  colors for upregulated and downregulated pathways, and the coordinates are flipped 
  to provide a horizontal visualization. It is useful for summarizing and comparing 
  pathway enrichment results from GSEA.
}
\value{
  This function returns a ggplot2 object representing the bar plot of pathway NES scores.
}
\references{
  The method for calculating NES is outlined in the GSEA documentation available at 
  \url{https://www.gsea-msigdb.org/gsea/index.jsp}.
}
\author{Ehsan Razmara}
}
\note{
  The \code{top_scores} data frame should contain the pathways and their corresponding NES values 
  that are typically obtained from GSEA analysis.
}

\seealso{
  \code{\link{process_fgsea_analysis}}, \code{\link{ggplot2}}
}
\examples{
  markers_file <- markers  # assuming you have the 'markers' data frame
  gmt_path <- '~/rna-seq/msigdb_v2023.2.Mm_files_to_download_locally/msigdb_v2023.2.Mm_GMTs/m5.all.v2023.2.Mm.symbols.gmt'
  result <- process_fgsea_analysis(markers_file, gmt_path)
  top_negative <- result$top_negative
  top_positive <- result$top_positive
  top_scores <- bind_rows(top_negative, top_positive)
  plot_fgsea_nes(top_scores)
}
