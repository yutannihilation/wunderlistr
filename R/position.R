#' Positions API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/positions}
#'
#' @export
wndr_get_list_position <- function(id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/list_positions",
           id   = id)
}

#' @export
wndr_update_list_position <- function(id, values, revision) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/list_positions",
           id   = id,
           body = list(
             values = I(values),
             revision = revision
           ))
}

#' @export
wndr_get_task_position <- function(id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/task_positions",
           id   = id)
}

#' @export
wndr_update_task_position <- function(id, values, revision) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/task_positions",
           id   = id,
           body = list(
             values = I(values),
             revision = revision
           ))
}

#' @export
wndr_get_subtask_position <- function(id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/subtask_positions",
           id   = id)
}

#' @export
wndr_update_subtask_position <- function(id, values, revision) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/subtask_positions",
           id   = id,
           body = list(
             values = I(values),
             revision = revision
           ))
}
