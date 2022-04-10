save_bc_model <- function(model, f) {
  lab <- paste0(
    "\\label{tab:",
    str_remove_all(f, ".tex$"),
    "}"
  )
  
  cap <- paste0(
    lab,
    "Výpis z funkce glm() v jazyku R"
  )
  
  f <- paste0(
    "../bakalarska-prace/kod/",
    f
  )
  
  print(xtable(model,
               caption = cap),
        file = f,
        compress = FALSE,
        table.placement = "H")
}


