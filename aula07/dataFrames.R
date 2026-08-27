# primeiro data frame em R

# pode separar o nome de variavel por . mas não é errado df.teste <- funciona como variavel normal
df_teste <- data.frame(
	nome = c("tom", "bob", "mel", "ana", "dan"),
	idade = c(20, 54, 81, 21, 61),
	salario = c(1000.1, 1400.7, 1050.7, 1800.3, 50000.2)
) # executar sempre na linha final

# ele te avisa caso voce tente criar um dataframe com uma linha com menos ou mais colunas ele 
# ele da um erro e não deixa salvar na memoria    

head(df_teste) # da uma previa do seu data frame <- como o dataframe é pequeno ele printou normal mas ele só printa o começo

dim(df_teste) # fala quantas linhas e quantas colunas tem no dataframe

# acessando colunas com $
df_teste$salario

# calcula a média das colunas
mean(df_teste$idade)
mean(df_teste$salario)

# calcula a mediana
median(df_teste$salario)

# acesso a linha e colunas
# df[linha, coluna]
df_teste[2,2]
df_teste[2]
df_teste[,2]

df_teste[df_teste$idade > 30,]

# menor registro
min(df_teste$idade)
# maior registro
max(df_teste$idade)

# summarização -> resumo estatistico: com todas as colunas com nome, tamanho e tipo
summary(df_teste)

# para adicionar uma nova coluna
df_teste$ganha_bem <- "sim"

# para excluir a coluna
df_teste$ganha_bem <- NULL # null tem que ser maiusculo

# ifelse <- primeiro a condição , resultado true , resultado false
df_teste$ganha_bem <- ifelse(df_teste$salario > 1500, "muito bom", "ganha pouco")

# comando pra plotar o grafico
plot(df_teste)

# media mediana, minimo e maximo

# remover: rm

# como exportar e importar um dataframe
