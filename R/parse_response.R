#' Parses the content of an API response
#'
#' @param response The response object returned by the API.
#'
#' @return The function returns the JSON response parsed as an R object
#' @export
#'
parse_response = function(response) {
  results = jsonlite::fromJSON(httr::content(response, as = "text", encoding = "utf8"))

  if (httr::http_error(response)) {
    stop(
      sprintf(
        "ACAPS API request failed [%s]\n%s",
        httr::status_code(response),
        results$detail
      ),
      call. = FALSE
    )
  }
  results
}
