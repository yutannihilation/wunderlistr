#' Root API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/root}
#'
#' @export
wndr_get_root <- function() {
  wndr_api(verb = "GET",
           path = "/api/v1/root")
}
