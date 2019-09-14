#' @import shiny
app_server <- function(input, output,session) {
  # List the first level callModules here
  callModule(mod_sidebar_server, "sidebar_ui_1")
  callModule(mod_main_server, "sidebar_ui_1")
}
