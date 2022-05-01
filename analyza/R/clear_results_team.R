#' Získání charakteristik týmu v daném zápase
#'
#' @param .tbl Datový soubor results.csv
#' @param i Číslo týmu pro získání charakteristik
#'
#' @return Tabulka s charakteristikami týmu v zápase
clear_results_team <- function(.tbl, .i) {
  .tbl |>
    # Vybrání relevantních charaktersitik pro daný tým
    select(
      date, match_id, team = matches(sprintf("team_%i", .i)),
      map, map_winner, starting_ct, 
      team_rank = matches(sprintf("rank_%i", .i))
    ) |>
    # Záskání pouze relevantních map
    filter(map %in% maps) |>
    mutate(
      map_winner = as.numeric(map_winner == .i),
      starting_ct = as.numeric(starting_ct == .i)
    )
}