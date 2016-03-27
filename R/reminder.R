#' Reminder API
#'
#' @seealso
#'
#' @export
wndr_get_reminder <- function(task_id = NULL, list_id  = NULL) {
  query <- create_scalar_list(task_id = task_id,
                              list_id = list_id)
  wndr_api(verb = "GET",
           path = "/api/v1/reminders",
           query = query)
}

#' @export
wndr_create_reminder <- function(task_id, date, created_by_device_udid = NULL) {
  if(any(class(date) == "POSIXt")) {
    date <- strftime(date, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  }

  wndr_api(verb = "POST",
           path = "/api/v1/reminders",
           body = list(
             task_id = task_id,
             date    = date,
             created_by_device_udid = created_by_device_udid
           ))
}


#' @export
wndr_update_reminder <- function(id, date, revision) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/reminders",
           body = list(
             revision = revision,
             date     = date
           ))
}

#' @export
wndr_delete_reminder <- function(id, revision) {
  wndr_api(verb = "DELETE",
           path = "/api/v1/reminders",
           id   = id,
           query = list(
             revision = revision
           ))
}
