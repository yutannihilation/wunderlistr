#' Task API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/task}
#'
#' @export
wndr_get_task <- function(id = NULL, list_id = NULL, completed = NULL) {
  if (!is.null(id)) {
    wndr_api(verb = "GET",
             path = "/api/v1/tasks",
             id   = id)
  } else {
    query <- create_scalar_list(list_id = list_id)
    query$completed <- completed

    wndr_api(verb = "GET",
             path = "/api/v1/tasks",
             query = query)
  }
}

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

#' @export
wndr_delete_task <- function(id, revision) {
  wndr_api(verb = "DELETE",
           path = "/api/v1/tasks",
           id   = id,
           query = list(
             revision = revision
           ))
}
