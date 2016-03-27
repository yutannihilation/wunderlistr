#' OAuth settings for Wunderlist API
#'
#' @param cache_as_envvar If \code{TRUE}, store the token as the environmental variable \code{WUNDERLIST_TOKEN}.
#' @param cache_as_file If \code{TRUE}, save the token to the local file \code{.httr-oauth}.
#' @seealso \link[httr]{oauth2.0_token}
#' @export
wndr_access_token <- function(cache_as_envvar = TRUE, cache_as_file = getOption("httr_oauth_cache")) {
  token <- Sys.getenv("WUNDERLIST_TOKEN")
  if(token != "") return(token)

  wndr_endpoint <- httr::oauth_endpoint(authorize = "https://www.wunderlist.com/oauth/authorize",
                                        access = "https://www.wunderlist.com/oauth/access_token")

  # wndr_key and wndr_secret are included in R/sysdata.rda
  wndr_app <- httr::oauth_app("wunderlist", wndr_key, wndr_secret)

  token <- httr::oauth2.0_token(wndr_endpoint, wndr_app, cache = cache_as_file)

  access_token <- token$credentials$access_token
  if(!is.null(access_token) && cache_as_envvar) Sys.setenv("WUNDERLIST_TOKEN" = access_token)
  access_token
}
