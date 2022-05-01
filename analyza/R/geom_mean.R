#' Získání geometrického průměru pomocí log transformace
#'
#' @param x Vektor pro vypočetění geometrického průměru
#'
#' @return Geometrický průměr
geom_mean <- function(x) {
  exp(sum(log(x)) / length(x))
}