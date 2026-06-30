import random
import pandas as pd

# Parametere 
fylker = ["Fylke1", "Fylke2", "Fylke3"]
kjonn = ["Mann", "Kvinne"]
alder_intervall = ["18-29", "30-44", "45-59", "60-74", "75-99"]
brutto_intervall = ["0-199k", "200-399k", "400-599k", "600-799k", "800k+"]
inntektsaar = ["2020", "2021", "2022", "2023"]

# Reproduserbarhet
random.seed(123)

# Antall rader
n = 50

# Generer datasett
# Variabelnavn _ skal ikke brukes igjen
testdata = pd.DataFrame({
    "fylke": [random.choice(fylker) for _ in range(n)],
    "kjonn": [random.choice(kjonn) for _ in range(n)],
    "alder": [random.choice(alder_intervall) for _ in range(n)],
    "bruttofinans": [random.choice(brutto_intervall) for _ in range(n)],
    "inntektsaar": [random.choice(inntektsaar) for _ in range(n)]
})

print(testdata)
