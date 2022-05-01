#' Uložení grafu jako png
#'
#' @param .graph Graf z knihovny ggplot
#' @param .file Soubor, do kterého obrázek uložit
save_bc_picture <- function(.graph, .file) {
  
  # Vytvoření cesty pro soubor
  .file = paste(PICTURES_DIR, .file, sep = "/")
  
  # Uložení obrázku
  ggsave(
    .file,
    plot = .graph,
    bg = "white",
    width = 150,
    height = 105,
    units = 'mm'
  )
}