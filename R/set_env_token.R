#' Set ACAPS authentication token as env var
#'
#' This function is used to store your ACAPS authentication token as en environment
#' variable. This allows the package functions to access your authentication token
#' without putting the token value itself in scripts. All functions that require a
#' token will look for this environment variable by default.
#'
#' @param token Your ACAPS authentication token
#' @param silent_overwrite If set to TRUE, function will always overwrite existing value. If FALSE,
#' will prompt the user if they want to overwrite the existing value. Set to FALSE by default.
#'
#' @export
#'
set_env_token <- function(token, silent_overwrite = FALSE) {
  old_token <- Sys.getenv("ACAPS_TOKEN")
  if (!identical(old_token, "") & !silent_overwrite) {
    choice <- menu(c("Yes", "No"), title = "ACAPS_TOKEN env var already exists. Overwrite?")
    if (choice != 1) {
      return()
    }
  }
  Sys.setenv(ACAPS_TOKEN = token)
}
