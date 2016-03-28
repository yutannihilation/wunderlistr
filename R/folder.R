#' Folder API
#'
#' A list may or may not belong to a folder.
#'
#' @name wndr_folder
#'
#' @param id Folder ID
#' @param list_ids List IDs
#' @param title Folder name
#' @param revision Revision
#'
#' @examples
#' \dontrun{
#' # get all folders
#' wndr_get_folder()
#'
#' # get a folder
#' wndr_get_folder(id = 1111)
#'
#' # create a folder
#' l <- wndr_get_list()
#' f <- wndr_create_folder(title = "test", list_ids = l$id[1:3])
#'
#' # update the folder
#' wndr_update_folder(id = f$id, revision = f$revision, list_ids = l$id[2:3])
#'
#' # delete the folder
#' wndr_delete_folder(id = f$id, revision = f$revision)
#' }
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/folder}
#'
#' @export
wndr_get_folder <- function(id = NULL) {
  wndr_api(verb = "GET",
           path = "/api/v1/folders",
           id   = id)
}

#' @rdname wndr_folder
#' @export
wndr_create_folder <- function(title, list_ids) {
  wndr_api(verb = "POST",
           path = "/api/v1/folders",
           body = list(
             title = title,
             list_ids = I(list_ids)
           ))
}

#' @rdname wndr_folder
#' @export
wndr_update_folder <- function(id, revision, title = NULL, list_ids = NULL) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/folders",
           id   = id,
           body = list(
             title = title,
             list_ids = I(list_ids)
           ))
}

#' @rdname wndr_folder
#' @export
wndr_delete_folder <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/folders")
}
