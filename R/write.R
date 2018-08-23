
#' Write Files
#'
#' @param .objects A uniquely named list of objects to save as files.
#' @param .fun The function to use when saving each object.
#' @param .ask A flag indicating whether to ask before 
#' @param .silent A flag indicating whether error messages should be 
#' suppressed when trying to write a file.
#' @inheritParams read_files
#' @return An invisible character vector of the names of the successfully saved files.
#' @seealso \code{\link{read_files}} and \code{\link{file_names}}
#' @export
#'
#' @examples
#' objects <- list(mtcars = datasets::mtcars, chickwts = datasets::chickwts)
#' write_files(objects, tempdir())
write_files <- function(.objects, .dir = ".", .fun = saveRDS, 
                        .ask = getOption("filer.ask", TRUE), .silent = FALSE, 
                        ...) {
  check_list(.objects)
  check_named(.objects, unique = TRUE)
  check_string(.dir)
  check_function(.fun, nargs = TRUE)
  check_flag(.ask)
  check_flag(.silent)
  
  if(!length(.objects)) return(invisible(character(0)))
  
  names(.objects) <- file.path(.dir, names(.objects))
  
  dirs <- sort(unique(dirname(names(.objects))))
  
  dirs <- dirs[!dir.exists(dirs)]
  if(length(dirs)) {
    if(.ask && !yesno(cn(dirs, 
                        "Create directory: %c?", 
                        "Create %n directories: %c?")))
      return(character(0))
    lapply(dirs, dir.create)
  }
  
  files <- list.files(.dir, all.files = TRUE, full.names = FALSE, recursive = TRUE)
  files <- intersect(files, names(objects))
  if(length(files)) {
    if(.ask && !yesno(cn(files, 
                        "Replace file: %c", 
                        "Replace %n files: %c")))
      return(character(0))
  }
  
  .objects
  
  #  Map(try_write, objects, names(x), .fun = .fun, .silent = .silent, ...)
}
