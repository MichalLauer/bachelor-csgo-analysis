save_bc_picture <- function(.graph, .file) {
  ggsave(
    paste0(bc.pictures_dir, .file),
    plot = .graph,
    bg = "white",
    width = 140,
    height = 105,
    units = 'mm'
  )
}