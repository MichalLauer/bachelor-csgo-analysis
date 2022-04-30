save_bc_matrix_output <- function(.matrix, .file, .cap, .lab) {
  
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
    filter(statistika %in% c("Accuracy", "Sensitivity", "Specificity")) |> 
    mutate(statistika = c("Přesnost", "Senzitivita", "Specificita"))
  
  # if .lab is NA, extract it from the file name
  if (is.na(.lab)) {
    .lab <- sprintf("tab:%s", str_extract(.file, "^.*(?=\\.tex)"))
  }
  
  # Create xtable
  xtable <- xtable(
    .matrix,
    caption = .cap,
    label = .lab,
    digits = 4 
  )
  
  # pokud je .lab NULL, model nesmí mít label
  if (is.null(.lab)) {
    xtable <- xtable(.matrix,
                     digits = 4 )
  }
  
  # Setup file path
  .file = paste(STATS_DIR, .file, sep = "/")
  
  print(xtable,
        file = .file
  )
  
}