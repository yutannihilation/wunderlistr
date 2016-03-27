#' File API
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/file}
#'
#' @param id File ID
#' @param task_id Task ID
#' @param list_id List ID
#' @export
wndr_get_file <- function(id = NULL, task_id = NULL, list_id = NULL) {
  query <- create_scalar_list(id = id,
                              task_id = task_id,
                              list_id = list_id)

  if (names(query) == "id") {
    wndr_api(verb = "GET",
             path = build_path_with_id("/api/v1/files", query$id))
  } else {
    wndr_api(verb = "GET",
             path = "/api/v1/files",
             query = query)
  }
}

#' @export
wndr_create_file <- function(upload_id, task_id, local_created_at = NULL) {
  if(!is.null(local_created_at) && any(class(local_created_at) == "POSIXt")) {
    local_created_at <- strftime(local_created_at, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  }

  wndr_api(verb = "POST",
           path = "/api/v1/files",
           body = list(
             upload_id = upload_id,
             task_id = task_id,
             local_created_at = local_created_at
           ))
}

#' @export
wndr_delete_file <- function(id, revision) {
    path <- build_path_with_id("/api/v1/files", id)

    wndr_api(verb = "DELETE",
             path = path,
             query = list(
               revision = revision
             ))
}
