import pandas as pd

# series <- é uma coluna com indice
series = pd.Series([10,20,30], index = ["a","b","c"])

print(series)

# dataFrame <- funciona igual no r
dataFrame = pd.DataFrame({
    'nome': ['vitor', 'jablobe', 'pedrao'],
    'idade': [18, 18, 18]
})

print(dataFrame)
