#' Task API
#'
#' Tasks are children of lists.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/task}
#' @name wndr_task
#'
#' @param id Task ID
#' @param list_id List ID.
#' @param completed Whether the task is completed or not.
#' @param title Task title.
#' @param assignee_id User ID.
#' @param recurrence_type Type of reccurence. Possible values are: "day", "week", "month", "year".
#' @param reccurence_count Count of reccurence.
#' @param due_date Due date.
#' @param starred Whether the task is starred or not.
#' @param remove Array of attributes to delete from the task, e.g. \code{"due_date"}.
#' @param revision Revision.
#'
#' @examples
#' \dontrun{
#' # get tasks
#' l <- wndr_get_list()
#' t <- wndr_get_task(list_id = l$id[1])
#'
#' # create a task
#' t <- wndr_create_task(list_id = l$id[2], title = "test")
#'
#' # create a recurrence task
#' wndr_create_task(list_id = l$id[2], title = "test", recurrence_type = "week", recurrence_count = 1, due_date = Sys.Date())
#'
#' # update the task
#' t <- wndr_update_task(id = t$id, revision = t$revision, completed = TRUE)
#'
#' # delete the task
#' wndr_delete_task(id = t$id, revision = t$revision)
#' }
#'
#' @export
wndr_get_task <- function(id = NULL, list_id = NULL, completed = NULL) {
  query <- create_scalar_list(id      = id,
                              list_id = list_id)
  query$completed <- completed

  if (!is.null(id)) {
    wndr_api(verb = "GET",
             path = "/api/v1/tasks",
             id   = id)
  } else {
    wndr_api(verb = "GET",
             path = "/api/v1/tasks",
             query = query)
  }
}

#' @rdname wndr_task
#' @export
wndr_create_task <- function(list_id, title, assignee_id = NULL, completed = FALSE,
                             recurrence_type = c("day", "week", "month", "year"), recurrence_count = NULL,
                             due_date = NULL, starred = NULL) {

  if (is.null(recurrence_count)) recurrence_type <- NULL

  if(!is.null(due_date) && any(class(due_date) == "POSIXt")) {
    due_date <- strftime(due_date, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  }

  wndr_api(verb = "POST",
           path = "/api/v1/tasks",
           body = list(
             list_id = list_id,
             title   = title,
             assignee_id = assignee_id,
             completed = completed,
             recurrence_type = recurrence_type,
             recurrence_count = recurrence_count,
             due_date = due_date,
             starred = starred
           ))

}


#' @rdname wndr_task
#' @export
wndr_update_task <- function(id, revision, title = NULL, assignee_id = NULL, completed = NULL,
                             recurrence_type = c("day", "week", "month", "year"), recurrence_count = NULL,
                             due_date = NULL, starred = NULL, remove = NULL) {

  if (is.null(recurrence_count)) recurrence_type <- NULL

  if(!is.null(due_date) && any(class(due_date) == "POSIXt")) {
    due_date <- strftime(due_date, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  }

  wndr_api(verb = "PATCH",
           path = "/api/v1/tasks",
           id   = id,
           body = list(
             revision = revision,
             title    = title,
             assignee_id = assignee_id,
             completed = completed,
             recurrence_type = recurrence_type,
             recurrence_count = recurrence_count,
             due_date = due_date,
             starred  = starred,
             remove   = I(remove)
           ))

}

#' @rdname wndr_task
#' @export
wndr_delete_task <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/tasks")
}
