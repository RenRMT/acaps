#' Get ACAPS Crises Dataset
#'
#' Specialized R function for calls to the ACAPS Crises group of endpoints.
#'
#' @param endpoint The API endpoint to request. One specification is available: 'crisis-activation-log'.
#' If left blank, the function will call the general ACAPS crises endpoint.
#' @param token Your authentication token. If left empty, the environment variable
#' created with `set_env_token()` will be used.
#' @param ... Additional parameters to be passed along with the API request. Parameters
#' must be provided as name-value pairs.
#'
#' @return The requested dataset is returned as an R dataframe.
#' @export
#'
get_dataset_crises <- function(endpoint = NULL, token = .token(), ...) {
  valid <- c("crisis-activation-log")
  if (all(!is.null(endpoint), !endpoint %in% valid)) stop(paste0("Invalid endpoint selected. Valid options are: ", valid))

  endpoint_group <- "crises/"
  endpoint <- if (!is.null(endpoint)) paste0(endpoint, "/")

  endpoint_url <- paste0(base_url, endpoint_group, endpoint)
  get_dataset(endpoint_url, token, ...)
}
