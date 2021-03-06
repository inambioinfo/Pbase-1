\name{Proteins-class}
\Rdversion{1.1}
\docType{class}

\alias{Proteins-class}
\alias{class:Proteins}
\alias{Proteins}

\alias{Proteins,character,missing-method}
\alias{Proteins,missing,character-method}
\alias{Proteins,missing,missing-method}

\alias{[,Proteins,ANY,ANY-method}
\alias{[,Proteins,ANY,ANY,ANY-method}
\alias{[[,Proteins,ANY,ANY-method}
\alias{aa,Proteins-method}
\alias{aa}
\alias{ametadata,Proteins-method}
\alias{ametadata}
\alias{acols}
\alias{metadata,Proteins-method}
\alias{metadata<-,Proteins-method}
\alias{pfeatures,Proteins-method}
\alias{pfeatures}
\alias{plot,Proteins,missing-method}
\alias{pmetadata,Proteins-method}
\alias{pmetadata}
\alias{pcols}
\alias{pranges,Proteins-method}
\alias{pranges}
\alias{pranges<-,Proteins,CompressedIRangesList-method}
\alias{pranges<-}

\alias{pfilter,Proteins-method}
\alias{pfilter}
\alias{pvarLabels,Proteins-method}
\alias{pvarLabels}
\alias{avarLabels,Proteins-method}
\alias{avarLabels}

\alias{length,Proteins-method}
\alias{seqnames,Proteins-method}
\alias{show,Proteins-method}

\alias{cleave,Proteins-method}
\alias{addIdentificationData,Proteins,character-method}
\alias{addPeptideFragments}
\alias{addPeptideFragments,Proteins,character-method}

\alias{rmEmptyRanges}
\alias{proteotypic}
\alias{proteinCoverage}
\alias{isCleaved}


\title{The \code{Proteins} Class for Proteomics Data And Meta-Data}

\description{

  The \code{Proteins} class encapsulates data and meta-data for
  proteomics experiments. The class stores the protein sequences as well
  as specific subsets of interest, typically peptides, as ranges. The
  \code{Proteins} instances, the sequence and peptide slots are
  described by their respective metadata attributes.

}

\section{Objects from the Class}{

  Objects can be created using its constructor \code{Proteins}. The
  constructor either takes a \code{fasta} file name as first argument
  or, alternatively a named \code{uniprotIds} argument with valid
  UniProt accession numbers (not yet implemented).

}

\section{Details}{

  An instance of class \code{Proteins} is characterised by one or
  multiple protein sequences that can be accessed as \code{AAStringSet}
  with the \code{aa} accessor. Sequence-specific annotation, such as
  accession numbers, protein and gene names, ... is available with the
  \code{ametadata} or \code{acols} methods. General metadata such as the
  data of creation of the instance are stored as a \code{list} returned
  by the \code{metadata} accessor, which would typically contain a
  \code{created} character that documents when the object was created, a
  reference \code{genome} descriptor, a \code{UniProtRelease} with the
  release data of the UniProt database and possibly others.

  Each sequence of a \code{Proteins} instance can also be characterised
  by a set of specific ranges describing peptides of interest. These
  \emph{peptide features} can be extracted as an \code{AAStringSetList},
  where each protein sequence contains 0 or more peptide features. These
  peptides features are encode as ranges along the original proteins
  sequences (a \code{list} of \code{IRanges}) that can be extracted with
  the \code{pranges} function. These peptide features have their own
  metadata describing for example peptide identification scores, number
  of missed cleavages, ... available with the \code{pmetadata} or
  \code{pcols} methods.

  See also the \code{Pbase-data} vignette.

}

\section{Developement notes}{

  %% The current decision is to avoid \code{pranges} from multiple origins,
  %% i.e. it is not possible to call `addIdentificationData` multiple
  %% times. It is probably easier to manage this situation using different
  %% \code{Proteins} instances. We can then think about \emph{comparing}
  %% \code{Proteins} instances (that have \code{identical(p1@aa, p2@aa)})
  %% and easily return \emph{common} sequences.

  Since version 0.2.0, \code{addIdentificationData} supports multiple
  identification file names to be added to a \code{Proteins} instance
  (argument renamed \code{filenames}) using either \code{mzID} or
  \code{mzR}. Added new \code{Pparams} parametrisation infrastructure.

  See \code{news(package = "Pbase")} for a description of all changes.

  Other possible metadata fields: \code{Uniprot.sw}, \code{biomaRt}
  instances.

}

\section{Slots}{
  \describe{
    \item{\code{metadata}:}{ Object of class \code{"list"} containing
      global metadata, accessed with \code{metadata}.
    }
    \item{\code{aa}:}{ Object of class \code{"AAStringSet"} storing the
      protein sequences, accessed with \code{aa}.
    }
    \item{\code{pranges}:}{ Object of class
      \code{"CompressedIRangesList"} containg protein feature ranges
      such as theoretical (obtain by in silico cleavage) or observed
      peptides. Accessed as an \code{\linkS4class{IRangesList}} with
      \code{pranges} or and \code{\linkS4class{AAStringSetList}} with
      \code{pfeatures}.
    }
    \item{\code{.__classVersion__}:}{ Object of class \code{"Versions"}
      documenting the class verions. Intended for developer use and
      debugging.
    }
  }
}

\section{Extends}{
  Class \code{"\linkS4class{Versioned}"}, directly.
}

\section{Methods}{
  \describe{

    \item{aa}{\code{signature(x = "Proteins")}: Returns an
      \code{\linkS4class{AAStringSet}} instance representing the
      sequences of the proteins.}

    \item{pfeatures}{\code{signature(x = "Proteins")}: ... }
    \item{pranges}{\code{signature(x = "Proteins")}: ... }

    \item{metadata}{\code{signature(x = "Proteins")}: Returns a
      \code{list} of global metadata of the instance \code{x}, including
      data of instance creation or, if created from a set of UnitProt
      identifiers (see constructors above), the UniProt version and
      \code{UnitProt.WS} version number. }

    \item{ametadata}{\code{signature(x = "Proteins")}: Returns a
      \code{\linkS4class{DataFrame}} of protein metadata. }
    \item{acols}{\code{signature(x = "Proteins")}: See
      \code{ametadata}. }
    \item{pmetadata}{\code{signature(x = "Proteins")}: Returns a
      \code{list} of feature metadata. }
    \item{pcols}{\code{signature(x = "Proteins")}: See
      \code{pmetadata}. }

    \item{avarLabels}{\code{signature(x = "Proteins")}: Returns the
      names of the sequences metadata. }
    \item{pvarLabels}{\code{signature(x = "Proteins")}: Returns the
      names of the peptide feature metadata. }

    \item{seqnames}{\code{signature(x = "Proteins")}: Returns the
      protein sequence names defined as UniProt accession numbers. }

    \item{length}{\code{signature(x = "Proteins")}: Returns the number
      of proteins. }

    \item{[}{\code{signature(x = "Proteins", i = "ANY", j = "missing")}:
      Creates a subset of the \code{Proteins} insance.}

    \item{[[}{\code{signature(x = "Proteins", i = "ANY", j = "missing")}:
      Returns an \code{\linkS4class{AAString}} instance representing the
      sequence of the selected protein.}

    \item{pfilter}{\code{signature(x = "Proteins", mass = "numeric", len
	= "numeric", ...)}: ... }

    \item{cleave}{\code{signature(x = "Proteins", enzym = "character",
            missedCleavages = "numeric")}:
        Cleaves all proteins using the \code{enzym} rule while allowing
        \code{missedCleavages} missing cleavages. Please see
        \code{\link[cleaver]{cleave}} for details.}

    \item{addIdentificationData}{\code{signature(object = "Proteins",
	id = "character", rmEmptyRanges = "logical", par =
	"Pparams")}: Adds identification data from an IdentMzMl file (\code{id})
    to the Proteins \code{object}. If \code{rmEmptyRanges} is \code{TRUE}
    proteins without any identification data are removed. See
    \code{\linkS4class{Pparams}} for further settings.}

    \item{addPeptideFragments}{\code{signature(object = "Proteins",
	filenames = "character", rmEmptyRanges = "logical", par =
	"Pparams")}: Adds identification data from a fasta file (\code{filenames})
    to the Proteins \code{object}. Please note that both fasta files (the origin
    of the Proteins \code{object} and the ones given in \code{filenames}) must
    share the same Uniprot accession numbers.
    If \code{rmEmptyRanges} is \code{TRUE}
    proteins without any identification data are removed. See
    \code{\linkS4class{Pparams}} for further settings.}

    \item{plot}{\code{signature(x = "Proteins", y = "missing")}: Plots
      all proteins and associated peptides using the
      \code{Gviz}/\code{Pviz} infrastructure. }

    \item{show}{\code{signature(object = "Proteins")}: Displays object
      summary as text. }

  }
}

\section{Functions}{
  \describe{

    \item{rmEmptyRanges}{\code{signature(x = "Proteins")}}:{ removes
      proteins with empty peptide ranges. }

    \item{proteotypic}{\code{signature(x = "Proteins")}: returns a
      modified Proteins object. \code{pcols(x)} gains a "Proteotypic"
      logical column, indicating of the peptide is proteotypic or now. }

    \item{proteinCoverage}{\code{signature(pattern = "Proteins")}:
      calulates the coverage of proteins. \code{pcols(x)} gains a
      "Coverage" numeric column. }

    \item{isCleaver}{\code{signature(x = "Proteins", missedCleavages =
	"numeric")}: Tests whether a Protein object was cleaved
      already.}

  }
}

\references{
  Definition of the UniProt fasta comment format:
  \url{http://www.uniprot.org/help/fasta-headers}
}


\seealso{
  \code{\link{calculateHeavyLabels}}
}

\author{
  Laurent Gatto <lg390@cam.ac.uk> and Sebastian Gibb <mail@sebastiangibb.de>
}

\examples{

## Create a Protein object reading all proteins from a fasta file.
fastaFiles <- list.files(system.file("extdata", package = "Pbase"),
                         pattern = "fasta", full.names = TRUE)
p <- Proteins(fastaFiles)
p
metadata(p)

## Adding custom metadata
metadata(p, "Comment") <- "I love R"
metadata(p)

## Plotting
plot(p[1:5], from = 1, to = 30)

## Cleaving
pp <- cleave(p[1:100])
pp <- proteotypic(pp)
pp
pcols(pp[1:2])

plot(pp[1:2], from = 20, to = 30)

## Protein coverage
pp <- proteinCoverage(pp)
avarLabels(pp)
acols(pp)$Coverage
pp


## Add indentification data
idfile <- system.file("extdata/Thermo_Hela_PRTC_selected.mzid",
                      package = "Pbase")
p <- addIdentificationData(p, idfile)
pranges(p)
pfeatures(p)

plot(p[1])
plot(p[1], # the first protein has 36 peptides
     fill = c(rep("orange", 13), rep("steelblue", 13)))
}


\keyword{classes}
