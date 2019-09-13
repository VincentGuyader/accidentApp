# Usagers impliqués dans les accidents
usager <- read_delim("./data-raw/usagers-2017.csv", delim = ",", locale = locale(encoding = "latin1"))
# Caratéristique des accidents
carac <- read_delim("./data-raw/caracteristiques-2017.csv", delim = ",", locale = locale(encoding = "latin1"))

# Convertion des variables dans la base usager
usager <- usager %>%
  filter(Num_Acc %in% carac$Num_Acc) %>%
  mutate(catu = factor(catu, levels = 1:4, labels = c("Conducteur", "Passager", "Piéton", "Piéton en roller ou en trottinette")),
         grav = factor(grav, levels = 1:4, labels = c("Indemne", "Tué", "Blessé hospitalisé", "Blessé léger")),
         sexe = factor(sexe, levels = 1:2, labels = c("Masculin", "Féminin")),
         trajet = factor(trajet, levels = c(1:5, 9), labels = c("Domicile – travail", "Domicile – école", "Courses – achats", "Utilisation professionnelle", "Promenade – loisirs", "Autre")),
         an_nais = as.numeric(an_nais),
         age = cut(2017 - an_nais, breaks = c(-Inf, 18, 25, 34, 44, 54, 64, 74, Inf),
                   labels = paste(c("< 19", "19-25", "26-34", "35-44", "45-54", "55-64", "65-74", " +75"), "ans"))
  )

# Créé la base de données
usethis::use_data(usager, overwrite = T)
