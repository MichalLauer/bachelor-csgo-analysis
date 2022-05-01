#' Uložení logistického modelu do LaTeX souboru ve formě tabulky
#'
#' @param .model Logistický model
#' @param .file Soubor, do kterého tabulku uložit
#' @param .cap Caption
#' @param .lab Label
save_bc_model <- function(.model, .file, .cap, .lab) {
  
  # Pokud není zadaný label, použije se jako label název souboru
  # bez přípony
  if (is.na(.lab)) {
    .lab <- sprintf("tab:%s", str_extract(.file, "^.*(?=\\.tex)"))
  }
  
  # Vytvoření pojmenované tabulky
  xtable <- xtable(
    .model,
    caption = .cap,
    label = .lab,
    digits = 4 
  )
  
  # Pokud není zadaný label, vytvoří se tabulka bez labelu a 
  # captionu
  if (is.null(.lab)) {
    xtable <- xtable(.model,
                     digits = 4 )
  }
  
  # Vytvoření cesty pro soubor
  .file = paste(MODELS_DIR, .file, sep = "/")
  
  # Uložení tabulky do souboru
  print(xtable,
        file = .file,
        include.rownames = T
  )
}


