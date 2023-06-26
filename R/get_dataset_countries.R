#' Get ACAPS Countries Dataset
#'
#' A specialized function to call the ACAPS Countries API endpoint.
#'
#' @param token Your authentication token. If left empty, the environment variable
#' created with `set_env_token()` will be used.
#' @param ... Additional parameters to be passed along with the API request. Parameters
#' must be provided as name-value pairs.
#'
#' @return The requested dataset is returned as an R dataframe.
#' @export
#'
get_dataset_countries <- function(token = .token(), ...) {

  endpoint_group <- "countries/"
  endpoint_url <- paste0(base_url, endpoint_group)

  get_dataset(endpoint_url, token, ...)

}
