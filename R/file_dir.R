#' Checks existing directory
#' 
#' Checks whether given character strings point to valid directories
#' 
#' \code{isDir} tests whether the given string represent a valid, existing
#' directory. \code{assertDir} performs a logical test, and stops the program
#' if the given string does not point to a given directory.
#' 
#' \code{checkDir} is synonymous to \code{isDir}
#' 
#' @aliases isDir checkDir assertDir
#' @param \dots One or more character strings giving directory names to be
#' tested
#' @return \code{isDir} returns logical vector.
#' 
#' \code{assertDir} returns an invisible \code{TRUE} if directories exist,
#' otherwise halts and prints error messages.
#' @author Jitao David Zhang <jitao_david.zhang@@roche.com>
#' @seealso \code{\link{file.info}}, \code{\link{checkFile}} and
#' \code{\link{assertFile}}
#' @examples
#' 
#' dir1 <- tempdir()
#' dir2 <- tempdir()
#' 
#' isDir(dir1, dir2)
#' assertDir(dir1, dir2)
#' 
#' @export isDir checkDir assertDir
isDir <- function(...) {
  x <- unlist(list(...))
  na.false(file.info(x)$isdir)
}

#' @export checkDir
#' @rdname isDir
checkDir <- function(...) {
  x <- unlist(list(...))
  all(isDir(...))
}

#' @export assertDir
#' @rdname isDir
assertDir <- function(...) {
  haltifnot(checkDir(...),
            msg="Not all directories exist\n")
  return(invisible(TRUE))
}


#' Create a directory if it does not exist, and then make sure the creation was
#' successful.
#' 
#' The function is particularly useful for scripting.
#' 
#' 
#' @param dir Directory name
#' @param showWarnings Passed to \link{dir.create}
#' @param recursive Passed to \link{dir.create}
#' @param mode Passed to \link{dir.create}
#' @return Directory name (invisible)
#' @author Jitao David Zhang <jitao_david.zhang@@roche.com>
#' @examples
#' 
#' tempdir <- tempdir()
#' createDir(tempdir)
#' 
#' @export createDir
createDir <- function(dir,showWarnings=FALSE, recursive=FALSE, mode="0777") {
  if(!checkDir(dir))
    dir.create(path=dir, showWarnings=showWarnings, recursive=recursive, mode=mode)
  if(!checkDir(dir))
    stop("Directory access not possible: ", dir)
  return(invisible(dir))
}


#' Check whether file(s) exist
#' 
#' \code{checkFile} checks whether file exists, \code{assertFile} stops the
#' program if files do not exist
#' 
#' \code{assertFile} is often used in scripts where missing a file would cause
#' the script fail.
#' 
#' @aliases checkFile assertFile
#' @param \dots Files to be checked
#' @return \code{checkFile} returns logical vector. \code{assertFile} returns
#' an invisible \code{TRUE} if files exist, otherwise halts and prints error
#' messages.
#' @author Jitao David Zhang <jitao_david.zhang@@roche.com>
#' @seealso \code{\link{isDir}} and \code{\link{assertDir}}
#' @examples
#' 
#' myDesc <- system.file("DESCRIPTION", package="ribiosUtils")
#' myNEWS <- system.file("NEWS", package="ribiosUtils")
#' checkFile(myDesc, myNEWS)
#' assertFile(myDesc, myNEWS)
#' 
#' @export checkFile assertFile
checkFile <- function(...) {
  x <- unlist(list(...))
  all(file.exists(x))
}

#' @rdname checkFile
#' @export assertFile
assertFile <- function(...) {
  af <- checkFile(...)
  if(af) return(invisible(TRUE))
  
  x <- unlist(list(...))
  notfound <- x[!file.exists(x)]
  haltifnot(af,
            msg=paste(paste("File not found:", notfound, sep=""),
              collapse="\n"))
}

#' Overwrite a directory
#' @param dir Chacater, path to a directory.
#' @param action Ask the user to input the option (\code{ask}), or one of the
#' following options: \code{overwrite}, \code{append}, and \code{no}. See below
#' for other options.
#'
#' @return If \code{action} is set to \code{overwrite}, the directory will be
#' deleted recursively if it exists, a new directory with the same name will be
#' created, and the function returns \code{TRUE}. If \code{append} is set, the
#' function creates the directory if necessary and returns \code{TRUE}. If
#' \code{no} is set, the function does nothing and returns.
#'
#' If \code{action} is set to \code{ask}, user will be prompted for actions.
#'
#' If \code{overwrite} is set, the directory will be removed and written anew.
#'
#' If \code{append} is set, in contrast to \code{overwrite}, the directory and
#'  the files in it are not removed if they exists. In this case, files with the
#'   same name will be overwritten. Otherwise, new directories or files
#'   will be simply created. On the other hand, if the directory does not exist,
#'   it will be created.
#'
#' If \code{no} is set, no action will be taken. The funciton returns
#' \code{FALSE}.
#'
#' @examples
#' createTempDir <- function() {
#'   tmpdir <- tempdir()
#'   tmpfile1 <- tempfile(tmpdir=tmpdir)
#'   tmpfile2 <- tempfile(tmpdir=tmpdir)
#'
#'   writeLines("First file", tmpfile1)
#'   writeLines("Second file", tmpfile2)
#'   return(tmpdir)
#' }
#' newTempFile <- function(tmpdir) {
#'   writeLines("Third file", tempfile(tmpdir=tmpdir))
#' }
#' \dontrun{
#'   tmpdir <- createTempDir()
#'   overwriteDir(tmpdir, action="ask")
#' }
#'
#' ## overwrite: delete the directory and create it a new
#' tmpdir <- createTempDir()
#' fileCount <- length(dir(tmpdir))
#' dir(tmpdir) ## two files should be there
#' overwriteDir(tmpdir, action="overwrite")
#' newTempFile(tmpdir)
#' dir(tmpdir) ## now there should be only one file
#' stopifnot(length(dir(tmpdir))==1)
#'
#' ## append: append files, and overwrite if a file of the same name is there
#' overwriteDir(tmpdir, action="append")
#' newTempFile(tmpdir)
#' dir(tmpdir) ## a new file is written
#' stopifnot(length(dir(tmpdir))==2)
#'
#' ## no: no action, and returns FALSE
#' noRes <- overwriteDir(tmpdir, action="no")
#' stopifnot(!noRes)
#'
#' @export
overwriteDir <- function(dir,
                         action=c("ask", "overwrite", "append", "no")) {
  action <- match.arg(action)
  ans <- NA
  msg <- paste(sprintf("Directory %s exists.\n", dir),
               "Choose an action:\n",
               " * Overwrite [o]: ",
               " the directory is removed and created anew.\n",
               " * Append [a]: ",
               "Files with same names are overwritten.\n",
               " * No [N]: No action is taken, NULL is returned", sep="")
  question <-"Your choice [o/a/N]:"
  if (action == "ask") {
    if (dir.exists(dir)) {
      while (!ans %in% c("o", "a", "N")) {
        if (!is.na(ans)) {
          message(sprintf("Invalid input %s", ans))
        }
        message(msg)
        ans <- readline(question)
        if (ans == "" || ans == "n") {
          ans <- "N"
        }
      }
    }
    else {
      ans <- "a"
    }
  } else if (action == "overwrite") {
    ans <- "o"
  } else if (action == "append") {
    ans <- "a"
  } else {
    ans <- "N"
  }
  if (ans=="o") {
    if(dir.exists(dir)) {
      unlink(dir, recursive=TRUE, force=TRUE)
    }
    createDir(dir)
    return(TRUE)
  } else if (ans=="a") {
    createDir(dir)
    return(TRUE)
  } else if (ans=="N") {
    return(FALSE)
  } else {
    stop("Should not be here")
  }
}
