#' Avatar API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/avatar}
#' @return matrix, the parsed result of response PNG image.
#' @examples
#' \dontrun{
#'   x <- wndr_get_avatar(1, 128, fallback = TRUE)
#'   plot(as.raster(x))
#' }
#' @export
wndr_get_avatar <- function(user_id, size, fallback = FALSE) {
  wndr_api(verb = "GET",
           path = "/api/v1/avatar",
           query = list(
             user_id = user_id,
             size = size,
             fallback = FALSE
           ))
}
