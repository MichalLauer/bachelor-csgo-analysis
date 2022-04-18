save_bc_table <- function(.matrix, .file) {
  .matrix |>
    kbl(
      format = "latex",
      align = "c",
      valign = "t",
      position = "H",
      centering = T
    ) |> 
    
}