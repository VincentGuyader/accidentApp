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
    sidebarPanel(
      # Choix de la base
      selectInput(
        inputId = "bdd",
        label = "Choix de la base :",
        choices = c("Caractéristique" = "carac",
                    "Usager" = "usager"
                    )
      ),
      # Choix du type de statistiques
      selectInput(
        inputId = "type",
        label = "Type de statistiques :",
        choices = c("Univarié" = "uni",
                    "Bivarié" = "bi"
                    )
      ),
      # Choix graphe
      checkboxInput(
        inputId = "graph",
        label = "Graphique",
        value = FALSE
      ),
      # Choix variable 1
      conditionalPanel(condition = "input.bdd == 'carac'",
                       selectInput(
                         inputId = "var1",
                         label = "Variable 1 :",
                         choices = c(
                           "Mois" = "mois",
                           "Jours" = "jours",
                           "heure" = "heure",
                           "Agglomération" = "agg"
                         )
                       )
      ),
      # choix variable 2
      conditionalPanel(condition = "input.bdd == 'carac' & input.type == 'bi'",
                       selectInput(
                         inputId = "var2",
                         label = "Variable 2 :",
                         choices = c(
                           "Mois" = "mois",
                           "Jours" = "jours",
                           "heure" = "heure",
                           "Agglomération" = "agg"
                         )
                       )
      ),
      conditionalPanel(condition = "input.bdd == 'usager'",
                       selectInput(
                         inputId = "var3",
                         label = "Variable 1 :",
                         choices = c(
                           "Age" = "age",
                           "Sexe" = "sexe",
                           "Grave" = "grav",
                           "Catégorie" = "catu",
                           "Trajet" = "trajet"
                         )
                       )
      ),
      conditionalPanel(condition = "input.bdd == 'usager' & input.type == 'bi'",
                       selectInput(
                         inputId = "var4",
                         label = "Variable 2 :",
                         choices = c(
                           "Age" = "age",
                           "Sexe" = "sexe",
                           "Grave" = "grav",
                           "Catégorie" = "catu",
                           "Trajet" = "trajet"
                         )
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

## To be copied in the UI
# mod_sidebar_ui("sidebar_ui_1")

## To be copied in the server
# callModule(mod_sidebar_server, "sidebar_ui_1")
