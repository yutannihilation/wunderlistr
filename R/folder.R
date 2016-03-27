#' Folder API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/folder}
#'
#' @export
wndr_get_folder <- function(id = NULL) {
  path <- "/api/v1/folders"

  if (!is.null(id)) path <- build_path_with_id(path, id)

  wndr_api(verb = "GET",
           path = path)
}


#' FIXME: multiple list_ids won't work
#' @export
wndr_create_folder <- function(title, list_ids) {
  wndr_api(verb = "POST",
           path = "/api/v1/folders",
           body = list(
             title = title,
             list_ids = I(list_ids)
           ))
}

#' @export
wndr_update_folder <- function(id, revision, title = NULL, list_ids = NULL) {
  wndr_api(verb = "PATCH",
           path = build_path_with_id("/api/v1/folders", id),
           body = list(
             title = title,
             list_ids = I(list_ids)
           ))
}

#' @export
wndr_delete_folder <- function(id, revision) {
  path <- build_path_with_id("/api/v1/folders", id)

  wndr_api(verb = "DELETE",
           path = path,
           query = list(
             revision = revision
           ))
}
