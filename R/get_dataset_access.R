#' Get ACAPS Humanitarian Access Dataset
#'
#' A specialized function to access the ACAPS Humanitarian Access group of endpoints.
#'
#' @param endpoint Specific endpoint to access. The most common use case is to
#' access the {date} endpoint. The API expects {date} to be in a specific format, for January
#' 2023 this would look like: Jan2023. The earliest possible date is Jun2020.
#' @param date An additional date argument is required when accessing the 'weighted-scores'
#' or 'infogap-weighted-scores' endpoint. For other endpoints this can be left blank.
#' @param token Your authentication token. If left empty, the environment variable
#' created with `set_env_token()` will be used.
#' @param ... Additional parameters to be passed along with the API request. Parameters
#' must be provided as name-value pairs.
#'
#' @return The requested dataset is returned as an R dataframe.
#' @export
get_dataset_access <- function(endpoint = c(
                                 "{date}", "log", "events", "events-expanded-admin",
                                 "weighted-scores", "infogap-weighted-scores"
                               ),
                               date = NULL, token = .token(), ...) {
  req_date <- c("weighted-scores", "infogap-weighted-scores")
  if (endpoint %in% req_date & is.null(date)) {
    stop(paste0("Endpoint ", endpoint, " requires a date, but nothing was provided."))
  }

  endpoint_group <- "humanitarian-access/"
  endpoint <- if (!is.null(endpoint)) paste0(endpoint, "/")
  date <- if (!is.null(date)) paste0(date, "/")

  endpoint_url <- paste0(base_url, endpoint_group, endpoint, date)
  get_dataset(endpoint_url, token, ...)
}
