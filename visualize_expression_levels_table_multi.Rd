\name{visualize_expression_levels_table_multi}
\alias{visualize_expression_levels_table_multi}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{visualize_expression_levels_table_multi}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
visualize_expression_levels_table_multi(so, condition_column = "condition", sig.only = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{so}{
%%     ~~Describe \code{so} here~~
}
  \item{condition_column}{
%%     ~~Describe \code{condition_column} here~~
}
  \item{sig.only}{
%%     ~~Describe \code{sig.only} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (so, condition_column = "condition", sig.only = TRUE) 
{
    if (!condition_column \%in\% colnames(so@meta.data)) {
        stop("The specified condition column does not exist in the metadata.")
    }
    expression_cols <- grep("_Expressed_high", colnames(so@meta.data), 
        value = TRUE)
    combined_data <- list()
    for (gene_col in expression_cols) {
        gene_name <- sub("_Expressed_high", "", gene_col)
        combined_col <- paste0("combined_", gene_name)
        so@meta.data[[combined_col]] <- paste(so@meta.data[[gene_col]], 
            so@meta.data[[condition_column]], sep = "_")
        combined_data[[gene_name]] <- data.frame(expression_condition = so@meta.data[[combined_col]], 
            condition = so@meta.data[[condition_column]], gene = gene_name)
    }
    DF <- do.call(rbind, combined_data)
    DY2 <- DF \%>\% group_by(gene, condition, expression_condition) \%>\% 
        summarise(N = n(), .groups = "drop") \%>\% mutate(C = sum(N)) \%>\% 
        mutate(Count = N/C)
    p_values <- list()
    for (gene_col in expression_cols) {
        gene_name <- sub("_Expressed_high", "", gene_col)
        contingency_table <- table(so@meta.data[[gene_col]], 
            so@meta.data[[condition_column]])
        test_result <- chisq.test(contingency_table)
        p_values[[gene_name]] <- test_result$p.value
    }
    adjusted_p_values <- p.adjust(unlist(p_values), method = "BH")
    DY2$p_value <- sapply(DY2$gene, function(gene_name) {
        p_val <- p_values[[gene_name]]
        return(round(p_val, digits = 3))
    })
    DY2$adjusted_p_value <- sapply(DY2$gene, function(gene_name) {
        adj_p_val <- adjusted_p_values[gene_name]
        return(round(adj_p_val, digits = 3))
    })
    DY2$FDR <- ifelse(DY2$adjusted_p_value < 0.05, "Significant", 
        "Non-significant")
    unique_conditions <- unique(so@meta.data[[condition_column]])
    if (length(unique_conditions) != 2) {
        stop("The condition column must have exactly two unique values for proper comparison.")
    }
    condition_comparison <- paste(unique_conditions[1], "vs", 
        unique_conditions[2])
    DY2$comparison <- condition_comparison
    if (sig.only) {
        DY2 <- DY2 \%>\% filter(FDR == "Significant")
    }
    return(DY2)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
