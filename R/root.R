#' Root API
#'
#' Root is the top-level entity in the sync hierarchy.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/root}
#' @name wndr_root
#'
#' @export
wndr_get_root <- function() {
  wndr_api(verb = "GET",
           path = "/api/v1/root")
}
