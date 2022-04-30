save_bc_picture <- function(.graph, .file) {
  
  # Nastavení správné cesty
  .file = paste(PICTURES_DIR, .file, sep = "/")
  
  ggsave(
    .file,
    plot = .graph,
    bg = "white",
    width = 150,
    height = 105,
    units = 'mm'
  )
}