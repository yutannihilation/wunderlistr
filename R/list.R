#' List API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/list}
#'
#' @param id List id
#' @param title List title
#' @param revision list revision
#' @export
wndr_get_list <- function(id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/lists",
           id   = id)
}

#' @export
wndr_create_list <- function(title) {
  path <- "/api/v1/lists"

  wndr_api(verb = "POST",
           path = path,
           body = list(
             title = title
           ))
}

#' @export
wndr_update_list <- function(id, revision, title = NULL, public = NULL) {
  body <- create_scalar_list(title  = title, public = public)
  body$revision <- revision

  wndr_api(verb = "PATCH",
           path = "/api/v1/lists",
           id = id,
           body = body)
}

#' @export
wndr_delete_list <- function(id, revision) {
  wndr_api(verb = "DELETE",
           path = "/api/v1/lists",
           id   = id,
           query = list(
             revision = revision
           ))
}
