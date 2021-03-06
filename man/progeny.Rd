% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/progeny-package.r, R/progeny.r
\docType{package}
\name{progeny}
\alias{progeny}
\alias{progeny-package}
\alias{progeny}
\title{Calculate PROGENy pathway scores from gene expression}
\usage{
progeny(expr, scale = TRUE)
}
\arguments{
\item{expr}{A gene expression object with HGNC symbols in rows and samples
in columns}

\item{scale}{Logical value indicating whether to scale the scores of each
pathway to have a mean of zero and standard deviation of one}
}
\value{
A matrix with samples in columns and pathways in rows
}
\description{
This function uses the linear model of pathway-responsive genes underlying
the PROGENy method. It transforms a gene expression matrix with HGNC gene
symbols in rows and sample names in columns into a pathway score matrix with
samples and in rows and pathways in columns.

This function uses the linear model of pathway-responsive genes underlying
the PROGENy method. It transforms a gene expression matrix with HGNC gene
symbols in rows and sample names in columns into a pathway score matrix with
samples and in rows and pathways in columns.
}
\details{
The publication of the method is available at:
https://www.biorxiv.org/content/early/2016/08/28/065672

The supplied expression object has to contain HGNC symbols in rows. This
will, in most cases (and how we originally used it), be either normalized
gene expression of a microarray experiment or log-transformed (and
possible variance-stabilized) counts from an RNA-seq experiment.

The model matrix itself consists of 11 pathways and 1059 genes. Its
coefficients are non-zero if the gene-pathway pair corresponds to the top
100 genes that were up-regulated upon stimulation of the pathway in a wide
range of experiments. The value corresponds to the fitted z-score across
experiments in our model fit. Only rows with at least one non-zero
coefficient were included, as the rest is not used to infer pathway
activity.
}
\examples{
# use your gene expression matrix here, this is just for illustration
gene_expression = matrix(rep(1, nrow(model)),
    dimnames=list(rownames(model), "sample"))

# calculate pathway activities
pathways = progeny(gene_expression)
}
