#' Title
#'
#' @param tbl 
#' @param f 
#' @param cap 
#' @param lab 
save_bc_code <- function(tbl, f, cap, lab) {
  f <- file(paste0(bc.code_dir, f),
            encoding = "UTF-8"
  )
  
  tbl |>
    kbl(
      format = "latex",
      caption = cap,
      label = lab,
      align = "c",
      valign = "t",
      position = "H",
      centering = T
    ) |>
    kable_styling(latex_options = "scale_down") |> 
    writeLines(con = f)
  close(f)
}
