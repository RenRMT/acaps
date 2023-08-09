#' Retrieving and storing an API token for your account.
#'
#' Retrieve an API authentication token for your account from the ACAPS API.
#' A valid authentication token (and by extension an account) is required in order to use the ACAPS API.
#' Storing the token as an environment variable allows the package functions to access your authentication token
#' without putting the token value itself in scripts. All functions that require a
#' token will look for this environment variable by default if no token value is provided manually.
#'
#' @param username Your ACAPS account username (usually an e-mail address).
#' @param password Your ACAPS account password.
#' @param token Your ACAPS authentication token
#' @param silent_overwrite If set to TRUE, function will always overwrite existing value. If FALSE,
#' will prompt the user if they want to overwrite the existing value.
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

#' @rdname get_token
set_env_token <- function(token, silent_overwrite = FALSE) {
  old_token <- Sys.getenv("ACAPS_TOKEN")
  if (!identical(old_token, "") & !silent_overwrite) {
    choice <- menu(c("Yes", "No"), title = "ACAPS_TOKEN environment variable already exists. Overwrite?")
    if (choice != 1) {
      return()
    }
  }
  Sys.setenv(ACAPS_TOKEN = token)
}
