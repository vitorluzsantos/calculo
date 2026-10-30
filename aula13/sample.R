n <- 200

opcoes_carro <- c(0:3) # <- criei um vetor que vai de 0 ate 3 

# sample cria uma amostragem aleatoria
# -> os parametros são, valor de base pra gerar a amostragem, quantidade de n adicionados 
amostra_qtd_carros <- sample(opcoes_carro, n, replace = TRUE)

barplot(table(amostra_qtd_carros))
