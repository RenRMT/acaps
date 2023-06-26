#' Get an ACAPS dataset
#'
#' A general high level function to retrieve the data provided by the ACAPS API
#' endpoint. Additional parameters can be specified with the request. The resulting
#' R dataframe is 'flattened', meaning that fields containing multiple values are converted
#' to a single string.
#'
#' @param endpoint_url The API endpoint for the data you want to retrieve.
#' @param token Your authentication token. If left empty, the environment variable
#' created with `set_env_token()` will be used.
#' @param ... Additional parameters to be passed along with the API request. Parameters
#' must be provided as name-value pairs.
#'
#' @return returns the requested data as an R dataframe.
#' @export
#'
get_dataset <- function(endpoint_url, token = .token(), ...) {
  response <- access_endpoint(endpoint_url, token, ...)

  results <- parse_response(response)

  out <- results$results

  while (!is.null(results$`next`)) {
    response <- access_endpoint(results$`next`, token, ...)
    results <- parse_response(response)
    out <- rbind(out, results$results)
  }

  out <- .list2string(out)

  out
}
