#' Subtask API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/subtask}
#'
#' @export
wndr_get_subtask <- function(id = NULL, task_id = NULL, list_id  = NULL, completed = NULL) {
  if (!is.null(id)) {
    wndr_api(verb = "GET",
             path = "/api/v1/subtasks",
             id   = id)
  } else {
    query <- create_scalar_list(task_id = task_id,
                                list_id = list_id)
    query$completed <- completed
    wndr_api(verb = "GET",
             path = "/api/v1/subtasks",
             query = query)
  }
}

#' @export
wndr_create_subtask <- function(task_id, title, completed = NULL) {
  wndr_api(verb = "POST",
           path = "/api/v1/subtasks",
           body = list(
             task_id = task_id,
             title   = title,
             completed = completed
           ))
}

#' @export
wndr_update_subtask <- function(id, revision, title = NULL, completed = NULL) {
  if(is.null(title) && is.null(completed)) stop("Please specify one or both of title and completed.")

  wndr_api(verb = "PATCH",
           path = "/api/v1/subtasks",
           id   = id,
           body = list(
             revision = revision,
             title    = title,
             completed = completed
           ))
}


#' @export
wndr_delete_subtask <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/subtasks")
}
