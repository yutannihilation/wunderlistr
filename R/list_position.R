#' Positions API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/positions}
#'
#' @export
wndr_get_list_position <- function(id = NULL) {
  path <- "/api/v1/list_positions"

  wndr_api(verb = "GET",
           path = path)
}

#' @export
wndr_update_list_position <- function(id, values, revision) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/list_positions",
           id   = id,
           body = list(
             values = I(values),
             revision = revision
           ))
}
