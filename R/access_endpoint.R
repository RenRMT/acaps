#' Access an ACAPS API endpoint
#'
#' @param endpoint_url The API endpoint to be accessed.
#' @param token Your authentication token. If left empty, the environment variable
#' created with `set_env_token()` will be used.
#' @param ... Additional parameters to be passed along with the API request.
#'
#' @return The function return a response object.
#' @export
#'
access_endpoint <- function(endpoint_url, token = .token(), ...) {
  ua <- httr::user_agent("https://github.com/RenRMT/acaps")

  response <- httr::GET(endpoint_url,
    httr::add_headers(Authorization = paste("Token", token, sep = " ")),
    query = list(...),
    ua
  )

  if (httr::http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  response
}
