library(arrow)
pred_time <- read_parquet("/buckets/shared/filepath/file.parquet")

#### Velger kun følgende kolonner fra dataframe ####
  # aar_utbygd_pixel: viser annotert (observert) utbygdår
  # aar_hogd_pixel: viser annotert hogst, kan bety framtidig utbygging 
  # labeling_index: viser id til polygonet (som kan ha flere piksler)
  # kvalitet: 5 er bra, 3 kan mangle relevante flyfotobilder, 1 er ubrukelig 
  # ndvi: selve tidsrekken med observasjoner
  # change_pred_date_start: predikert starttidspunkt endring
  # end: predikert sluttidspunkt endring
pred_time_simple <- pred_time[c("aar_utbygd_pixel", "aar_hogd_pixel", "labeling_index", "kvalitet", "ndvi", "change_pred_date_start", "change_pred_date_end")]


# Kolonnenavn
colnames(pred_time_simple)
# Antall NA i hver kolonne
colSums(is.na(pred_time_simple))
# Sjekker kvaliteten (generelt høy kvalitet)  
table(pred_time_simple$kvalitet, useNA = "ifany")
