#' Task Comment API
#'
#' A task_comment is a comment that belongs to a task.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/task_comment}
#' @name wndr_task_comment
#'
#' @param id Comment ID
#' @param task_id Task ID
#' @param list_id List ID
#' @param text Text
#'
#' @examples
#' \dontrun{
#' # get task comments
#' l <- wndr_get_list()
#' c <- wndr_get_task_comment(list_id = l$id[1])
#'
#' # create a task comment
#' t <- wndr_get_task(list_id = l$id[1])
#' wndr_create_task_comment(task_id = t$id[1], text = "test")
#' }
#'
#' @export
wndr_get_task_comment <- function(id = NULL, task_id = NULL, list_id = NULL) {
  wndr_get_by_id_or_list_or_task(id, task_id, list_id, "/api/v1/task_comments")
}

#' @rdname wndr_task_comment
#' @export
wndr_create_task_comment <- function(task_id, text) {
  wndr_api(verb = "POST",
           path = "/api/v1/task_comments",
           body = list(
             task_id = task_id,
             text    = text
           ))
}
