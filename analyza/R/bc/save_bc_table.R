#' Uložení libovolné tabulky do LaTeX souboru
#'
#' @param .tibble Tabulka
#' @param .file Soubor, do kterého uložit tabulku
#' @param .cap Caption
#' @param .lab Label
#' @param .scale Poměr tabulky
save_bc_table <- function(.tibble, .file, .cap, .lab,
                          .scale = 1) {
  
  # Pokud není zadaný label, použije se jako label název souboru
  # bez přípony
  if (is.na(.lab)) {
    .lab <- sprintf("tab:%s", str_extract(.file, "^.*(?=\\.tex)"))
  }
  
  # Protože xtable neumí vypsat datum, převede se na text
  if ("date" %in% colnames(.tibble)) {
    .tibble <- .tibble |> 
      mutate(
        across(
          .cols = "date",
          .fns = as.character))
    
  }
  
  # Vytvoření pojmenované tabulky
  xtable <- xtable(
    .tibble,
    caption = .cap,
    label = .lab,
    digits = 4 
  )
  
  # V xtable existuje bug, kde při globálním nastavení decimálního
  # oddělovače na ',' se vypíše .scale s čárkou a LaTeX hází error
  options(OutDec = ".")
  
  # Vytvoření cesty pro soubor
  .file = paste(TABLES_DIR, .file, sep = "/")
  
  # Uložení tabulky do souboru
  print(xtable,
        file = .file,
        scalebox = .scale
  )
  
  # Znovunastavení decimálního oddělovače na ','
  options(OutDec = ",")
}
