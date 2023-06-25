.list2string <- function(dat) {
  cols <- names(which(sapply(dat, function(x) max(sapply(x, length))) > 1))
  for (i in 1:length(cols)) {
    dat[[cols[i]]] <- sapply(dat[[cols[i]]], toString)
  }
  dat
}
