# base url of the ACAPS API
base_url <- "https://api.acaps.org/api/v1/"

# internal function to convert dataframe columns that contain lists to strings
.list2string <- function(dat) {
  cols <- names(which(sapply(dat, function(x) max(sapply(x, length))) > 1))
  if (length(cols) != 0) {
    for (i in 1:length(cols)) {
      dat[[cols[i]]] <- sapply(dat[[cols[i]]], toString)
    }
  }
  dat
}

# internal function to get the acaps token from an env variable. default value for token argument in functions.
.token <- function() {
  token <- Sys.getenv("ACAPS_TOKEN")
  if (identical(token, "")) {
    stop("Env var ACAPS_TOKEN not found. Set the env var with set_env_token() or provide the token manually",
      call. = FALSE
    )
  }
  token
}
