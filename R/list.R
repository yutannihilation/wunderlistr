#' List API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/list}
#'
#' @param id List id
#' @param title List title
#' @param revision list revision
#' @export
wndr_get_list <- function(id = NULL) {
  path <- "/api/v1/lists"

  if (!is.null(id)) path <- build_path_with_id(path, id)

  wndr_api(verb = "GET",
           path = path)
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
wndr_update_list <- function(id, revision, title) {
  path <- build_path_with_id("/api/v1/lists", id)

  wndr_api(verb = "PATCH",
           path = path,
           body = list(
             revision = revision,
             title = title
           ))
}

#' @export
wndr_delete_list <- function(id, revision) {
  path <- build_path_with_id("/api/v1/lists", id)

  wndr_api(verb = "DELETE",
           path = path,
           query = list(
             revision = revision
           ))
}
