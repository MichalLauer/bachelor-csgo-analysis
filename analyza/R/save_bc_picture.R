#' Title
#'
#' @param g 
#' @param f 
save_bc_picture <- function(g, f) {
  ggsave(
    paste0(bc.pictures_dir, f),
    plot = g,
    bg = "white",
    width = 140,
    height = 105,
    units = 'mm'
  )
}