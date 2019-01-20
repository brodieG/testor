#' @include options.R
#' @include global.R

NULL

.loaded <- FALSE
.onLoad <- function(libname, pkgname) {
  # nocov start
  options(
    .unitizer.opts.default[
      setdiff(names(.unitizer.opts.default), names(options()))
    ]
  )
  .loaded <<- TRUE
  # nocov end
}
.onUnload <- function(libpath) {
}
.onAttach <- function(libname, pkgname) {
  if(is.null(getOption('unitizer.state'))) {
    packageStartupMessage(
      "~~~~\n",
      "State tracking is disabled by default to comply with CRAN policies. ",
      "Add `options(unitizer.state='recommended')` to your 'Rprofile' file ",
      "to enable, or `options(unitizer.state='off')` to quash this message ",
      "without enabling.  See `?unitizerState` for details.",
      "\n~~~~"
    )
  }
  if(is.null(getOption('unitizer.diff.fun'))) {
    packageStartupMessage(
      "~~~~\n",
      "For an improved experience run:\n\n",
      "\tif(!require(diffobj)) install.packages('diffobj')\n",
      "\toptions(unitizer.diff.fun=diffobj::diffPrint)\n\n",
      "or simply `options(unitizer.diff.fun=all.equal)` to suppress ",
      "this message.",
      "\n~~~~"
    )
  }
}
