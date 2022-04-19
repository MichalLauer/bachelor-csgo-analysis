save_bc_matrix <- function(.matrix, .file, .cap) {
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
  
  .file <- paste0(
    "../bakalarska-prace/kod/",
    .file
  )
  
  print(xtable(.matrix,
               caption = .cap,
               digits = 3),
        compress = FALSE,
        file = .file,
        table.placement = "H",
        format.args = list(decimal.mark = ","))
    
}
