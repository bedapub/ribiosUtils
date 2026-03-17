#' Copy the skeleton RMarkdown file to a specified location
#'
#' This function copies the skeleton RMarkdown template shipped with
#' \code{ribiosUtils} to the current working directory (or any specified path)
#' under a user-given file name. When no file name is provided, a default name
#' based on the current date is used.
#'
#' @param filename Character string, the name (or path) of the destination
#'   file. If \code{NULL} (default), the file is named
#'   \code{Report_[YYYY-DD-MM]-report.Rmd}, where the date components reflect
#'   the current date.
#' @param overwrite Logical, whether to overwrite an existing file. Default is
#'   \code{FALSE}.
#' @return The path of the copied file (invisible).
#' @author Jitao David Zhang <jitao_david.zhang@@roche.com>
#' @examples
#' \dontrun{
#' ## copy with default file name
#' createRmdTemplate()
#'
#' ## copy with a custom file name
#' createRmdTemplate("my_analysis.Rmd")
#' }
#'
#' ## copy to a temporary directory
#' dest <- createRmdTemplate(file.path(tempdir(), "test_report.Rmd"))
#' file.exists(dest)
#' unlink(dest)
#'
#' @export
createRmdTemplate <- function(filename = NULL, overwrite = FALSE) {
  if (is.null(filename)) {
    filename <- format(Sys.time(), "Report_%Y-%d-%m-report.Rmd")
  }
  skeleton <- system.file("rmarkdown", "templates",
    "ribios-rmarkdown-template", "skeleton", "skeleton.Rmd",
    package = "ribiosUtils")
  if (skeleton == "") {
    stop("Skeleton file not found in ribiosUtils installation.")
  }
  if (file.exists(filename) && !overwrite) {
    stop("File '", filename, "' already exists. ",
      "Use overwrite=TRUE to overwrite.")
  }
  file.copy(skeleton, filename, overwrite = overwrite)
  message("Skeleton file copied to '", filename, "'")
  return(invisible(filename))
}
