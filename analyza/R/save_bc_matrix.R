save_bc_matrix <- function(.matrix, .file, .cap, .use_cap = T) {
  rownames = c("Pozitivní predikce", "Negativní predikce")
  colnames = c("Původní pozitivní", "Původní negativní")
  
  dimnames(.matrix) <- list(
    rownames,
    colnames
  )
  
  lab <- paste0(
    "\\label{tab:",
    str_remove_all(.file, ".tex$"),
    "}"
  )
  
  .cap <- paste0(
    lab,
    .cap
  )
  
  dir <- "../bakalarska-prace/kod/matice"
  if (!dir.exists(dir)) dir.create(dir)
  
  .file <- paste0(
    dir,
    "/",
    .file
  )
  
  xtable <-  xtable(.matrix,
                    caption = .cap,
                    digits = 3)
  
  if (!.use_cap) {
    xtable <-  xtable(.matrix,
                      digits = 3)
  }
  
  print(xtable,
        compress = FALSE,
        file = .file,
        table.placement = "H",
        format.args = list(decimal.mark = ","))
  
}
