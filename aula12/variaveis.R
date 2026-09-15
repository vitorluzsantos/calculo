# possiveis conclusões de uma analise 

# distribuição normal 
# -> quando a media está proxima da mediana

# distribuição simetrica
# -> quando a media e a mediana são iguais 

# assimetrica positiva 
# -> quando a media é maior que a mediana

# assimetrica negativa
# -> quando a media é menor que a mediana

df_cliente <- data.frame(
	nome = c("bob", "tom", "ian", "mel", "dan"), # qualitativa nominal
	idade = c(20, 30, 25, 17, 50), # quantitativa discreta
	salario = c(3000.4, 4500.1, 5000.1, 1500.7, 8000.5), # quantitativa continua
	area = factor(
		c("humanas", "exatas", "biologicas", "humanas", "exatas"),
		labels = c("humanas", "exatas", "biologicas") # <- aqui eu defino quais são as colunas
	),
	plano = factor(
		c("prata", "bronze", "prata", "ouro", "bronze"),
		labels = c("prata", "bronze", "ouro"),
		ordered = TRUE # <- por padrão quando você cria um factor ele vem como FALSE
	)
)

df_cliente$area
df_cliente$plano # <- ele mostra a ordem das categorias



