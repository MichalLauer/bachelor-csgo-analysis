save_bc_matrix_output <- function(.output, .file, .cap) {
  
  .output <- bind_rows(
    tibble(
      statistika = names(.output$overall),
      hodnota = .output$overall
    ),
    tibble(
      statistika = names(.output$byClass),
      hodnota = .output$byClass
    )
  ) |>
    filter(statistika %in% c("Accuracy", "Sensitivity", "Specificity")) |> 
    mutate(statistika = c("Přesnost", "Senzitivita", "Specificita"))

  lab <- paste0(
    "\\label{tab:",
    str_remove_all(.file, ".tex$"),
    "}"
  )
  
  .cap <- paste0(
    lab,
    .cap
  )
  
  .file <- paste0(
    "../bakalarska-prace/kod/",
    .file
  )
  
  print(xtable(.output,
               caption = .cap,
               digits = 3),
        compress = FALSE,
        file = .file,
        include.rownames = F,
        table.placement = "H",
        format.args = list(decimal.mark = ","))
  
}