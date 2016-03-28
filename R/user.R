#' User API
#'
#' All info related to the currently signed in user.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/user}
#'
#' @param list_id List ID
#'
#' @export
wndr_get_user <- function(list_id = NULL) {
  if(is.null(list_id)) {
    wndr_api(verb = "GET",
             path = "/api/v1/user")

  } else {
    wndr_api(verb = "GET",
             path = "/api/v1/users",
             body = list(
               list_id = list_id
             ))

  }
}
