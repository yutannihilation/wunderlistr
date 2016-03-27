# Utilities

#' @name wndr_api
#' @title Send request to Wunderlist API
#'
#' @export
wndr_api <- function(verb, path, ...) {
  res <- httr::VERB(verb = verb,
             url = "https://a.wunderlist.com/",
             config = httr::add_headers(
               `X-Client-ID` = wndr_key,
               `X-Access-Token` = wndr_access_token()
             ),
             path = path,
             ...,
             encode = "json")

  httr::stop_for_status(res)

  if (!httr::has_content(res)) return(NULL)

  # If the resonse is JSON format, parse it by ourselve with simplifying options.
  if (res$headers$`content-type` == "application/json") {
    body <- httr::content(res, as = "text", encoding = "UTF-8")
    jsonlite::fromJSON(body, simplifyVector = TRUE)
  } else {
    httr::content(res)
  }

}

build_path_with_id <- function(path, id) {
  if (!purrr::is_scalar_numeric(id) && !purrr::is_scalar_character(id)) {
    stop("id must be a single numeric or character")
  }

  paste(path, id, sep = "/")
}
