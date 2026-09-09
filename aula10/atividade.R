dfTurma <- read.csv("entregas-ccoa.csv")
head(dfTurma)

# 1. 

# entrega 01
mean(dfTurma$Entrega.01)
median(dfTurma$Entrega.01)
sd(dfTurma$Entrega.01)
# entrega 02
mean(dfTurma$Entrega.02)
median(dfTurma$Entrega.02)
sd(dfTurma$Entrega.02)
# entrega 03
mean(dfTurma$Entrega.03)
median(dfTurma$Entrega.03)
sd(dfTurma$Entrega.03)

# as notas são parecidas entre os alunos ou muito diferentes?
# -> nas entregas 01 e 03 as notas são muito diferentes

# existe alguma entrega com maior variação de notas?
# -> sim a entrega 03

# a média representa bem os dados em todos os casos?
# -> não nas entregas 01 e 03 o desvio padrao é muito alto e por isso não da pra confiar no resultado da média

# o desvio padrão ajuda a entender o comportamento das notas? como?
# -> sim, ele determina o quão proximo os valores estão proximos da media

# existe alguma evidencia de distribuição normal? justifique com base nos gráficos
# -> o grafico 03 é o mais proximo por concentrar os dados no centro e distribuir nas pontas mas não é simetrico por isso não é uma distribuição normal

# 1.

hist(dfTurma$Entrega.01,
	main = "entrega 01",
	xlab = "notas",
	ylab = "frequencia",
	col = "#0000ff"
)

hist(dfTurma$Entrega.02,
	main = "entrega 02",
	xlab = "notas",
	ylab = "frequencia",
	col = "#ff0000"
)

hist(dfTurma$Entrega.03,
	main = "entrega 03",
	xlab = "notas",
	ylab = "frequencia",
	col = "#00ff00"
)

# 2.

abline(v = mean(dfTurma$Entrega.01), col = "grey", lwd = 2)
abline(v = median(dfTurma$Entrega.01), col = "brown", lty = 2, lwd = 2 )

abline(v = mean(dfTurma$Entrega.02), col = "grey", lwd = 2)
abline(v = median(dfTurma$Entrega.02), col = "brown", lty = 2, lwd = 2 )

abline(v = mean(dfTurma$Entrega.03), col = "grey", lwd = 2)
abline(v = median(dfTurma$Entrega.03), col = "brown", lty = 2, lwd = 2 )

# parece simetrica (normal)?
# -> não nenhum grafico é simetrico

# existe assimetria? para qual lado?
# -> sim, para o lado direito do histograma

dfTurma$Media.final <- (dfTurma$Entrega.01 + dfTurma$Entrega.02 + dfTurma$Entrega.03)/3

max(dfTurma$Media.final)
min(dfTurma$Media.final)

hist(
	dfTurma$Media.final,
	main = "medias finais da turma",
	xlab = "media",
	ylab = "frequencia"
)
