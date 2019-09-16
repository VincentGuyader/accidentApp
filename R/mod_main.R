# Module UI

#' @title   mod_main_ui and mod_main_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input void
#' @param output Tableau ou graphe
#' @param session internal
#'
#' @rdname mod_main
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
#' @importFrom magrittr %>%
#' @importFrom dplyr n

mod_main_ui <- function(id){
  ns <- NS(id)
  tagList(
    tabsetPanel(
      tabPanel("Tableau",
               tableOutput(ns("tab"))
      ),
      tabPanel("Graphique",
               plotOutput(ns("plot"))
      )
    )
  )
}

# Module Server

#' @rdname mod_main
#' @export
#' @keywords internal

mod_main_server <- function(input, output, session){
  ns <- session$ns
  # Tableau
  output$tab <- function() {
    # Choix bdd
    if (input$bdd == "carac") {
      data <- carac
      var1 <- dplyr::sym(input$var1)
      var2 <- dplyr::sym(input$var2)
    } else {
      data <- usager
      var1 <- dplyr::sym(input$var3)
      var2 <- dplyr::sym(input$var4)
    }
    # Type de statistique
    if (input$type == "uni") {
      data %>%
        dplyr::group_by(!!var1) %>%
        dplyr::summarise(n = n()) %>%
        dplyr::mutate(prop = scales::percent(n / sum(n))) %>%
        knitr::kable("html") %>%
        kableExtra::kable_styling(bootstrap_options = "striped", full_width = F)
    } else {
      data %>%
        dplyr::select(!!var1, !!var2) %>%
        table() %>%
        knitr::kable("html") %>%
        kableExtra::kable_styling(bootstrap_options = "striped", full_width = F)
    }
  }
  
  # Graphique
  output$plot <- renderPlot({
    # Choix bdd
    if (input$bdd == "carac") {
      data <- carac
      var1 <- dplyr::sym(input$var1)
      var2 <- dplyr::sym(input$var2)
    } else {
      data <- usager
      var1 <- dplyr::sym(input$var3)
      var2 <- dplyr::sym(input$var4)
    }
    
    # Type de statistique
    if (input$type == "uni") {
      ggplot2::ggplot(data, ggplot2::aes(!!var1, fill = !!var1)) +
        ggplot2::geom_bar(na.rm = T) +
        ggplot2::ylab("Effectifs") +
        ggplot2::geom_text(
          ggplot2::aes(label = ..count..),
          stat = "count",
          position = ggplot2::position_dodge(0.9),
          vjust = -0.5
        )
    } else {
      ggplot2::ggplot(data, ggplot2::aes(!!var1, fill = !!var2)) +
        ggplot2::geom_bar(na.rm = F) +
        ggplot2::ylab("Effectifs") +
        ggplot2::geom_text(
          ggplot2::aes(label = ..count..),
          stat = "count",
          position = ggplot2::position_stack(.5)
        )
    }
  })
}

