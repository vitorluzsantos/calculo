# função cut serve pra transformar uma variavel em outra de acordo com o intervalo numerico

# dataset padrão do R com dados de uma flor
# -> datasets::iris

df_iris <- datasets::iris

df_iris$nivelAlturaPetala <- factor(
	cut(df_iris$Petal.Length, c(min(df_iris$Petal.Length - 0.1), 2, 4, max(df_iris$Petal.Length))),
	labels = c("Pequena", "Média", "Grande"),
	ordered = TRUE
)

df_iris$nivelAlturaPetala
