#' Task Comment API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/task_comment}
#'
#' @export
wndr_get_task_comment <- function(id = NULL, task_id = NULL, list_id = NULL) {
  if (!is.null(id)) {
    wndr_api(verb = "GET",
             path = "/api/v1/task_comments",
             id   = id)
  } else {
    query <- create_scalar_list(task_id = task_id,
                                list_id = list_id)
    wndr_api(verb = "GET",
             path = "/api/v1/task_comments",
             query = query)
  }
}

#' @export
wndr_create_task_comment <- function(task_id, text) {
  wndr_api(verb = "POST",
           path = "/api/v1/task_comments",
           body = list(
             task_id = task_id,
             text    = text
           ))
}
