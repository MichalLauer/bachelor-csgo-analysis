# Získej statistiky pro kombinace hráče a mapy
stats <- \(.player = '*', .map = '*'){
  group_cols <- case_when(.player == '*' && .map != '*' ~ c('map'),
                          TRUE ~ c('player', 'map')
  )
  players %>%
    filter(grepl(pattern = .player, x = player), grepl(pattern = .map, x = map)) %>%
    group_by(across(.cols = group_cols)) %>%
    summarise(kills = mean(kills))
}