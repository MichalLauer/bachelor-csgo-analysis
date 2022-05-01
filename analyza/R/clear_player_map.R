#' Funkce pro extrakci charakteristik hráče na mapě v jedno zápase
#'
#' @param tbl datový soubor players.csv
#' @param map číslo mapy pro extrakci charakteristik
#'
#' @return tabulka s charakteristikami hráčů na dané mapě
clear_player_map <- function(.tbl, .map) {
  m_ <- sprintf("m%i_", .map)
  .tbl |>
    select(match_id, player_id, team,
           # Vybrání mapy a statisik podle pro i-tou mapu
           map = sprintf("map_%i", .map),
           matches(sprintf("^m%i_", .map))
    ) |>
    # Získání pouze agregovanýc statistik za obě strany
    # e.g. vyloučení m1_kills_ct, m1_kills_t a ponechání pouze m1_kills
    select(!matches("_c?t$")) |>
    drop_na(map) |>
    # Sjednocení názvů, e.g. m1_kills -> kills
    rename_with(
      .cols = starts_with(m_),
      .fn = ~ str_remove_all(.x, m_)
    ) |>
    # Odstranění sloupečků, které nejsou kompletní
    # kvůli historii vývoje cs:go a hltv.org
    select(-c(kddiff, flash_assists, kast, adr)) |>
    # konverze HS na relativní jednotky
    mutate(hs = ifelse(kills == 0, 0, hs / kills))
}