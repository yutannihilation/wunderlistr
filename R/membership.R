#' Membership API
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/membership}
#'
#' @export
wndr_get_membership <- function() {
  wndr_api(verb = "GET",
           path = "/api/v1/memberships")
}

#' @export
wndr_create_membership <- function(list_id, user_id = NULL, email = NULL, muted = NULL) {
  body <- create_scalar_list(user_id  = user_id, email = email)
  body$muted <- muted

  wndr_api(verb = "POST",
           path = "/api/v1/memberships",
           body = body)
}

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


#' @export
wndr_delete_membership <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/memberships")

}
