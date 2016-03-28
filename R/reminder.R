#' Reminder API
#'
#' The reminder for a task.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/reminder}
#' @name wndr_reminder
#'
#' @param id Reminder ID
#' @param task_id Task ID
#' @param list_id List ID
#' @param date Timestamp when to remind.
#' @param created_by_device_udid Device UDID, which is used for push notification.
#' @param revision Revision
#'
#' @examples
#' \dontrun{
#' # get reminders
#' l <- wndr_get_list()
#' r <- wndr_get_reminder(list_id = l$id[1])
#'
#' # create a reminder
#' t <- wndr_get_task(list_id = l$id[1])
#' r <- wndr_create_reminder(task_id = t$id[1], date = Sys.time() + 3600)
#'
#' # update the reminder
#' r <- wndr_update_reminder(id = r$id, revision = r$revision, date = Sys.time() + 3600 * 24)
#'
#' # delete the reminder
#' wndr_delete_reminder(id = r$id, revision = r$revision)
#' }
#'
#' @export
wndr_get_reminder <- function(task_id = NULL, list_id  = NULL) {
  query <- create_scalar_list(task_id = task_id,
                              list_id = list_id)
  wndr_api(verb = "GET",
           path = "/api/v1/reminders",
           query = query)
}

#' @rdname wndr_reminder
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

#' @rdname wndr_reminder
#' @export
wndr_update_reminder <- function(id, revision, date) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/reminders",
           id = id,
           body = list(
             revision = revision,
             date     = date
           ))
}

#' @rdname wndr_reminder
#' @export
wndr_delete_reminder <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/reminders")
}
