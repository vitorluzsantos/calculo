set.seed(42)

# idade <- quantitativa discreta
idade <- round(rnorm(n = 70, mean = 30, sd = 2), 0)

# altura <- quantitativa discreta
altura <- round(rnorm(n = 70, mean = 1.75, sd = 0.1), 2)

# peso <- quantitativa continua
peso <- round(rnorm(n = 70, mean = 65.0, sd = 10), 2)

# imc <- quantitativa continua
imc <- round(peso / (altura ^ 2), 2)

# sexo <- qualitativa nominal
# 1 = masculino ; 2 = feminino
generos <- c(1, 2)
sexo <- sample(generos, 70, replace = TRUE, prob = c(0.4, 0.6))
sexo <- factor(sexo, levels = c(1, 2), labels = c("Masculino", "Feminino"))

# escolaridade <- qualitativa ordinal
#	=0=> analfabeto
#	=1=> 1 grau completo
#	=2=> 2 grau completo
#	=3=> 3 grau completo
#	=4=> mestrado
#	=5=> doutorado
#	=6=> pos doutorado
niveis <- c(0, 1, 2, 3, 4, 5, 6)
escolaridade <- sample(niveis, 70, replace = TRUE,
                        prob = c(0.1, 0.2, 0.2, 0.2, 0.1, 0.1, 0.1))
escolaridade <- factor(escolaridade, levels = 0:6,
                        labels = c("Analfabeto", "1 grau", "2 grau",
                                   "3 grau", "Mestrado", "Doutorado",
                                   "Pos-doutorado"),
                        ordered = TRUE)

# profissao <- qualitativa nominal
# 1 = humanas ; 2 = exatas ; 3 = biologicas
tipos <- c(1, 2, 3)
profissao <- sample(tipos, 70, replace = TRUE, prob = c(0.5, 0.3, 0.2))
profissao <- factor(profissao, levels = c(1, 2, 3),
                     labels = c("Humanas", "Exatas", "Biologicas"))

# fumante <- qualitativa ordinal
# 0 = nao ; 1 = sim
fuma <- c(0, 1)
fumante <- sample(fuma, 70, replace = TRUE, prob = c(0.7, 0.3))
fumante <- factor(fumante, levels = c(0, 1), labels = c("Nao", "Sim"),
                   ordered = TRUE)

# salario <- quantitativa continua
salario <- round(rnorm(n = 70, mean = 4000.00, sd = 1000), 2)

# carros <- quantitativa discreta
quantidade <- c(0, 1, 2, 3, 4)
carros <- sample(quantidade, 70, replace = TRUE, prob = c(0.3, 0.4, 0.1, 0.1, 0.1))

# filhos <- quantitativa discreta
nFilhos <- c(0, 1, 2, 3)
filhos <- sample(nFilhos, 70, replace = TRUE, prob = c(0.4, 0.3, 0.2, 0.1))

# persona = jovens adultos
df_adultos <- data.frame(
  idade,
  altura,
  peso,
  imc,
  sexo,
  escolaridade,
  profissao,
  fumante,
  salario,
  carros,
  filhos
)

str(df_adultos)

par(mfrow = c(2, 2))

# histograma da idade
hist(df_adultos$idade, main = "Idade (anos)", xlab = "Idade",
     col = "steelblue", border = "white")

# histograma da altura
hist(df_adultos$altura, main = "Altura (m)", xlab = "Altura",
     col = "steelblue", border = "white")

# histograma do peso
hist(df_adultos$peso, main = "Peso (kg)", xlab = "Peso",
     col = "steelblue", border = "white")

# histograma do imc
hist(df_adultos$imc, main = "IMC", xlab = "IMC",
     col = "steelblue", border = "white")

# histograma do salario
hist(df_adultos$salario, main = "Salario (R$)", xlab = "Salario",
     col = "steelblue", border = "white")

# histograma da quantidade de carros
hist(df_adultos$carros, breaks = seq(-0.5, 4.5, by = 1),
     main = "Quantidade de carros", xlab = "Carros",
     col = "steelblue", border = "white")

# histograma da quantidade de filhos
hist(df_adultos$filhos, breaks = seq(-0.5, 3.5, by = 1),
     main = "Quantidade de filhos", xlab = "Filhos",
     col = "steelblue", border = "white")

# grafico de barras do sexo
barplot(table(df_adultos$sexo), main = "Sexo", col = "darkorange",
        ylab = "Frequencia")

# grafico de barras da escolaridade
barplot(table(df_adultos$escolaridade), main = "Escolaridade",
        col = "darkorange", las = 2, ylab = "Frequencia")

# grafico de barras da profissao
barplot(table(df_adultos$profissao), main = "Area de formacao",
        col = "darkorange", ylab = "Frequencia")

# grafico de barras do fumante
barplot(table(df_adultos$fumante), main = "Fumante", col = "darkorange",
        ylab = "Frequencia")

par(mfrow = c(1, 1))
