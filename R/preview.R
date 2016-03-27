#' File Previews
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/file_preview}
#'
#' @export
wndr_get_preview <- function(file_id, platform = NULL, size = NULL) {
  wndr_api(verb = "DELETE",
           path = "/api/v1/previews",
           query = list(
             file_id = file_id,
             platform = platform,
             size = size
           ))
}
