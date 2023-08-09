#' Get ACAPS Ukraine dataset
#'
#' A specialized function to call the ACAPS Ukraine group of endpoints.
#'
#' @param endpoint Specific endpoint to access.
#' @param date An additional date argument is required when accessing the 'subnational-access',
#' 'master-dataset' or  'regional-dataset' endpoint. The API expects {date} to
#' be in a specific format, for January 2023 this would look like: Jan2023.
#' The earliest possible date is Jun2020. For other endpoints this can be left blank.
#' @param token Your authentication token. If left empty, the environment variable
#' created with `set_env_token()` will be used.
#' @param ... Additional parameters to be passed along with the API request. Parameters
#' must be provided as name-value pairs.
#'
#' @return The requested dataset is returned as an R dataframe.
#' @export
get_dataset_ukraine <- function(endpoint = c(
  "subnational-access", "access-events", "damages",
  "master-dataset", "regional-dataset"
),
date = NULL, token = .token(), ...) {
  req_date <- c("subnational_access", "master-dataset", "regional-dataset")
  if (endpoint %in% req_date & is.null(date)) {
    stop(paste0("Endpoint ", endpoint, " requires a date, but nothing was provided."))
  }

  endpoint_group <- "ukraine/"
  endpoint <- if (!is.null(endpoint)) paste0(endpoint, "/")
  date <- if (!is.null(date)) paste0(date, "/")

  endpoint_url <- paste0(base_url, endpoint_group, endpoint, date)
  get_dataset(endpoint_url, token, ...)
}
