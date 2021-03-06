#' Base de données accidents corporels de la circulation en 2017 en France
#' Données des usagers des accidents
#'
#' @source \url{https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/#_}
#' @format A data frame with 136021 rows and 13 variables:
#' \describe{
#'   \item{Num_Acc}{Identifiant de l’accident identique à celui du fichier "rubrique CARACTERISTIQUES" repris pour chacun des usagers décrits impliqués dans l’accident}
#'   \item{num_veh}{Identifiant du véhicule repris pour chacun des usagers occupant ce véhicule (y compris les piétons qui sont rattachés aux véhicules qui les ont heurtés) – Code alphanumérique}
#'   \item{place}{Permet de situer la place occupée dans le véhicule par l'usager au moment de l'accident}
#'   \item{catu}{Catégorie d'usager}
#'   \item{grav}{Gravité de l'accident : Les usagers accidentés sont classés en trois catégories de victimes plus les indemnes}
#'   \item{sexe}{Sexe de l'usager}
#'   \item{an_nais}{Année de naissance de l'usager}
#'   \item{trajet}{Motif du déplacement au moment de l’accident}
#'   \item{secu}{sur 2 caractères : le premier concerne l’existence d’un Équipement de sécurité et le second concerne l’utilisation de l’Équipement de sécurité}
#'   \item{locp}{Localisation du piéton}
#'   \item{actp}{Action du piéton}
#'   \item{etatp}{Cette variable permet de préciser si le piéton accidenté était seul ou non}
#'   \item{age}{Age de l'accidenté}
#' }
#'
"usager"
