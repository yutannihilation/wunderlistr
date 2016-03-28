#' File Previews
#'
#' A file preview is an image thumbnail for a file.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/file_preview}
#' @name wndr_preview
#'
#' @param file_id File ID.
#' @param platform Platform. Possible values are: mac, web, windows, iphone, ipad, android.
#' @param size Size of screen. Possible values are: nonretina, retina
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
