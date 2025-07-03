\name{get_top_n_genes}
\alias{get_top_n_genes}
\title{Get Top N Genes by Log Fold Change}
\description{
  This function extracts the top N genes with the highest absolute log fold change (logFC) for each group from the input dataset.
  Optionally, it filters the dataset to include only specific groups.
}
\usage{
get_top_n_genes(data, top_n, groups_oi = NULL)
}
\arguments{
  \item{data}{
    A data frame or tibble that contains gene expression data. It should have at least the columns `group` (for grouping) and `logFC` (for log fold change values).
  }
  \item{top_n}{
    An integer specifying the number of top genes to select per group based on the highest absolute log fold change.
  }
  \item{groups_oi}{
    A vector of group names to filter the data by. If \code{NULL}, all groups are included.
  }
}
\details{
  The function ranks genes by their absolute log fold change within each group and selects the top N genes with the highest logFC. The ranking method uses the `first` method to handle ties, meaning genes with the same logFC will be ranked in the order they appear in the data.
}
\value{
  A data frame or tibble containing the top N genes with the highest log fold change for each group. The returned data includes the `group` column and the `logFC` column, with the rank column removed.
}
\references{
  For more details on differential gene expression analysis, see \url{https://www.bioconductor.org/}.
}
\author{
  Ehsan Razmara
}
\note{
  This function assumes that the input data has already been processed for differential expression and contains a column for log fold change (`logFC`).
}

\seealso{
  \code{\link{dplyr}} for the package used to manipulate the data.
}
\examples{
  # Example usage:
  data <- data.frame(
    gene = c("Gene1", "Gene2", "Gene3", "Gene4", "Gene5"),
    group = c("A", "A", "B", "B", "A"),
    logFC = c(2.5, -3.1, 1.8, -2.7, 4.3)
  )
  
  top_genes <- get_top_n_genes(data, top_n = 3)
  print(top_genes)
}
