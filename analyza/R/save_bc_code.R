save_bc_code <- function(.tibble, .file, .cap, .lab, .scale) {

  dir <- "../bakalarska-prace/kod"
  if (!dir.exists(dir)) dir.create(dir)
  
  .file <- paste0(
    dir,
    "/",
    .file
  )
  
  # Protože xtable neumí vypsat datum, převede se na text
  if ("date" %in% colnames(.tibble)) {
    .tibble <- .tibble |> 
      mutate(
        across(
          .cols = "date",
          .fns = as.character))
    
  }
  
  xtable <- xtable(
    .tibble,
    caption = .cap,
    label = .lab,
    scalebox = 
  )
  
  options(OutDec = ".")
  
  print(xtable,
        compress = FALSE,
        file = .file,
        table.placement = "H",
        include.rownames = F,
        scalebox = .scale,
        format.args = list(decimal.mark = ","))
  
  options(OutDec = ",")
}
