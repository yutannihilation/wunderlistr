#' Folder API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/folder}
#'
#' @export
wndr_get_folder <- function(id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/folders",
           id   = id)
}


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
           path = "/api/v1/folders",
           id   = id,
           body = list(
             title = title,
             list_ids = I(list_ids)
           ))
}

#' @export
wndr_delete_folder <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/folders")
}
