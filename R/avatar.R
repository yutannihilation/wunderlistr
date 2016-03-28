#' Avatar API
#'
#' User avatars of different sizes can be fetched or loaded inline in HTML.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/avatar}
#'
#' @param user_id User ID.
#' @param size Image size. Possible values are 25, 28, 30, 32, 50, 54, 56, 60, 64, 108, 128, 135, 256, 270, 512.
#' @param fallback If \code{FALSE}, no content will be returned when there is no custom avatar uploaded for the given \code{user_id}.
#' @return matrix, the parsed result of response PNG image.
#' @examples
#' \dontrun{
#'   x <- wndr_get_avatar(1, 128, fallback = TRUE)
#'   plot(as.raster(x))
#' }
#' @export
wndr_get_avatar <- function(user_id, size = c(25, 28, 30, 32, 50, 54, 56, 60, 64, 108, 128, 135, 256, 270, 512), fallback = TRUE) {
  size <- match.arg(size)

  wndr_api(verb = "GET",
           path = "/api/v1/avatar",
           query = list(
             user_id = user_id,
             size = size,
             fallback = FALSE
           ))
}
