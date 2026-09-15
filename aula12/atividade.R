# Escolha um dataset disponível no R:
#		Pode ser um que já contenha variáveis de diferentes tipos (nominal, ordinal, discreta, contínua).
#		Caso o dataset não possua todos os tipos, crie variáveis adicionais (ex.: converter uma variável contínua em ordinal com cut(), criar um identificador numérico discreto etc.).
#
# Classifique as variáveis do dataset segundo seus tipos:
#
# -> Contínua
# -> Discreta
# -> Nominal
# -> Ordinal
#
# Visualização gráfica:
#		Para variáveis contínuas → construa histogramas para observar a distribuição.
#		Para variáveis nominais, ordinais ou discretas → construa gráficos de barras mostrando a frequência das categorias.
#		Explique brevemente o que cada gráfico mostra sobre os dados.

df_penguins <- datasets::penguins

df_penguins$faixaPeso <- factor(
	cut(df_penguins$body_mass, c(2000, 3500, 4500, 5000)),
	labels = c("Peso Baixo", "Peso Médio", "Peso Alto"),
	ordered = TRUE
)

# species <- qualitativa nominal
# faixaPeso <- qualitativa ordinal
# bill_len <- quantitativa continua
# body_mass <- quantitativa discreta
 
# histograma que mostra o tamanho dos bicos <- continua
hist(
	df_penguins$bill_len,
	main = "Tamanho dos bicos - continua",
	xlab = "tamanho",
	ylab = "quantidade",
	col = "orange"
)

# grafico de barras da massa corporea <- discreta
barplot(
	table(df_penguins$body_mass),
	main = "Massa corporea - discreta",
	xlab = "massa",
	ylab = "frequencia",
	col = "lightblue"
)

# grafico de barras da especie <- nominal
barplot(
	table(df_penguins$species),
	main = "Espécies - nominal",
	xlab = "especie",
	ylab = "frequencia",
	col = "lightgreen"
)

# grafico de barras faixa de peso <- ordinal
barplot(
	table(df_penguins$faixaPeso),
	main = "Faixa de peso - ordinal",
	xlab = "faixa de peso",
	ylab = "frequencia",
	col = "lightpink"
)

