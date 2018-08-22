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
