" man "\name{analyze_gene_expression_proportions}
\alias{analyze_gene_expression_proportions}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{analyze_gene_expression_proportions}
\description{
  Analyzes the proportions of high-expressed gene states across different experimental conditions using Fisher's or Chi-squared tests. It generates a contingency table for each gene, performs the specified statistical tests, and summarizes the results, including p-values, adjusted p-values, and false discovery rates (FDR).
}
\usage{
  analyze_gene_expression_proportions(so, condition_column = "condition", test_method = "both", verbose = FALSE)
}
\arguments{
  \item{so}{
    A Seurat object that contains single-cell RNA-seq data and metadata, including columns related to gene expression, such as those ending with "_Expressed_high". The metadata should also include the specified `condition_column` for grouping the data based on experimental conditions.
  }
  \item{condition_column}{
    A string specifying the column name in the Seurat object's metadata that defines the experimental conditions for grouping the data (e.g., `"condition"`). This argument is set to `"condition"` by default.
  }
  \item{test_method}{
    A string that specifies the statistical test to be performed. It can be one of "both", "Fisher", or "Chi-squared". The default is "both", where the function checks if Fisher's test or Chi-squared test is appropriate based on the contingency table.
  }
  \item{verbose}{
    A logical value indicating whether to print additional information during execution. The default is FALSE.
  }
}

\details{
  This function evaluates gene expression proportions by comparing the presence or absence of high gene expression states across experimental conditions. A contingency table is created for each gene, and the function uses either Fisher's exact test or Chi-squared test to determine if there are significant differences between conditions. The function also adjusts the p-values using the Benjamini-Hochberg method to control the false discovery rate (FDR).
}

\value{
  A data frame with the following columns:
  \item{Gene}{The gene being analyzed.}
  \item{Test}{The statistical test used (Fisher or Chi-squared).}
  \item{Test Statistic}{The test statistic, if applicable.}
  \item{P_value}{The p-value from the statistical test.}
  \item{Adjusted P-value}{The adjusted p-value using the Benjamini-Hochberg method.}
  \item{False Discovery Rate}{The False Discovery Rate corresponding to the adjusted p-value.}
  \item{Num_Samples}{The total number of samples used for the test.}
  \item{Contingency Table}{A compact string representation of the contingency table.}
}

\references{
  Benjamini, Y., & Hochberg, Y. (1995). Controlling the false discovery rate: A practical and powerful approach to multiple testing. Journal of the Royal Statistical Society: Series B (Methodological), 57(1), 289-300.
}

\author{Ehsan Razmara}
\note{
  This function is designed to analyze proportions of high-expressed gene states in single-cell RNA-seq data, with the flexibility to apply different statistical tests based on the data distribution.
}

\seealso{
  \code{\link{Seurat}}, \code{\link{fisher.test}}, \code{\link{chisq.test}}
}

\examples{
  # Example usage of the function
  results <- HiLoMap::analyze_gene_expression_proportions(so)
  print(results)
}
