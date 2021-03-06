% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auth.R
\name{wndr_access_token}
\alias{wndr_access_token}
\title{OAuth settings for Wunderlist API}
\usage{
wndr_access_token(cache_as_envvar = TRUE,
  cache_as_file = getOption("httr_oauth_cache"))
}
\arguments{
\item{cache_as_envvar}{If \code{TRUE}, store the token as the environmental variable \code{WUNDERLIST_TOKEN}.}

\item{cache_as_file}{If \code{TRUE}, save the token to the local file \code{.httr-oauth}.}
}
\description{
Get an OAuth2.0 access token.
}
\seealso{
\link[httr]{oauth2.0_token}
}

