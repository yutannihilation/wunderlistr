#' Membership API
#'
#' A Membership is the join model between Users and Lists.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/membership}
#' @name wndr_membership
#'
#' @param id Membership ID
#' @param list_id List ID
#' @param user_id User ID
#' @param email User email address
#' @param muted Whether or not muted
#' @param state Membership state. If set this to \code{"accepted"}, the membership is accepted
#' @param revision Revision
#'
#' @examples
#' \dontrun{
#' # get memberships
#' wndr_get_membership()
#'
#' # create a membership
#' l <- wndr_get_list()
#' m <- wndr_create_membership(list_id = l$id[2], user_id = 111111)
#'
#' # mark it as accepted
#' wndr_update_membership(id = m$id, revision = m$revision, state = "accepted")
#'
#' # delete the membership
#' wndr_delete_membership(id = m$id, revision = m$revision + 1)
#' }
#'
#' @export
wndr_get_membership <- function() {
  wndr_api(verb = "GET",
           path = "/api/v1/memberships")
}

#' @rdname wndr_membership
#' @export
wndr_create_membership <- function(list_id, user_id = NULL, email = NULL, muted = NULL) {
  body <- create_scalar_list(user_id  = user_id, email = email)
  body$list_id <- list_id
  body$muted <- muted

  wndr_api(verb = "POST",
           path = "/api/v1/memberships",
           body = body)
}

#' @rdname wndr_membership
#' @export
wndr_update_membership <- function(id, revision, state = "accepted", muted = NULL) {
  wndr_api(verb = "PATCH",
           path = "/api/v1/memberships",
           id   = id,
           body = list(
             revision = revision,
             state = state,
             muted = muted
           ))
}


#' @rdname wndr_membership
#' @export
wndr_delete_membership <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/memberships")

}
