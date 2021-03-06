#' Launch a Marxan app
#'
#' @param appname An app name.
#' @examples
#' runMarxan("import")
#' runMarxan("manage")
#' runMarxan("marxan")
#' runMarxan("marzone")
#' runMarxan("mxptest")
#' @export
runMarxan <- function(appname) {
  # locate all the shiny app examples that exist
  #validApps <- list.files(system.file(".", package = "marxanui"))
  validApps <- c("import","manage","marxan","marzone","mxptest")

  validAppsMsg <-
    paste0(
      "Valid apps are: '",
      paste(validApps, collapse = "', '"),
      "'")

  # if an invalid app is given, throw an error
  if (missing(appname) || !nzchar(appname) ||
      !appname %in% validApps) {
    stop(
      'Please run `runMarxan()` with a valid app as an argument.\n',
      validAppsMsg,
      call. = FALSE)
  }

  # find and launch the app
  appDir <- system.file(".", appname, package = "marxanui")
  shiny::runApp(appDir, display.mode = "normal")
}