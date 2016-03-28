#' Positions API
#'
#' A list of ordered, unique integers related to a users's lists or a list's tasks or a task's subtasks.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/positions}
#' @name wndr_position
#'
#' @param id Position ID
#' @param values Positions
#' @param revision Revision
#'
#' @examples
#' \dontrun{
#' # get all list positions
#' p <- wndr_get_list_position()
#'
#' # get a list position
#' wndr_get_list_position(id = 1111)
#'
#' # update the list position
#' wndr_update_list_position(id = p$id[1], values = rev(p$values[[1]]), revision = p$revision[1])
#' }
#'
#' @export
wndr_get_list_position <- function(id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/list_positions",
           id   = id)
}

#' @rdname wndr_position
#' @export
wndr_update_list_position <- function(id, revision, values) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/list_positions",
           id   = id,
           body = list(
             values = I(values),
             revision = revision
           ))
}

#' @rdname wndr_position
#' @export
wndr_get_task_position <- function(id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/task_positions",
           id   = id)
}

#' @rdname wndr_position
#' @export
wndr_update_task_position <- function(id, revision, values) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/task_positions",
           id   = id,
           body = list(
             values = I(values),
             revision = revision
           ))
}

#' @rdname wndr_position
#' @export
wndr_get_subtask_position <- function(id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/subtask_positions",
           id   = id)
}

#' @rdname wndr_position
#' @export
wndr_update_subtask_position <- function(id, revision, values) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/subtask_positions",
           id   = id,
           body = list(
             values = I(values),
             revision = revision
           ))
}
