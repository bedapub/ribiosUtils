% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scripting.R
\name{scriptInit}
\alias{scriptInit}
\title{Prepare R for an interactive script}
\usage{
scriptInit()
}
\value{
Side effect is used.
}
\description{
The function prepares R for an interactive session (e.g. in a script).
Currently it defines behaviour in case of errors: a file named
\dQuote{ribios.dump} is written.
}
\examples{

## do not run unless the script mode is needed
\dontrun{
  scriptInit()
}

}
\seealso{
\code{\link{options}}
}
\author{
Jitao David Zhang <jitao_david.zhang@roche.com>
}
