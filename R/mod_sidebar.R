# Module UI

#' @title   mod_sidebar_ui and mod_sidebar_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input Base à analyser, variables à descrire, options graphisme
#' @param output void
#' @param session internal
#'
#' @rdname mod_sidebar
#'
#' @keywords internal
#' @export
#' @importFrom shiny NS tagList
mod_sidebar_ui <- function(id) {
  ns <- NS(id)
  tagList(
    # Choix de la base
    selectInput(
      inputId = ns("bdd"),
      label = "Choix de la base :",
      choices = c("Caract\u00e9ristique" = "carac",
                  "Usager" = "usager"
      )
    ),
    # Choix du type de statistiques
    selectInput(
      inputId = ns("type"),
      label = "Type de statistiques :",
      choices = c("Univari\u00e9" = "uni",
                  "Bivari\u00e9" = "bi"
      )
    ),

    # Choix variable 1
    conditionalPanel(condition = "input.bdd == 'carac'",
                     ns = ns,
                     selectInput(
                       inputId = ns("var1"),
                       label = "Variable 1 :",
                       choices = c(
                         "Mois" = "mois",
                         "Jours" = "jours",
                         "heure" = "heure",
                         "Agglom\u00e9ration" = "agg"
                       )
                     )
    ),
    # choix variable 2
    conditionalPanel(condition = "input.bdd == 'carac' & input.type == 'bi'",
                     ns = ns,
                     selectInput(
                       inputId = ns("var2"),
                       label = "Variable 2 :",
                       choices = c(
                         "Mois" = "mois",
                         "Jours" = "jours",
                         "heure" = "heure",
                         "Agglom\u00e9ration" = "agg"
                       )
                     )
    ),
    conditionalPanel(condition = "input.bdd == 'usager'",
                     ns = ns,
                     selectInput(
                       inputId = ns("var3"),
                       label = "Variable 1 :",
                       choices = c(
                         "Age" = "age",
                         "Sexe" = "sexe",
                         "Grave" = "grav",
                         "Cat\u00e9gorie" = "catu",
                         "Trajet" = "trajet"
                       )
                     )
    ),
    conditionalPanel(condition = "input.bdd == 'usager' & input.type == 'bi'",
                     ns = ns,
                     selectInput(
                       inputId = ns("var4"),
                       label = "Variable 2 :",
                       choices = c(
                         "Age" = "age",
                         "Sexe" = "sexe",
                         "Grave" = "grav",
                         "Cat\u00e9gorie" = "catu",
                         "Trajet" = "trajet"
                       )
                     )
    )
  )
}

# Module Server

#' @rdname mod_sidebar
#' @export
#' @keywords internal

mod_sidebar_server <- function(input, output, session) {
  ns <- session$ns
}
