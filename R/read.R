#' Read Files
#' 
#' Reads multiple files from a directory.
#'
#' @param .dir A string of the path to the directory.
#' @param .pattern A string of the regular expression to use when searching for files.
#' To include all files use ".*".
#' @param .fun The function to use when reading each file. 
#'   The first argument must be the name of the file.
#' @param .hidden A flag indicating whether to include hidden files.
#' @param .recursive A flag indicating whether to recurse into subdirectories.
#' @param .silent A flag indicating whether error messages should be 
#' suppressed when trying to read a file.
#' @param ... Additional arguments passed to .fun
#' @return A named list of the files.
#' @seealso \code{\link{list.files}}
#' @export
#' @examples
#' dir <- system.file("extdata", package = "filer")
#' read_files(dir)
read_files <- function(.dir = ".", .pattern = "[.]rds$", .fun = readRDS, 
                       .recursive = FALSE, .hidden = FALSE, 
                       .silent = FALSE, ...) {
  check_string(.dir)
  check_string(.pattern)
  check_function(.fun)
  check_flag(.recursive)
  check_flag(.hidden)
  check_flag(.silent)
  
  files <- list.files(.dir, pattern = .pattern, all.files = .hidden,
                      recursive = .recursive)
  
  if(!length(files)) return(named_list())
  
  objects <- lapply(file.path(.dir, files), try_read, .fun = .fun, 
                    .silent = .silent, ...)
  
  names(objects) <- files
  files <- file.path(.dir, files)
  failed <- mapply(identical, objects, files)
  
  if(any(failed)) {
    objects <- objects[!failed]
    failed <- names(failed[failed])
    warning("the following ", plural("file", length(failed)), " failed to read: ", 
            punctuate(failed, "and") , call. = FALSE)
  }
  objects
}