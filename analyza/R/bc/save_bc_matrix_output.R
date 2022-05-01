#' Uložení statistik z matice záměn do LaTeX souboru
#'
#' @param .matrix Matice záměn
#' @param .file Soubor, do kterého statistiky uložit
#' @param .cap Caption matice
#' @param .lab Label matice
save_bc_matrix_output <- function(.matrix, .file, .cap, .lab) {
  
  # Spojení statistik
  .matrix <- bind_rows(
    tibble(
      statistika = names(.matrix$overall),
      hodnota = .matrix$overall
    ),
    tibble(
      statistika = names(.matrix$byClass),
      hodnota = .matrix$byClass
    )
  ) |>
    # Získání relevantních statistik a přeložení statistik
    filter(statistika %in% c("Accuracy", "Sensitivity", "Specificity")) |> 
    mutate(statistika = c("Přesnost", "Senzitivita", "Specificita"))
  
  # Pokud není zadaný label, použije se jako label název souboru
  # bez přípony
  if (is.na(.lab)) {
    .lab <- sprintf("tab:%s", str_extract(.file, "^.*(?=\\.tex)"))
  }
  
  # Vytvoření pojmenované tabulky
  xtable <- xtable(
    .matrix,
    caption = .cap,
    label = .lab,
    digits = 4 
  )
  
  # Pokud není zadaný label, vytvoří se tabulka bez labelu a 
  # captionu
  if (is.null(.lab)) {
    xtable <- xtable(.matrix,
                     digits = 4 )
  }
  
  # Vytvoření cesty pro soubor
  .file = paste(STATS_DIR, .file, sep = "/")
  
  # Uložení tabulky do souboru
  print(xtable,
        file = .file
  )
  
}