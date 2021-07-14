#' helpers 
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd

REDIS <- redux::hiredis()

memo <- function (f) {
  name <- as.character(substitute(f))
  function(...) {
    args <- paste0(list(...), collapse = ",")
    key <- paste0(name, "-", args)
    cached <- REDIS$GET(key)
    if(not_null(cached)) {
      redux::bin_to_object(cached)
    } else {
      res <- f(...)
      future({REDIS$SET(key, redux::object_to_bin(res))})
      res
    }
  }
}