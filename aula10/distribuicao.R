# gerar amostra de distribuição normal <- amostragem randomic
# rnorm gera uma mostragem aleatória
# rnorm recebe tres parametros quantidade de valores, media e o desvio padrão
valor_por_pedido <- rnorm(500, mean = 100, sd = 10)

round(valor_por_pedido, 1)

# histograma que mostra a frequencia que aparecem o valor de pedido 
hist(valor_por_pedido)

# calcular o desvio padrão
# sd
sd(valor_por_pedido)

hist(
	valor_por_pedido,
	main = "histograma de valor por pedido", # titulo do histograma
	xlab = "valor (R$)", # label no eixo x 
	ylab = "frequencia", # label no eixo y
	col = "#fff225" # cor das barras
)
