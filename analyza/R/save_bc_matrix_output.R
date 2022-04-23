save_bc_matrix_output <- function(.object, .file, .cap) {
  
  .object <- bind_rows(
    tibble(
      statistika = names(.object$overall),
      hodnota = .object$overall
    ),
    tibble(
      statistika = names(.object$byClass),
      hodnota = .object$byClass
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
  
  dir <- "../bakalarska-prace/kod/matice_out"
  if (!dir.exists(dir)) dir.create(dir)
  
  .file <- paste0(
    dir,
    "/",
    .file
  )
  
  xtable <-  xtable(.object,
                    caption = .cap,
                    digits = 3)
  print(xtable,
        compress = FALSE,
        file = .file,
        include.rownames = F,
        table.placement = "H",
        format.args = list(decimal.mark = ","))
  
}