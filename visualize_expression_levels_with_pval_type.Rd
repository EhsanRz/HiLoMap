\name{visualize_expression_levels_with_pval_type}
\alias{visualize_expression_levels_with_pval_type}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{visualize_expression_levels_with_pval_type}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
visualize_expression_levels_with_pval_type(so, condition_column = "condition", show_pval_asterisks = FALSE, p_value_type = c("raw", "FDR"), save = FALSE, output_dir = getwd(), height = 6, width = 10, group_by = NULL, genes = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{so}{
%%     ~~Describe \code{so} here~~
}
  \item{condition_column}{
%%     ~~Describe \code{condition_column} here~~
}
  \item{show_pval_asterisks}{
%%     ~~Describe \code{show_pval_asterisks} here~~
}
  \item{p_value_type}{
%%     ~~Describe \code{p_value_type} here~~
}
  \item{save}{
%%     ~~Describe \code{save} here~~
}
  \item{output_dir}{
%%     ~~Describe \code{output_dir} here~~
}
  \item{height}{
%%     ~~Describe \code{height} here~~
}
  \item{width}{
%%     ~~Describe \code{width} here~~
}
  \item{group_by}{
%%     ~~Describe \code{group_by} here~~
}
  \item{genes}{
%%     ~~Describe \code{genes} here~~
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
function (so, condition_column = "condition", show_pval_asterisks = FALSE, 
    p_value_type = c("raw", "FDR"), save = FALSE, output_dir = getwd(), 
    height = 6, width = 10, group_by = NULL, genes = NULL) 
{
    if (!condition_column \%in\% colnames(so@meta.data)) {
        stop("The specified condition column does not exist in the metadata.")
    }
    if (!is.null(genes)) {
        for (gene in genes) {
            gene_col <- paste0(gene, "_Expressed_high")
            if (!gene_col \%in\% colnames(so@meta.data)) {
                stop(paste("The gene", gene, "does not have an '_Expressed_high' column in the metadata."))
            }
        }
    }
    else {
        stop("Please provide a list of genes to analyze.")
    }
    plot_list <- list()
    if (!is.null(group_by)) {
        if (!group_by \%in\% colnames(so@meta.data)) {
            stop("The specified group_by column does not exist in the metadata.")
        }
        for (cluster in unique(so@meta.data[[group_by]])) {
            cat("Processing cluster:", cluster, "\n")
            so_cluster <- so[, so@meta.data[[group_by]] == cluster]
            combined_data <- list()
            for (gene in genes) {
                gene_col <- paste0(gene, "_Expressed_high")
                so_cluster@meta.data[[paste0("combined_", gene)]] <- paste(so_cluster@meta.data[[gene_col]], 
                  so_cluster@meta.data[[condition_column]], sep = "_")
                combined_data[[gene]] <- data.frame(expression_condition = so_cluster@meta.data[[paste0("combined_", 
                  gene)]], condition = so_cluster@meta.data[[condition_column]], 
                  gene = gene)
            }
            DF <- do.call(rbind, combined_data)
            DY2 <- DF \%>\% group_by(gene, condition, expression_condition) \%>\% 
                summarise(N = n()) \%>\% mutate(C = sum(N)) \%>\% 
                mutate(Count = N/C)
            color_map <- c(Gene_High = "#F07167", Gene_Low = "#72B19C")
            DY2$expression_condition <- sapply(DY2$expression_condition, 
                function(x) {
                  gene_name <- unique(DY2$gene[DY2$expression_condition == 
                    x])
                  if (grepl(paste0(gene_name, "_High"), x)) {
                    return("Gene_High")
                  }
                  else {
                    return("Gene_Low")
                  }
                })
            if (show_pval_asterisks) {
                p_values <- list()
                for (gene in genes) {
                  gene_col <- paste0(gene, "_Expressed_high")
                  contingency_table <- table(so_cluster@meta.data[[gene_col]], 
                    so_cluster@meta.data[[condition_column]])
                  test_result <- chisq.test(contingency_table)
                  p_values[[gene]] <- test_result$p.value
                }
                adjusted_p_values <- p.adjust(unlist(p_values), 
                  method = "BH")
                p_val_column <- if (p_value_type == "raw") {
                  p_values
                }
                else {
                  adjusted_p_values
                }
                DY2$p_value <- sapply(1:nrow(DY2), function(i) {
                  gene_name <- DY2$gene[i]
                  if (DY2$condition[i] == "EXP") {
                    p_val <- p_val_column[gene_name]
                    if (p_val < 0.001) {
                      return("p value ***")
                    }
                    else if (p_val < 0.01) {
                      return("p value **")
                    }
                    else if (p_val < 0.05) {
                      return("p value *")
                    }
                    else {
                      return("p value ns")
                    }
                  }
                  else {
                    return("")
                  }
                })
                DY2$label <- sapply(1:nrow(DY2), function(i) {
                  if (DY2$condition[i] == "EXP") {
                    return(paste0(format(round(DY2$Count[i], 
                      2), nsmall = 2), " ", DY2$p_value[i]))
                  }
                  else {
                    return(format(round(DY2$Count[i], 2), nsmall = 2))
                  }
                })
            }
            for (gene_name in unique(DY2$gene)) {
                gene_data <- DY2[DY2$gene == gene_name, ]
                g2 <- ggplot(gene_data, aes(x = condition, y = Count, 
                  fill = expression_condition)) + geom_bar(stat = "identity", 
                  color = "black") + geom_text(aes(label = label), 
                  color = "black", position = position_stack(vjust = 0.5)) + 
                  xlab("Conditions") + ylab("Cell Proportion") + 
                  scale_fill_manual(values = color_map) + theme(panel.grid.major = element_blank(), 
                  panel.grid.minor = element_blank(), panel.background = element_blank(), 
                  axis.line = element_line(colour = "black")) + 
                  labs(fill = paste(cluster, gene_name)) + facet_wrap(~gene, 
                  labeller = label_both, scales = "free_y") + 
                  theme(strip.text = element_text(size = 12, 
                    face = "bold"))
                g2 <- g2 + theme(axis.text.x = element_text(angle = 45, 
                  hjust = 1))
                plot_list[[paste(cluster, gene_name, sep = "_")]] <- g2
            }
        }
        combined_plots <- plot_grid(plotlist = plot_list, ncol = 2)
        if (save) {
            file_name <- file.path(output_dir, "combined_expression_plots.pdf")
            ggsave(file_name, plot = combined_plots, width = width, 
                height = height)
        }
        else {
            print(combined_plots)
        }
    }
    else {
        DF <- data.frame()
        for (gene in genes) {
            gene_col <- paste0(gene, "_Expressed_high")
            so@meta.data[[paste0("combined_", gene)]] <- paste(so@meta.data[[gene_col]], 
                so@meta.data[[condition_column]], sep = "_")
            DF <- rbind(DF, data.frame(expression_condition = so@meta.data[[paste0("combined_", 
                gene)]], condition = so@meta.data[[condition_column]], 
                gene = gene))
        }
        DY2 <- DF \%>\% group_by(gene, condition, expression_condition) \%>\% 
            summarise(N = n()) \%>\% mutate(C = sum(N)) \%>\% mutate(Count = N/C)
        color_map <- c(Gene_High = "#F07167", Gene_Low = "#72B19C")
        DY2$expression_condition <- sapply(DY2$expression_condition, 
            function(x) {
                gene_name <- unique(DY2$gene[DY2$expression_condition == 
                  x])
                if (grepl(paste0(gene_name, "_High"), x)) {
                  return("Gene_High")
                }
                else {
                  return("Gene_Low")
                }
            })
        if (show_pval_asterisks) {
            p_values <- list()
            for (gene in genes) {
                gene_col <- paste0(gene, "_Expressed_high")
                contingency_table <- table(so@meta.data[[gene_col]], 
                  so@meta.data[[condition_column]])
                test_result <- chisq.test(contingency_table)
                p_values[[gene]] <- test_result$p.value
            }
            adjusted_p_values <- p.adjust(unlist(p_values), method = "BH")
            p_val_column <- if (p_value_type == "raw") {
                p_values
            }
            else {
                adjusted_p_values
            }
            DY2$p_value <- sapply(1:nrow(DY2), function(i) {
                gene_name <- DY2$gene[i]
                if (DY2$condition[i] == "EXP") {
                  p_val <- p_val_column[gene_name]
                  if (p_val < 0.001) {
                    return("p value ***")
                  }
                  else if (p_val < 0.01) {
                    return("p value **")
                  }
                  else if (p_val < 0.05) {
                    return("p value *")
                  }
                  else {
                    return("p value ns")
                  }
                }
                else {
                  return("")
                }
            })
            DY2$label <- sapply(1:nrow(DY2), function(i) {
                if (DY2$condition[i] == "EXP") {
                  return(paste0(format(round(DY2$Count[i], 2), 
                    nsmall = 2), " ", DY2$p_value[i]))
                }
                else {
                  return(format(round(DY2$Count[i], 2), nsmall = 2))
                }
            })
        }
        for (gene_name in unique(DY2$gene)) {
            gene_data <- DY2[DY2$gene == gene_name, ]
            g2 <- ggplot(gene_data, aes(x = condition, y = Count, 
                fill = expression_condition)) + geom_bar(stat = "identity", 
                color = "black") + geom_text(aes(label = label), 
                color = "black", position = position_stack(vjust = 0.5)) + 
                xlab("Conditions") + ylab("Cell Proportion") + 
                scale_fill_manual(values = color_map) + theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), panel.background = element_blank(), 
                axis.line = element_line(colour = "black")) + 
                labs(fill = paste(gene_name)) + theme(axis.text.x = element_text(angle = 45, 
                hjust = 1))
            plot_list[[gene_name]] <- g2
        }
        combined_plots <- plot_grid(plotlist = plot_list, ncol = 2)
        if (save) {
            file_name <- file.path(output_dir, "combined_expression_plots.pdf")
            ggsave(file_name, plot = combined_plots, width = width, 
                height = height)
        }
        else {
            print(combined_plots)
        }
    }
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
