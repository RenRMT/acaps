#' Get an API token for your account
#'
#' This function is used to retrieve an API authentication token for your account
#' from the ACAPS API. A valid authentication token (and by extension an account)
#' is required in order to use the ACAPS API.
#'
#' @param username Your ACAPS account username (usually an e-mail address).
#' @param password Your ACAPS account password.
#'
#' @return This returns your API authentication token as character string.
#' @export
#'
get_token <- function(username, password) {
  credentials <- list(username = username, password = password)

  auth_token_response <- httr::POST("https://api.acaps.org/api/v1/token-auth/", body = credentials)
  if (httr::http_type(auth_token_response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  auth_token <- parse_response(auth_token_response)$token
}
