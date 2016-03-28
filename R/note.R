#' Note API
#'
#' A note is a large text blobs belonging to tasks.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/note}
#' @name wndr_note
#'
#' @param id Note ID
#' @param task_id Task ID
#' @param list_id List ID
#' @param content Note content
#' @param revision Revision
#'
#' @details
#' When you use \code{wndr_get_note}, you have to specify either one of \code{id}, \code{task_id}, \code{list_id}.
#'
#' @examples
#' \dontrun{
#' # get notes
#' l <- wndr_get_list()
#' wndr_get_note(list_id = l$id[2])
#'
#' # create a note
#' t <- wndr_get_task(list_id = l$id[2])
#' n <- wndr_create_note(task_id = t$id[1], content = "test")
#'
#' # update the note
#' wndr_update_note(id = n$id, revision = n$revision, content = "Test")
#'
#' # delete the note
#' n <- wndr_get_note(id = n$id)
#' wndr_delete_note(id = n$id, revision = n$revision)
#' }
#'
#' @export
wndr_get_note <- function(id = NULL, task_id = NULL, list_id = NULL) {
  wndr_get_by_id_or_list_or_task(id, task_id, list_id, "/api/v1/notes")
}

#' @rdname wndr_note
#' @export
wndr_create_note <- function(task_id, content) {
  wndr_api(verb = "POST",
           path = "/api/v1/notes",
           body = list(
             task_id = task_id,
             content = content
           ))
}

#' @rdname wndr_note
#' @export
wndr_update_note <- function(id, revision, content) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/notes",
           id   = id,
           body = list(
             revision = revision,
             content = content
           ))
}

#' @rdname wndr_note
#' @export
wndr_delete_note <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/notes")
}
