save_bc_code <- function(.tibble, .file, .cap, .lab) {
  .file <- file(paste0(bc.code_dir, .file),
            encoding = "UTF-8"
  )
  
  .tibble |>
    kbl(
      format = "latex",
      caption = .cap,
      label = .lab,
      align = "c",
      valign = "t",
      position = "H",
      centering = T
    ) |>
    kable_styling(latex_options = "scale_down") |> 
    writeLines(con = .file)
  close(.file)
}
