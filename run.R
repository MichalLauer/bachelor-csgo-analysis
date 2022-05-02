# Nahrání balíčků
renv::activate("analyza/")
renv::restore(prompt = F)
rstudioapi::restartSession()
renv::activate("analyza/")

# Nastavení working directory pro render
wd <- rstudioapi::getActiveDocumentContext()$path |> dirname()
setwd(wd)

# Kontrola dat
if (!dir.exists("analyza/data")) {
  stop(sprintf("Prve je nutné stáhnout datový soubor z %s do složky analyza/data",
               "https://www.kaggle.com/datasets/mateusdmachado/csgo-professional-matches"))
}

# Renderování pomocných souborů
rmarkdown::render("analyza/grafy.Rmd", quiet = T)
rmarkdown::render("analyza/analyza.Rmd", quiet = T)
