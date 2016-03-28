#' File API
#'
#' A task may contain files.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/file}
#'
#' @param id File ID
#' @param task_id Task ID
#' @param list_id List ID
#' @details
#' When you use \code{wndr_get_file}, you have to specify either one of \code{id}, \code{task_id}, \code{list_id}.
#'
#' @export
wndr_get_file <- function(id = NULL, task_id = NULL, list_id = NULL) {
  query <- create_scalar_list(id = NULL,
                              task_id = task_id,
                              list_id = list_id)

  if (!is.null(id)) {
    wndr_api(verb = "GET",
             path = "/api/v1/files",
             id   = id)
  } else {
    wndr_api(verb = "GET",
             path = "/api/v1/files",
             query = query)
  }
}

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

#' @export
wndr_delete_file <- function(id, revision) {
    wndr_api(verb = "DELETE",
             path = "/api/v1/files",
             id   = id,
             query = list(
               revision = revision
             ))
}
