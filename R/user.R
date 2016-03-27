#' User API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/user}
#'
#' @export
wndr_get_user <- function() {
  wndr_api(verb = "GET",
           path = "/api/v1/user")
}

#' @export
wndr_get_users <- function(list_id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/users",
           body = list(
             list_id = list_id
           ))
}
