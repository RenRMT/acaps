#' Get ACAPS dataset from a single endpoint
#'
#' These specialized functions can be used to call ACAPS datasets from categories
#' with only a single API endpoint. These functions do not require any arguments besides
#' your API access token. They accept optional additional parameters
#'
#' @param token Your authentication token. If left empty, the environment variable
#' created with `set_env_token()` will be used.
#' @param ... Additional parameters to be passed along with the API request. Parameters
#' must be provided as name-value pairs.
#'
#' @return The requested dataset is returned as an R dataframe.
#' @name get_dataset_single_endpoint
#' @rdname get_dataset_single_endpoint
NULL

#' @rdname get_dataset_single_endpoint
get_dataset_infolandscape <- function(token = .token(), ...) {

  endpoint_group <- "information-landscape-dataset"

  endpoint_url <- paste0(base_url, endpoint_group)
  get_dataset(endpoint_url, token, ...)
}

#' @rdname get_dataset_single_endpoint
get_dataset_countries <- function(token = .token(), ...) {

  endpoint_group <- "countries/"
  endpoint_url <- paste0(base_url, endpoint_group)

  get_dataset(endpoint_url, token, ...)

}

#' @rdname get_dataset_single_endpoint
get_dataset_risklist <- function(token = .token(), ...) {

endpoint_group <- "risk-list/"


endpoint_url <- paste0(base_url, endpoint_group)
get_dataset(endpoint_url, token, ...)
}

#' @rdname get_dataset_single_endpoint
get_dataset_govmeasures <- function(token = .token(), ...) {

  endpoint_group <- "government-measures/"

  endpoint_url <- paste0(base_url, endpoint_group)
  get_dataset(endpoint_url, token, ...)
}

#' @rdname get_dataset_single_endpoint
get_dataset_secondaryimpacts <- function(token = .token(), ...) {

  endpoint_group <- "covid-19-secondary-impacts/"

  endpoint_url <- paste0(base_url, endpoint_group)
  get_dataset(endpoint_url, token, ...)
}

#' @rdname get_dataset_single_endpoint
get_dataset_dailymonitoring <- function(token = .token(), ...) {

  endpoint_group <- "daily-monitoring/"

  endpoint_url <- paste0(base_url, endpoint_group)
  get_dataset(endpoint_url, token, ...)
}

#' @rdname get_dataset_single_endpoint
get_dataset_protindicators <- function(token = .token(), ...) {

  endpoint_group <- "protection-indicators-monitor/"

  endpoint_url <- paste0(base_url, endpoint_group)
  get_dataset(endpoint_url, token, ...)
}
