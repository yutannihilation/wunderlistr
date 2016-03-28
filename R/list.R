#' List API
#'
#' All tasks created in Wunderlist belong to a list.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/list}
#' @name wndr_list
#'
#' @param id List id
#' @param title List title
#' @param revision List revision
#' @param public Whether or not the list is public
#'
#' @examples
#' \dontrun{
#' # get all lists
#' wndr_get_list()
#'
#' # get a list
#' wndr_get_list(id = 1111)
#'
#' # create a list
#' l <- wndr_create_list("test")
#'
#' # update the list
#' wndr_update_list(id = l$id, revision = l$revision, title = "Test")
#'
#' # make the list public
#' wndr_update_list(id = l$id, revision = l$revision, public = TRUE)
#'
#' # delete the list
#' l <- wndr_get_list(id = l$id)
#' wndr_delete_list(id = l$id, revision = l$revision + 2)
#' }
#'
#' @export
wndr_get_list <- function(id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/lists",
           id   = id)
}

#' @rdname wndr_list
#' @export
wndr_create_list <- function(title) {
  wndr_api(verb = "POST",
           path = "/api/v1/lists",
           body = list(
             title = title
           ))
}

#' @rdname wndr_list
#' @export
wndr_update_list <- function(id, revision, title = NULL, public = NULL) {
  body <- create_scalar_list(title  = title, public = public)
  body$revision <- revision

  wndr_api(verb = "PATCH",
           path = "/api/v1/lists",
           id = id,
           body = body)
}

#' @rdname wndr_list
#' @export
wndr_delete_list <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/lists")
}
