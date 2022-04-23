save_bc_code <- function(.tibble, .file, .cap, .lab, .scale) {

  dir <- "../bakalarska-prace/kod"
  if (!dir.exists(dir)) dir.create(dir)
  
  .file <- paste0(
    dir,
    "/",
    .file
  )
  
  xtable <- xtable(
    .tibble,
    caption = .cap,
    label = .lab,
    scalebox = 
  )
  
  print(xtable,
        compress = FALSE,
        file = .file,
        table.placement = "H",
        include.rownames = F,
        scalebox = .scale)
  
  # .tibble |>
  #   kbl(
  #     format = "latex",
  #     caption = .cap,
  #     label = .lab,
  #     align = "c",
  #     valign = "t",
  #     position = "H",
  #     centering = T
  #   ) |>
  #   kable_styling(latex_options = "scale_down") |>
  #   print(file = .file,
  #         caption.placement = "bottom")
}
