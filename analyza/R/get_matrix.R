#' Získání matice záměn
#'
#' @param .model Model pro matici záměn
#' @param .split Split z knihovny rsample
#'
#' @return Matice záměn z knihovny caret
get_matrix <- function(.model, .split) {
  confusionMatrix(
    # Predikce na testovací množině dat
    data = predict(object = .model,
                   newdata = testing(.split),
                   type = "response") |> 
      round() |> 
      as.factor(),
    # Původní hodnoty z testovací množiny dat
    reference = testing(.split)$map_winner |> 
      as.factor(),
    positive = "1"
  )
}