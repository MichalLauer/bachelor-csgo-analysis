save_bc_model <- function(.model, .file, .cap, .lab) {
  
  # if .lab is NA, extract it from the file name
  if (is.na(.lab)) {
    .lab <- sprintf("tab:%s", str_extract(.file, "^.*(?=\\.tex)"))
  }
  
  # Create xtable
  xtable <- xtable(
    .model,
    caption = .cap,
    label = .lab,
    digits = 4 
  )
  
  # pokud je .lab NULL, model nesmí mít label
  if (is.null(.lab)) {
    xtable <- xtable(.model,
                     digits = 4 )
  }
  
  # Setup file path
  .file = paste(MODELS_DIR, .file, sep = "/")
  
  print(xtable,
        file = .file
  )
}


