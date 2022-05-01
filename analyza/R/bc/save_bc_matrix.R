#' Uložení matice záměn do LaTeX souboru
#'
#' @param .table Tabulka z matice záměn
#' @param .file Soubor, do tabulku z matice záměn uložit
#' @param .cap Caption
#' @param .lab Label
save_bc_matrix <- function(.table, .file, .cap, .lab) {
  
  # Přeložen názvů sloupečků
  rownames = c("Pozitivní predikce", "Negativní predikce")
  colnames = c("Původní pozitivní", "Původní negativní")
  
  dimnames(.table) <- list(
    rownames,
    colnames
  )
  
  # Pokud není zadaný label, použije se jako label název souboru
  # bez přípony
  if (is.na(.lab)) {
    .lab <- sprintf("tab:%s", str_extract(.file, "^.*(?=\\.tex)"))
  }
  
  # Vytvoření pojmenované tabulky
  xtable <- xtable(
    .table,
    caption = .cap,
    label = .lab,
    digits = 4
  )
  
  # Pokud není zadaný label, vytvoří se tabulka bez labelu a 
  # captionu
  if (is.null(.lab)) {
    xtable <- xtable(.table,
                     digits = 4)
  }
  
  # Vytvoření cesty pro soubor
  .file = paste(MATRIXES_DIR, .file, sep = "/")
  
  # Uložení tabulky do souboru
  print(xtable,
        file = .file,
        include.rownames = T
  )
  
}
