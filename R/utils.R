try_read <- function(x, .fun, .silent, ...) {
  try(x <- .fun(x, ...), silent = .silent)
  x
}

named_list <- function() {
  list(x = 1)[0]
}

punctuate <- function(x, qualifier = "or") {
  x <- paste0("'", as.character(x), "'")
  if (identical(length(x), 1L)) return(x)
  n <- length(x)
  paste(paste(x[-n], collapse = ", "), qualifier, x[n])
}

plural <- function(x, n = 1L, end = "") {
  paste0(x, if(n != 1L) "s", end)
}

#' File Names
#'
#' @param file A string of the file name.
#' @param n A count of the number of files.
#' @param ext A string of the extension.
#' @return A character vector of the file names.
#' @export
#'
#' @examples
#' file_names(n = 10)
file_names <- function(file = "file", n = 1L, ext = "rds") {
  check_string(file)
  n <- check_count(n, coerce = TRUE)
  check_string(ext)

  if(identical(n, 0L)) return (character(0))
  
  n <- formatC(1:n, width = nchar(n), flag = "0")

  paste0(file, n, ".", ext)
}
