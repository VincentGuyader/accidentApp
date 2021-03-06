#' Base de données accidents corporels de la circulation en 2017 en France
#' Données des caractéristique des accidents
#'
#' @source \url{https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/#_}
#' @format A data frame with 60701 rows and 18 variables:
#' \describe{
#'   \item{Num_Acc}{Numéro d'identifiant de l’accident}
#'   \item{jour}{Jour de l'accident}
#'   \item{mois}{Mois de l'accident}
#'   \item{an}{Année de l'accident}
#'   \item{hrmn}{Heure et minutes de l'accident}
#'   \item{lum}{Lumière : conditions d’éclairage dans lesquelles l'accident s'est produit}
#'   \item{dep}{Département : Code INSEE (Institut National de la Statistique et des Etudes Economiques) du département suivi d'un 0 (201 Corse-du-Sud - 202 Haute-Corse)}
#'   \item{com}{Commune : Le numéro de commune est un code donné par l‘INSEE. Le code comporte 3 chiffres calés à droite.}
#'   \item{agg}{Localisation (Hors agglomération ou agglomération)}
#'   \item{int}{Intersection}
#'   \item{atm}{Conditions atmosphériques}
#'   \item{col}{Type de collision}
#'   \item{adr}{Adresse postale : variable renseignée pour les accidents survenus en agglomération}
#'   \item{gps}{Codage GPS}
#'   \item{lat}{Latitude}
#'   \item{long}{Longitude}
#'   \item{jours}{Jours de la semaine}
#'   \item{heure}{Heure de l'accident}
#' }
#' 
"carac"

