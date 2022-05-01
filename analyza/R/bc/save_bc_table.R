save_bc_table <- function(.tibble, .file, .cap, .lab,
                          .scale = 1) {
  
  # if .lab is NA, extract it from the file name
  if (is.na(.lab)) {
    .lab <- sprintf("tab:%s", str_extract(.file, "^.*(?=\\.tex)"))
  }
  
  # Protože xtable neumí vypsat datum, převede se na text
  if ("date" %in% colnames(.tibble)) {
    .tibble <- .tibble |> 
      mutate(
        across(
          .cols = "date",
          .fns = as.character))
    
  }
  
  # Create xtable
  xtable <- xtable(
    .tibble,
    caption = .cap,
    label = .lab,
    digits = 4 
  )
  
  # There is a bug with decimal.mark and scalebox and
  # this parameter needs to be set to '.' in order to make
  # the scalebox parameter work
  options(OutDec = ".")
  
  # Setup file path
  .file = paste(TABLES_DIR, .file, sep = "/")
  
  print(xtable,
        file = .file,
        scalebox = .scale
  )
  
  # Setting back OutDec
  options(OutDec = ",")
}
