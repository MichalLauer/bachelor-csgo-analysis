save_bc_matrix <- function(.table, .file, .cap, .lab) {
  
  # Přepsání názvů sloupečku
  rownames = c("Pozitivní predikce", "Negativní predikce")
  colnames = c("Původní pozitivní", "Původní negativní")
  
  dimnames(.table) <- list(
    rownames,
    colnames
  )
  
  # if .lab is NA, extract it from the file name
  if (is.na(.lab)) {
    .lab <- sprintf("tab:%s", str_extract(.file, "^.*(?=\\.tex)"))
  }
  
  # Create xtable
  xtable <- xtable(
    .table,
    caption = .cap,
    label = .lab,
    digits = 4
  )
  
  # pokud je .lab NULL, model nesmí mít label
  if (is.null(.lab)) {
    xtable <- xtable(.table,
                     digits = 4)
  }
  
  # Setup file path
  .file = paste(MATRIXES_DIR, .file, sep = "/")
  
  print(xtable,
        file = .file
  )
  
}
