#' Get ACAPS Yemen monitoring dataset
#'
#' A specialized function to call the ACAPS Yemen Monitoring group of endpoints.
#'
#' @param endpoint Specific endpoint to access. There is one (optional) endpoint: 'indicators'
#' @param token Your authentication token. If left empty, the environment variable
#' created with `set_env_token()` will be used.
#' @param ... Additional parameters to be passed along with the API request. Parameters
#' must be provided as name-value pairs.
#'
#' @return The requested dataset is returned as an R dataframe.
#' @export
get_dataset_yemen <- function(endpoint = NULL, token = .token(), ...) {

  endpoint_group <- "yemen-monitoring/"
  endpoint <- if (!is.null(endpoint)) paste0(endpoint, "/")

  endpoint_url <- paste0(base_url, endpoint_group, endpoint)
  get_dataset(endpoint_url, token, ...)
}
