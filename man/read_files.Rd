% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read.R
\name{read_files}
\alias{read_files}
\title{Read Files}
\usage{
read_files(.dir = ".", .pattern = "[.]rds$", .fun = readRDS,
  .recursive = FALSE, .hidden = FALSE, .silent = FALSE, ...)
}
\arguments{
\item{.dir}{A string of the path to the directory.}

\item{.pattern}{A string of the regular expression to use when searching for files.
To include all files use ".*".}

\item{.fun}{The function to use when reading each file. 
The first argument must be the name of the file.}

\item{.recursive}{A flag indicating whether to recurse into subdirectories.}

\item{.hidden}{A flag indicating whether to include hidden files.}

\item{.silent}{A flag indicating whether error messages should be 
suppressed when trying to read a file.}

\item{...}{Additional arguments passed to .fun}
}
\value{
A named list of the files.
}
\description{
Reads multiple files from a directory.
}
\examples{
dir <- system.file("extdata", package = "filer")
objects <- read_files(dir)
lapply(objects, head)
}
\seealso{
\code{\link{list.files}}
}
