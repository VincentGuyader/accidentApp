
# Caratéristique des accidents
carac <- read_delim("./data-raw/caracteristiques-2017.csv", delim = ",", locale = locale(encoding = "latin1"))

# Convertion des variables dans la base caractéristique
carac <- carac %>%
  mutate(dep = str_sub(dep, end = 2),
         jours = factor(weekdays(as.Date(str_c(an, mois, jour, sep = "/"))),
                        levels = c("lundi",  "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche")),
         mois = factor(month.abb[mois], levels = month.abb),
         heure = as.numeric(str_sub(hrmn, end = -3)),
         lum = factor(lum, levels = 1:5, labels = c("Plein jour", "Crépuscule ou aube", "Nuit sans éclairage public", "Nuit avec éclairage public non allumé", "Nuit avec éclairage public allumé")),
         agg = factor(agg, levels = 1:2, labels = c("Hors agglomération", "En agglomération")),
         int = factor(int, levels = 1:9, labels = c("Hors intersection", "Intersection en X", "Intersection en T", "Intersection en Y", "Intersection à plus de 4 branches", "Giratoire", "Place", "Passage à niveau", "Autre intersection")),
         atm = factor(atm, levels = 1:9, labels = c("Normale", "Pluie légère", "Pluie forte", "Neige - grêle", "Brouillard - fumée", "Vent fort - tempête", "Temps éblouissant", "Temps couvert", "Autre")),
         col = factor(col, levels = 1:7, labels = c("Deux véhicules - frontale", "Deux véhicules - par l’arrière", "Deux véhicules - par le coté", "Trois véhicules et plus - en chaîne", "Trois véhicules et plus - collisions multiples", "Autre collision", "Sans collision"))
  )

# Créé la base de données
usethis::use_data(carac, overwrite = T)
