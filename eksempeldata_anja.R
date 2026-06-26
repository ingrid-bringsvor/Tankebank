library(GaussSuppression)

# Parametere
# Erstatt med parameterne i ditt datasett
fylker <- c("Fylke1", "Fylke2", "Fylke3")
kjonn <- c("Mann", "Kvinne")
alder_intervall <- c("18-29", "30-44", "45-59", "60-74", "75-99")
brutto_intervall <- c("0-199k", "200-399k", "400-599k", "600-799k", "800k+")
inntektsaar <- c("2020", "2021", "2022", "2023") 

# Reproduserbarhet av eksempeldataen
# Sikrer at man får ut samme radene ved hver kjøring 
set.seed(123)  

# Lager 50 rader med testdata
n <- 50
testdata <- data.frame(
  fylke = sample(fylker, n, replace = TRUE),
  kjonn = sample(kjonn, n, replace = TRUE),
  alder = sample(alder_intervall, n, replace = TRUE),
  bruttofinans = sample(brutto_intervall, n, replace = TRUE), 
  inntektsaar = sample(inntektsaar, n, replace = TRUE)
)


# Vi lager en for-løkke som kjører SuppressSmallCounts for hvert inntektsår separat

# En liste der output lagres for hvert inntektsår
resultater <- list()

# Vi ser på unike årstall og sorterer i stigende rekkefølge (2020, 2021, ...)
for (aar in sort(unique(testdata$inntektsaar))) {
  
# Deler opp datasettet basert på inntektsår  
  subset_aar <- testdata[testdata$inntektsaar == aar, ]

# SupressSmallCounts kjøres for hvert inntektsår separat 
# Frekvenser lik 0, 1 og 2 blir primærprikket 
# dimVar angir dimensjonsvariablene som krysses 
  resultater[[aar]] <- SuppressSmallCounts(
    data = subset_aar,
    maxN = 2,
    dimVar = c("fylke", "alder", "kjonn", "bruttofinans")
  )
}

# Henter ut resultatet for hvert år
resultater[["2020"]]
resultater[["2021"]]
resultater[["2022"]]
resultater[["2023"]]
