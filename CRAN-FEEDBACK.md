## Jan 28, 2026

Please always write package names, software names and API (application
programming interface) names in single quotes in title and description.
e.g: --> 'Bioinfo-C', etc...
Please note that package names are case sensitive.
For more details:
<https://contributor.r-project.org/cran-cookbook/description_issues.html#formatting-software-names>

Please add \value to .Rd files regarding exported methods and explain
the functions results in the documentation. Please write about the
structure of the output (class) and also what the output means. (If a
function does not return a value, please document that too, e.g.
\value{No return value, called for side effects} or similar)
For more details:
<https://contributor.r-project.org/cran-cookbook/docs_issues.html#missing-value-tags-in-.rd-files>
Missing Rd-tags:
      cutreeIntoOrderedGroups.Rd: \value
      invertList.Rd: \value
      pAbsLog10Score.Rd: \value
      pQnormScore.Rd: \value
      pScore.Rd: \value

\dontrun{} should only be used if the example really cannot be executed
(e.g. because of missing additional software, missing API keys, ...) by
the user. That's why wrapping examples in \dontrun{} adds the comment
("# Not run:") as a warning for the user. Does not seem necessary.
Please replace \dontrun with \donttest.
Please unwrap the examples if they are executable in < 5 sec, or replace
dontrun{} with \donttest{}.
For more details:
<https://contributor.r-project.org/cran-cookbook/general_issues.html#structuring-of-examples>


Only functions which are supposed to only run interactively (e.g. shiny)
should be wrapped in if(interactive()). Please replace
if(interactive()){} if possible. -> bedaInfo.Rd; libordie.Rd;
print.BEDAinfo.Rd
For more details:
<https://contributor.r-project.org/cran-cookbook/general_issues.html#structuring-of-examples>


Please make sure that you do not change the user's options, par or
working directory. If you really have to do so within functions, please
ensure with an *immediate* call of on.exit() that the settings are reset
when the function is exited.
e.g.:
...
oldwd <- options() # code line i
on.exit(options(oldwd)) # code line i+1
...
options(...) # somewhere after
...
e.g.: -> R/scripting.R
If you're not familiar with the function, please check ?on.exit. This
function makes it possible to restore options before exiting a function
even if the function breaks. Therefore it needs to be called immediately
after the option change within a function.
For more details:
<https://contributor.r-project.org/cran-cookbook/code_issues.html#change-of-options-graphical-parameters-and-working-directory>

Please ensure that your functions do not write by default or in your
examples/vignettes/tests in the user's home filespace (including the
package directory and getwd()). This is not allowed by CRAN policies.
Please omit any default path in writing functions. In your
examples/vignettes/tests you can write to tempdir().
For more details:
<https://contributor.r-project.org/cran-cookbook/code_issues.html#writing-files-and-directories-to-the-home-filespace>

You are using installed.packages() in your code. As mentioned in the
notes of installed.packages() help page, this can be very slow.
Therefore do not use installed.packages().

You are using installed.packages():
"This needs to read several files per installed package, which will be
slow on Windows and on some network-mounted file systems. It will be
slow when thousands of packages are installed, so do not use it to find
out if a named package is installed (use find.package or system.file)
nor to find out if a package is usable (call requireNamespace or require
and check the return value) nor to find details of a small number of
packages (use packageDescription)." [installed.packages() help page]
For more details:
<https://contributor.r-project.org/cran-cookbook/code_issues.html#calling-installed.packages>
-> R/libordie.R
