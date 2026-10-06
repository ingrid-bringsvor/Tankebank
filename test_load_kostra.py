import pandas as pd
from ssb_kostra_python.kommunekorr import kostra_kommunekorr

# Leser inn parquet-filen 
# Endre filsti til relevant fil
deltakere_2024 = pd.read_parquet('/buckets/shared/filepath/file.parquet')
# Fjerner rader med NA i "fnr"
deltakere_2024 = deltakere_2024.dropna(subset=["fnr"])
# Henter ut kun relevante kolonner
deltakere_2024_simple = deltakere_2024[["fylke", "kommune", "bydel", "distrikt", "fnr", "ant_kom"]]

# print(deltakere_2024_simple.head())

# Lager et dataframe som har korrespondansen mellom kommunenummer, fylke, 
# kostra-gruppe og landet med og uten Oslo, for det gitte året
kostra_standard_table = kostra_kommunekorr(2024) 

deltakere_2024_with_correspondance = deltakere_2024_simple.merge(kostra_standard_table, how='left', left_on='kommune', right_on='komm_nr')

print(deltakere_2024_with_correspondance.head())
print(deltakere_2024_with_correspondance.columns)
print(deltakere_2024_with_correspondance.shape)


