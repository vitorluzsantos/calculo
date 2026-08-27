agora = {
    "Itaúsa",
    "Ecorodovias",
    "Taesa",
    "B3",
    "Vale"
}

ativa = {
    "B3",
    "Bradesco",
    "BB Seguridade",
    "BR Distribuidora",
    "Taesa",
    "CTEEP",
    "Vale",
    "Telefônica Brasil",
    "CPFL"
}

genial = {
    "CPFL",
    "Minerva",
    "Cyrela",
    "Randon",
    "CTEEP"
}

easynvest = {
    "B3",
    "Brasil Agro",
    "Coca-cola",
    "Taesa",
    "Vale",
    "Copel",
    "Itaúsa",
    "Ambev"
}

elite = {
    "Bradesco",
    "BB Seguridade",
    "Banrisul",
    "Engie",
    "Itaúsa",
    "Sanepar",
    "Taesa",
    "CTEEP",
    "Telêfonica Brasil",
    "Vale"
}

guide = {
    "Alupar",
    "Banco do Brasil",
    "Cyrela",
    "CPFL",
    "Klabin",
    "Porto seguro",
    "Tim",
    "Vale"
}

novaFutura = {
    "B3",
    "Cyrela",
    "Gerdau",
    "Vivo",
    "CTEEP"
}

orama = {
    "Banco ABC",
    "Bradesco",
    "Minerva",
    "CESP",
    "Engie"
}

# 1.
intersessoes = agora.intersection(agora, ativa, elite, guide)
print(intersessoes)

#2. 
isAcaoUnica = agora.isdisjoint(ativa)
print(isAcaoUnica)
# agora, ativa, elite, guide

# 3.
relacaoGenialAgora = genial.issuperset(agora)
print("Genial é superset de agora? ", relacaoGenialAgora)
relacaoEliteGuide = elite.issubset(guide)
print("Elite é subset de guide?", relacaoEliteGuide)

# 4. 
acoesUnicas = genial.difference(agora, ativa, elite, guide)
print(acoesUnicas)
