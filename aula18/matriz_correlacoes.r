df_vinho <- read.csv("datassets/winequality-red.csv", sep = ";")

matriz_correlacao_vinho <- cor(df_vinho)
library(corrplot)

corrplot(
	matriz_correlacao_vinho,
	method = "color",
	# addCoef.col = "black", # faz aparecer os valores
	tl.srt = 45 # faz aparecer a a barrinha com o fade
	)

cor(df_vinho$fixed.acidity, df_vinho$pH)

# o nivel de ph depende do nivel de acidez?
#								variavel dependente ~ variavel independente
regressao <- lm(df_vinho$pH ~ df_vinho$fixed.acidity)
summary(regressao)

