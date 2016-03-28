#' Subtask API
#'
#' Subtasks are children of tasks.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/subtask}
#' @name wndr_subtask
#'
#' @param id Subtask ID
#' @param task_id Task ID
#' @param list_id List ID
#' @param completed Whether the subtask is completed or not
#' @param title Subtask title
#' @param revision Revision
#'
#' @examples
#' \dontrun{
#' # get subtasks
#' l <- wndr_get_list()
#' s <- wndr_get_subtask(list_id = l$id[1])
#'
#' # create a subtask
#' t <- wndr_get_task(list_id = l$id[1])
#' s <- wndr_create_subtask(task_id = t$id[1], title = "test")
#'
#' # update the subtask
#' s <- wndr_update_subtask(id = s$id, revision = s$revision, completed = TRUE)
#'
#' # Delete the subtask
#' wndr_delete_subtask(id = s$id, revision = s$revision)
#' }
#'
#' @export
wndr_get_subtask <- function(id = NULL, task_id = NULL, list_id  = NULL, completed = NULL) {
  # complete parameter seems not working?
  wndr_get_by_id_or_list_or_task(id, task_id, list_id, "/api/v1/subtasks", completed = completed)
}

#' @rdname wndr_subtask
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

#' @rdname wndr_subtask
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

#' @rdname wndr_subtask
#' @export
wndr_delete_subtask <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/subtasks")
}
