#' File API
#'
#' A task may contain files.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/file}
#'
#' @name wndr_file
#'
#' @param id File ID
#' @param task_id Task ID
#' @param list_id List ID
#' @param filepath Path to a local file you want to upload.
#' @param local_created_at Date used to sort the files and comments in the right order
#' @param revision Revision
#'
#' @examples
#' \dontrun{
#' # get files
#' l <- wndr_get_list()
#' wndr_get_file(list_id = l$id[1])
#'
#' # attach a file to some task
#' t <- wndr_get_task(list_id = l$id[1])
#' f <- wndr_create_file(task_id = t$id[1], filepath = "/path/to/file")
#'
#' # delete the file
#' wndr_delete_file(id = f$id, revision = f$revision)
#' }
#'
#' @details
#' When you use \code{wndr_get_file}, you have to specify either one of \code{id}, \code{task_id}, \code{list_id}.
#'
#' @export
wndr_get_file <- function(id = NULL, task_id = NULL, list_id = NULL) {
  wndr_get_by_id_or_list_or_task(id, task_id, list_id, "/api/v1/files")
}

#' @rdname wndr_file
#' @export
wndr_create_file <- function(task_id, filepath, local_created_at = NULL) {
  upload_info <- wndr_upload(filepath)
  message(sprintf("file is successfully uploaded as ID %s", upload_info$id))

  if(!is.null(local_created_at) && any(class(local_created_at) == "POSIXt")) {
    local_created_at <- strftime(local_created_at, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  }

  wndr_api(verb = "POST",
           path = "/api/v1/files",
           body = list(
             upload_id = upload_info$id,
             task_id = task_id,
             local_created_at = local_created_at
           ))
}

#' @rdname wndr_file
#' @export
wndr_delete_file <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/files")
}
