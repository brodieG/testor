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
      "State tracking is disabled by default to comply with CRAN policies. ",
      "Add `options(unitizer.state='recommended')` to your 'Rprofile' file ",
      "to enable, or `options(unitizer.state='off')` to quash this message ",
      "without enabling.  See `?unitizerState` for details."
    )
  }
  if(is.null(getOption('unitizer.diff.fun'))) {
    packageStartupMessage(
      "For an improved experience run:\n\n",
      "if(!require(diffobj)) install.packages('diffobj')\n",
      "options(unitizer.diff.fun=diffobj::diffobj)\n\n",
      "or simply `options(unitizer.diff.fun=unitizer::diff)` to suppress "
      "this message."
    )
  }

}
