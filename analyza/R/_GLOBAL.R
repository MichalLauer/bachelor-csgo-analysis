# Seznam map, které jsou potřebné pro analýzy dat
maps <- c(
  "Dust2", "Inferno", "Vertigo", "Overpass", "Nuke", "Mirage",
  "Train", "Cache", "Cobblestone"
)

# Adresář, kam ukládat grafy
PICTURES_DIR <- "../bakalarska-prace/obrazky/"
if (!dir.exists(PICTURES_DIR)) dir.create(PICTURES_DIR)

# Adresář, kam ukládat vytvořené latex tabulky
TABLES_DIR <- "../bakalarska-prace/tabulky/"
if (!dir.exists(TABLES_DIR)) dir.create(TABLES_DIR)

# Adresář, kam ukládat tabulky vytvořených modelů
MODELS_DIR <- "../bakalarska-prace/modely/"
if (!dir.exists(MODELS_DIR)) dir.create(MODELS_DIR)

# Adresář, kam ukládat latex tabulky pro matice záměn
MATRIXES_DIR <- "../bakalarska-prace/matice/"
if (!dir.exists(MATRIXES_DIR)) dir.create(MATRIXES_DIR)

# Adresář, kam ukládat latex tabulky pro výsledné statistiky z
# matice záměn
STATS_DIR <- "../bakalarska-prace/statistiky/"
if (!dir.exists(STATS_DIR)) dir.create(STATS_DIR)
