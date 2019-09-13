# Module UI

#' @title   mod_main_ui and mod_main_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_main
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_main_ui <- function(id){
  ns <- NS(id)
  tagList(
    mainPanel(
      dataTableOutput("tab"),
      plotOutput("plot")
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
  output$tab <- renderDataTable({
    # # Choix graphique
    # if (input$graph) return(NULL)
    # # Choix bdd
    # if (input$bdd == "carac") {
    #   data <- carac
    #   var1 <- input$var1
    #   var2 <- input$var2
    # } else {
    #   data <- usager
    #   var1 <- input$var3
    #   var2 <- input$var4
    # }
    # # Type de statistique
    # if (input$type == "uni") {
    #   data %>%
    #     group_by(!!var1) %>%
    #     summarise(n = n()) %>%
    #     mutate(prop = percent(n / sum(n)))
    # } else {
    #   data %>%
    #     select(!!var1, !!var2) %>%
    #     table()
    # }
    carac
  })
  
  # Graphique
  output$plot <- renderPlot({
    # Choix graphique
    if (!input$graph) return(NULL)
    
    # Choix bdd
    if (input$bdd == "carac") {
      data <- carac
      var1 <- input$var1
      var2 <- input$var2
    } else {
      data <- usager
      var1 <- input$var3
      var2 <- input$var4
    }
    
    # Type de statistique
    if (input$type == "uni") {
      ggplot(data, aes(!!input$var1, fill = !!input$var1)) +
        geom_bar(na.rm = T) +
        ylab("Effectifs") +
        geom_text(
          aes(label = ..count..),
          stat = "count",
          position = position_dodge(0.9),
          vjust = -0.5
        )
    } else {
      ggplot(data, aes(!!input$var1, fill = !!input$var2)) +
        geom_bar(na.rm = F) +
        ylab("Effectifs") +
        geom_text(aes(label = ..count..),
                  stat = "count",
                  position = position_stack(.5))
    }
  })
}

## To be copied in the UI
# mod_main_ui("main_ui_1")

## To be copied in the server
# callModule(mod_main_server, "main_ui_1")

