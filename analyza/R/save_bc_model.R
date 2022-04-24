save_bc_model <- function(.model, .file, .cap, .use_cap = T) {
  lab <- paste0(
    "\\label{tab:",
    str_remove_all(.file, ".tex$"),
    "}"
  )
  
  .cap <- paste0(
    lab,
    .cap
  )
  
  dir <- "../bakalarska-prace/kod/modely"
  if (!dir.exists(dir)) dir.create(dir)
  
  .file <- paste0(
    dir,
    "/",
    .file
  )
  
  xtable <-  xtable(.model,
                    caption = .cap,
                    digits = 3)
  
  if (!.use_cap) {
    xtable <-  xtable(.model,
                      digits = 3)
  }
  
  
  print(xtable,
        compress = FALSE,
        file = .file,
        table.placement = "H",
        format.args = list(decimal.mark = ","))
}


