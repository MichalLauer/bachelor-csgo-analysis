get_matrix <- function(.model, .split) {
  confusionMatrix(
    data = predict(object = .model,
                   newdata = testing(.split),
                   type = "response") |> 
      round() |> 
      as.factor(),
    reference = testing(.split)$map_winner |> 
      as.factor(),
    positive = "1"
  )
}