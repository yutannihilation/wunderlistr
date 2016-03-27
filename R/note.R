#' Note API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/note}
#'
#' @export
wndr_get_note <- function(id = NULL, task_id = NULL, list_id = NULL) {
  if (!is.null(id)) {
    wndr_api(verb = "GET",
             path = "/api/v1/notes",
             id = id)
  } else {
    query <- create_scalar_list(task_id = task_id,
                                list_id = list_id)
    wndr_api(verb = "GET",
             path = "/api/v1/notes",
             query = query)
  }
}

#' @export
wndr_create_note <- function(task_id, content) {
  wndr_api(verb = "POST",
           path = "/api/v1/notes",
           body = list(
             task_id = task_id,
             content = content
           ))
}

#' @export
wndr_update_note <- function(id, revision, content) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/notes",
           id   = id,
           body = list(
             revision = revision,
             content = content
           ))
}

#' @export
wndr_delete_note <- function(id, revision) {
  wndr_api(verb = "DELETE",
           path = "/api/v1/notes",
           id   = id,
           query = list(
             revision = revision
           ))
}
