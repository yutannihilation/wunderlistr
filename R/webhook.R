#' Webhook API
#'
#' A webhook sends notifications when a list is updated.
#'
#' @seealso \url{https://developer.wunderlist.com/documentation/endpoints/webhooks}
#' @name wndr_webhook
#'
#' @param id Webhook ID
#' @param list_id List ID
#' @param url Webhook URL
#' @param processor_type Type of processor.
#' @param configuration Configuration
#' @param revision Revision
#'
#' @export
wndr_get_webhook <- function(list_id) {
  wndr_api(verb = "GET",
           path = "/api/v1/webhooks",
           body = list(
             list_id = list_id
           ))
}

#' @rdname wndr_webhook
#' @export
wndr_create_webhook <- function(list_id, url, processor_type = "generic", configuration = "") {
  wndr_api(verb = "POST",
           path = "/api/v1/webhooks",
           body = list(
             list_id = list_id,
             url     = url,
             processor_type = processor_type,
             configuration = configuration
           ))
}

#' @rdname wndr_webhook
#' @export
wndr_delete_webhook <- function(id, revision) {
  wndr_delete_common(id, revision, "/api/v1/webhook")
}
