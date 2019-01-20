# setMethod(
#   "diffObj", c("conditionList", "conditionList"),
#   function(target, current, ...) {
#     dots <- match.call(expand.dots=FALSE)[["..."]]
#     if("mode" %in% names(dots))
#       callNextMethod()
#     else
#       callNextMethod(target=target, current=current, ..., mode="unified")
#   }
# )

eval_diff <- function(element, diff.fun, obj) {
  make_cont <- function(x) {
    res <- if(identical(element, "value")) {
      as.name(x)
    } else call("$", as.name(toupper(x)), as.name(element))
  }
  eval.env <- list2env(list(.REF=list(), .NEW=list()))
  diff.call <- quote(diff.fun(NULL, NULL))
  ref.call <- make_cont(".ref")
  new.call <- make_cont(".new")
  eval(call("<-", ref.call, obj@.ref), envir=eval.env)
  eval(call("<-", new.call, obj@.new), envir=eval.env)
  diff.call[[2L]] <- ref.call
  diff.call[[3L]] <- new.call
  try(eval(diff.call, envir=eval.env))
}
